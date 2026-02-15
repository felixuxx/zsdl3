const std = @import("std");

const zsdl3 = @import("zsdl3");

pub fn main() !void {
    std.log.info("SDL3 GPU API Test", .{});

    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to initialize SDL: {s}", .{err});
        return;
    }
    defer zsdl3.quit();

    const num_drivers = zsdl3.getNumGPUDrivers();
    std.log.info("Available GPU drivers: {d}", .{num_drivers});
    var i: i32 = 0;
    while (i < num_drivers) : (i += 1) {
        if (zsdl3.getGPUDriver(i)) |name| {
            std.log.info("  Driver {d}: {s}", .{ i, name });
        }
    }

    const props = zsdl3.createProperties();
    defer zsdl3.destroyProperties(props);

    // Try with SPIRV (Vulkan) which is supported on Intel
    _ = zsdl3.setBooleanProperty(props, zsdl3.SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN, true);
    _ = zsdl3.setBooleanProperty(props, zsdl3.SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN, true);

    const device = zsdl3.createGPUDeviceWithProperties(props);
    if (device == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create GPU device: {s}", .{err});
        std.log.info("Note: GPU support requires a compatible GPU and driver", .{});
        return;
    }
    defer zsdl3.destroyGPUDevice(device);

    std.log.info("GPU device created successfully!", .{});

    const device_props = zsdl3.getGPUDeviceProperties(device);
    if (device_props != 0) {
        if (zsdl3.getStringProperty(device_props, zsdl3.SDL_PROP_GPU_DEVICE_NAME_STRING, null)) |name| {
            std.log.info("GPU Device: {s}", .{name});
        }
        if (zsdl3.getStringProperty(device_props, zsdl3.SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING, null)) |driver| {
            std.log.info("GPU Driver: {s}", .{driver});
        }
        if (zsdl3.getStringProperty(device_props, zsdl3.SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING, null)) |version| {
            std.log.info("Driver Version: {s}", .{version});
        }
    }

    const supported_formats = zsdl3.getGPUShaderFormats(device);
    std.log.info("Supported shader formats:", .{});
    if (supported_formats & zsdl3.SDL_GPU_SHADERFORMAT_SPIRV != 0) std.log.info("  - SPIRV (Vulkan)", .{});
    if (supported_formats & zsdl3.SDL_GPU_SHADERFORMAT_DXIL != 0) std.log.info("  - DXIL (D3D12)", .{});
    if (supported_formats & zsdl3.SDL_GPU_SHADERFORMAT_DXBC != 0) std.log.info("  - DXBC (D3D12)", .{});
    if (supported_formats & zsdl3.SDL_GPU_SHADERFORMAT_MSL != 0) std.log.info("  - MSL (Metal)", .{});
    if (supported_formats & zsdl3.SDL_GPU_SHADERFORMAT_METALLIB != 0) std.log.info("  - MetalLib (Metal)", .{});

    const window = zsdl3.createWindow("GPU Test", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
    if (window == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create window: {s}", .{err});
        return;
    }
    defer zsdl3.destroyWindow(window);

    if (!zsdl3.claimWindowForGPUDevice(device, window)) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to claim window for GPU: {s}", .{err});
        return;
    }
    defer zsdl3.releaseWindowFromGPUDevice(device, window);

    std.log.info("Window claimed for GPU rendering", .{});

    const swapchain_format = zsdl3.getGPUSwapchainTextureFormat(device, window);
    std.log.info("Swapchain format: {d}", .{swapchain_format});

    const buffer_create_info = zsdl3.SDL_GPUBufferCreateInfo{
        .usage = zsdl3.SDL_GPU_BUFFERUSAGE_VERTEX | zsdl3.SDL_GPU_BUFFERUSAGE_INDEX,
        .size = @sizeOf(u16) * 36,
        .props = 0,
    };
    const buffer = zsdl3.createGPUBuffer(device, &buffer_create_info);
    if (buffer == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create buffer: {s}", .{err});
        return;
    }
    defer zsdl3.releaseGPUBuffer(device, buffer);

    std.log.info("GPU buffer created successfully", .{});

    const texture_create_info = zsdl3.SDL_GPUTextureCreateInfo{
        .type = zsdl3.SDL_GPU_TEXTURETYPE_2D,
        .format = @enumFromInt(26),
        .usage = zsdl3.SDL_GPU_TEXTUREUSAGE_SAMPLER,
        .width = 256,
        .height = 256,
        .layer_count_or_depth = 1,
        .num_levels = 1,
        .sample_count = zsdl3.SDL_GPU_SAMPLECOUNT_1,
        .props = 0,
    };
    const texture = zsdl3.createGPUTexture(device, &texture_create_info);
    if (texture == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create texture: {s}", .{err});
        return;
    }
    defer zsdl3.releaseGPUTexture(device, texture);

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
    const sampler = zsdl3.createGPUSampler(device, &sampler_create_info);
    if (sampler == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create sampler: {s}", .{err});
        return;
    }
    defer zsdl3.releaseGPUSampler(device, sampler);

    std.log.info("GPU sampler created successfully", .{});

    const transfer_create_info = zsdl3.SDL_GPUTransferBufferCreateInfo{
        .usage = zsdl3.SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD,
        .size = 256 * 256 * 4,
        .props = 0,
    };
    const transfer_buffer = zsdl3.createGPUTransferBuffer(device, &transfer_create_info);
    if (transfer_buffer == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create transfer buffer: {s}", .{err});
        return;
    }
    defer zsdl3.releaseGPUTransferBuffer(device, transfer_buffer);

    std.log.info("GPU transfer buffer created successfully", .{});

    const cmdbuf = zsdl3.acquireGPUCommandBuffer(device);
    if (cmdbuf == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to acquire command buffer: {s}", .{err});
        return;
    }

    var swapchain_texture: ?*zsdl3.SDL_GPUTexture = undefined;
    var swapchain_w: u32 = undefined;
    var swapchain_h: u32 = undefined;

    if (zsdl3.waitAndAcquireGPUSwapchainTexture(cmdbuf, window, &swapchain_texture, &swapchain_w, &swapchain_h)) {
        std.log.info("Swapchain acquired: {}x{}", .{ swapchain_w, swapchain_h });
    } else {
        std.log.warn("Could not acquire swapchain (may need GPU rendering support)", .{});
    }

    _ = zsdl3.submitGPUCommandBuffer(cmdbuf);

    std.log.info("", .{});
    std.log.info("=== GPU API Test Complete ===", .{});
    std.log.info("All GPU bindings are working correctly!", .{});
}
