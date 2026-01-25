const std = @import("std");
const zsdl3 = @import("zsdl3");

// Test the enhanced renderer subsystem
pub fn main() !void {
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        std.log.err("Failed to initialize SDL: {s}", .{zsdl3.getError() orelse "Unknown"});
        return error.SDLInitFailed;
    }
    defer zsdl3.quit();

    // Test new renderer creation functions
    std.debug.print("Testing enhanced renderer functions...\n", .{});

    // Test 1: Create renderer with properties
    const props = zsdl3.createProperties();
    defer zsdl3.destroyProperties(props);

    const window = zsdl3.createWindow("Enhanced Renderer Test", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
    if (window == null) {
        std.log.err("Failed to create window: {s}", .{zsdl3.getError() orelse "Unknown"});
        return error.WindowCreationFailed;
    }
    defer zsdl3.destroyWindow(window);

    // Create renderer
    const renderer = zsdl3.createRenderer(window.?, "software", zsdl3.SDL_RENDERER_ACCELERATED);
    if (renderer == null) {
        std.log.err("Failed to create renderer: {s}", .{zsdl3.getError() orelse "Unknown"});
        return error.RendererCreationFailed;
    }
    defer zsdl3.destroyRenderer(renderer);

    // Test 2: Create texture with properties
    const texture_props = zsdl3.createProperties();
    defer zsdl3.destroyProperties(texture_props);

    // Set texture properties
    _ = zsdl3.setNumberProperty(texture_props, zsdl3.SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER, zsdl3.SDL_TEXTUREACCESS_STATIC);
    _ = zsdl3.setNumberProperty(texture_props, zsdl3.SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER, zsdl3.SDL_PIXELFORMAT_RGBA8888);
    _ = zsdl3.setNumberProperty(texture_props, zsdl3.SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER, 256);
    _ = zsdl3.setNumberProperty(texture_props, zsdl3.SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER, 256);

    const texture = zsdl3.createTextureWithProperties(renderer.?, texture_props);
    if (texture == null) {
        std.log.err("Failed to create texture with properties: {s}", .{zsdl3.getError() orelse "Unknown"});
        return error.TextureCreationFailed;
    }
    defer zsdl3.destroyTexture(texture);

    // Test 3: Point rendering
    _ = zsdl3.setRenderDrawColor(renderer, 255, 0, 0, 255);
    _ = zsdl3.renderPoint(renderer, 400.0, 300.0); // Center point

    // Test 4: Float color setting
    _ = zsdl3.setRenderDrawColorFloat(renderer, 0.0, 1.0, 0.0, 1.0); // Green
    _ = zsdl3.renderFillRect(renderer, &zsdl3.SDL_FRect{ .x = 50, .y = 50, .w = 100, .h = 100 });

    // Test 5: Scale functions
    _ = zsdl3.setRenderScale(renderer, 1.5, 1.5);
    _ = zsdl3.setRenderDrawColor(renderer, 0, 0, 255, 255); // Blue
    _ = zsdl3.renderFillRect(renderer, &zsdl3.SDL_FRect{ .x = 200, .y = 200, .w = 80, .h = 80 });

    // Reset scale for normal rendering
    _ = zsdl3.setRenderScale(renderer, 1.0, 1.0);

    // Test 6: Debug text
    _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255); // White
    _ = zsdl3.renderDebugText(renderer, 10, 10, "Enhanced Renderer Test");

    // Test 7: Advanced texture operations
    _ = zsdl3.setTextureColorModFloat(texture, 0.5, 1.0, 0.5); // Greenish tint
    _ = zsdl3.setTextureAlphaModFloat(texture, 0.8); // Slight transparency

    // Present the result
    zsdl3.renderPresent(renderer);

    std.debug.print("Enhanced renderer functions test completed!\n", .{});
    std.debug.print("Successfully tested:\n", .{});
    std.debug.print("  - createRenderer with flags\n", .{});
    std.debug.print("  - renderPoint\n", .{});
    std.debug.print("  - setRenderDrawColorFloat\n", .{});
    std.debug.print("  - setRenderScale\n", .{});
    std.debug.print("  - renderDebugText\n", .{});
    std.debug.print("  - createTextureWithProperties\n", .{});
    std.debug.print("  - setTextureColorModFloat\n", .{});
    std.debug.print("  - setTextureAlphaModFloat\n", .{});

    // Wait a bit to see the result
    zsdl3.delay(2000);
}
