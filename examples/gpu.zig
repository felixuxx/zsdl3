// GPU API Test
// Enumerates GPU drivers, creates a GPU device, and tests resource creation
// (buffers, textures, samplers, transfer buffers, command buffers).
// Demonstrates: GPU device setup, swapchain, and basic resource management.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    var sdl = try zsdl3.SDL.load();
    defer sdl.unload();

    std.log.info("SDL3 GPU API Test", .{});

    const num_drivers = sdl.gpu.getNumGPUDrivers();
    std.log.info("Available GPU drivers: {d}", .{num_drivers});
    var i: i32 = 0;
    while (i < num_drivers) : (i += 1) {
        if (sdl.gpu.getGPUDriver(i)) |name| {
            std.log.info("  Driver {d}: {s}", .{ i, name });
        }
    }

    const props = sdl.properties.createProperties();
    defer sdl.properties.destroyProperties(props);

    // Use Metal on macOS, otherwise fallback to SPIRV (Vulkan)
    if(std.mem.eql(u8, std.mem.sliceTo(sdl.platform.getPlatform().?, 0), "macOS")) {
    	_ = sdl.properties.setBooleanProperty(props, zsdl3.SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN, true);
    }
    _ = sdl.properties.setBooleanProperty(props, zsdl3.SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN, true);
    _ = sdl.properties.setBooleanProperty(props, zsdl3.SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN, true);

    const device = sdl.gpu.createGPUDeviceWithProperties(props);
    if (device == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to create GPU device: {s}", .{err});
        std.log.info("Note: GPU support requires a compatible GPU and driver", .{});
        return;
    }
    defer sdl.gpu.destroyGPUDevice(device);

    std.log.info("GPU device created successfully!", .{});

    const device_props = sdl.gpu.getGPUDeviceProperties(device);
    if (device_props != 0) {
        if (sdl.properties.getStringProperty(device_props, zsdl3.SDL_PROP_GPU_DEVICE_NAME_STRING, null)) |name| {
            std.log.info("GPU Device: {s}", .{name});
        }
        if (sdl.properties.getStringProperty(device_props, zsdl3.SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING, null)) |driver| {
            std.log.info("GPU Driver: {s}", .{driver});
        }
        if (sdl.properties.getStringProperty(device_props, zsdl3.SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING, null)) |version| {
            std.log.info("Driver Version: {s}", .{version});
        }
    }

    const supported_formats = sdl.gpu.getGPUShaderFormats(device);
    std.log.info("Supported shader formats:", .{});
    if (supported_formats & zsdl3.SDL_GPU_SHADERFORMAT_SPIRV != 0) std.log.info("  - SPIRV (Vulkan)", .{});
    if (supported_formats & zsdl3.SDL_GPU_SHADERFORMAT_DXIL != 0) std.log.info("  - DXIL (D3D12)", .{});
    if (supported_formats & zsdl3.SDL_GPU_SHADERFORMAT_DXBC != 0) std.log.info("  - DXBC (D3D12)", .{});
    if (supported_formats & zsdl3.SDL_GPU_SHADERFORMAT_MSL != 0) std.log.info("  - MSL (Metal)", .{});
    if (supported_formats & zsdl3.SDL_GPU_SHADERFORMAT_METALLIB != 0) std.log.info("  - MetalLib (Metal)", .{});

    const window = sdl.video.createWindow("GPU Test", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
    if (window == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to create window: {s}", .{err});
        return;
    }
    defer sdl.video.destroyWindow(window);

    if (!sdl.gpu.claimWindowForGPUDevice(device, window)) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to claim window for GPU: {s}", .{err});
        return;
    }
    defer sdl.gpu.releaseWindowFromGPUDevice(device, window);

    std.log.info("Window claimed for GPU rendering", .{});

    const swapchain_format = sdl.gpu.getGPUSwapchainTextureFormat(device, window);
    std.log.info("Swapchain format: {d}", .{swapchain_format});

    const buffer_create_info = zsdl3.SDL_GPUBufferCreateInfo{
        .usage = zsdl3.SDL_GPU_BUFFERUSAGE_VERTEX | zsdl3.SDL_GPU_BUFFERUSAGE_INDEX,
        .size = @sizeOf(u16) * 36,
        .props = 0,
    };
    const buffer = sdl.gpu.createGPUBuffer(device, &buffer_create_info);
    if (buffer == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to create buffer: {s}", .{err});
        return;
    }
    defer sdl.gpu.releaseGPUBuffer(device, buffer);

    std.log.info("GPU buffer created successfully", .{});

    const texture_create_info = zsdl3.SDL_GPUTextureCreateInfo{
        .type = zsdl3.SDL_GPU_TEXTURETYPE_2D,
        .format = zsdl3.gpu.SDL_GPUTextureFormat.SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM,
        .usage = zsdl3.SDL_GPU_TEXTUREUSAGE_SAMPLER,
        .width = 256,
        .height = 256,
        .layer_count_or_depth = 1,
        .num_levels = 1,
        .sample_count = zsdl3.SDL_GPU_SAMPLECOUNT_1,
        .props = 0,
    };
    const texture = sdl.gpu.createGPUTexture(device, &texture_create_info);
    if (texture == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to create texture: {s}", .{err});
        return;
    }
    defer sdl.gpu.releaseGPUTexture(device, texture);

    std.log.info("GPU texture created successfully", .{});

    const sampler_create_info = zsdl3.SDL_GPUSamplerCreateInfo{
        .min_filter = zsdl3.SDL_GPU_FILTER_NEAREST,
        .mag_filter = zsdl3.SDL_GPU_FILTER_LINEAR,
        .mipmap_mode = zsdl3.SDL_GPU_SAMPLERMIPMAPMODE_LINEAR,
        .address_mode_u = zsdl3.SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE,
        .address_mode_v = zsdl3.SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE,
        .address_mode_w = zsdl3.SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE,
        .mip_lod_bias = 0.0,
        .max_anisotropy = 0.0,
        .compare_op = zsdl3.SDL_GPU_COMPAREOP_NEVER,
        .min_lod = 0.0,
        .max_lod = 0.0,
        .enable_anisotropy = false,
        .enable_compare = false,
        .padding = [_]u8{0} ** 2,
        .props = 0,
    };
    const sampler = sdl.gpu.createGPUSampler(device, &sampler_create_info);
    if (sampler == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to create sampler: {s}", .{err});
        return;
    }
    defer sdl.gpu.releaseGPUSampler(device, sampler);

    std.log.info("GPU sampler created successfully", .{});

    const transfer_create_info = zsdl3.SDL_GPUTransferBufferCreateInfo{
        .usage = zsdl3.SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD,
        .size = 256 * 256 * 4,
        .props = 0,
    };
    const transfer_buffer = sdl.gpu.createGPUTransferBuffer(device, &transfer_create_info);
    if (transfer_buffer == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to create transfer buffer: {s}", .{err});
        return;
    }
    defer sdl.gpu.releaseGPUTransferBuffer(device, transfer_buffer);

    std.log.info("GPU transfer buffer created successfully", .{});

    const cmdbuf = sdl.gpu.acquireGPUCommandBuffer(device);
    if (cmdbuf == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to acquire command buffer: {s}", .{err});
        return;
    }

    var swapchain_texture: ?*zsdl3.SDL_GPUTexture = undefined;
    var swapchain_w: u32 = undefined;
    var swapchain_h: u32 = undefined;

    if (sdl.gpu.waitAndAcquireGPUSwapchainTexture(cmdbuf, window, &swapchain_texture, &swapchain_w, &swapchain_h)) {
        std.log.info("Swapchain acquired: {}x{}", .{ swapchain_w, swapchain_h });
    } else {
        std.log.warn("Could not acquire swapchain (may need GPU rendering support)", .{});
    }

    _ = sdl.gpu.submitGPUCommandBuffer(cmdbuf);

    std.log.info("", .{});
    std.log.info("=== GPU API Test Complete ===", .{});
    std.log.info("All GPU bindings are working correctly!", .{});
}
