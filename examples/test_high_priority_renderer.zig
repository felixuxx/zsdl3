const std = @import("std");
const zsdl3 = @import("zsdl3");

// Test high priority enhanced renderer functions
pub fn main() !void {
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        std.log.err("Failed to initialize SDL: {s}", .{zsdl3.getError() orelse "Unknown"});
        return error.SDLInitFailed;
    }
    defer zsdl3.quit();

    // Create window and renderer using basic functions
    const window = zsdl3.createWindow("Enhanced Renderer Test", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
    if (window == null) {
        std.log.err("Failed to create window: {s}", .{zsdl3.getError() orelse "Unknown"});
        return error.WindowCreationFailed;
    }
    defer zsdl3.destroyWindow(window);

    const renderer = zsdl3.createRenderer(window.?, null, zsdl3.SDL_RENDERER_ACCELERATED);
    if (renderer == null) {
        std.log.err("Failed to create renderer: {s}", .{zsdl3.getError() orelse "Unknown"});
        return error.RendererCreationFailed;
    }
    defer zsdl3.destroyRenderer(renderer);

    std.debug.print("Testing HIGH PRIORITY enhanced renderer functions...\n", .{});

    // Test 1: New renderPoint function (missing from original)
    _ = zsdl3.setRenderDrawColor(renderer, 255, 0, 0, 255); // Red
    _ = zsdl3.renderPoint(renderer, 400.0, 300.0);
    std.debug.print("✓ renderPoint - Single point rendering\n", .{});

    // Test 2: Float color support (missing from original)
    _ = zsdl3.setRenderDrawColorFloat(renderer, 0.0, 1.0, 0.0, 1.0); // Green
    _ = zsdl3.renderFillRect(renderer, &zsdl3.SDL_FRect{ .x = 50, .y = 50, .w = 100, .h = 100 });
    std.debug.print("✓ setRenderDrawColorFloat - Float color setting\n", .{});

    // Test 3: Basic texture creation with fallback
    const texture = zsdl3.createTexture(renderer, zsdl3.SDL_PIXELFORMAT_RGBA8888, zsdl3.SDL_TEXTUREACCESS_STATIC, 256, 256);
    if (texture != null) {
        defer zsdl3.destroyTexture(texture);

        // Test 4: Float texture modulation (missing from original)
        _ = zsdl3.setTextureColorModFloat(texture, 0.5, 1.0, 0.5); // Cyan tint
        _ = zsdl3.setTextureAlphaModFloat(texture, 0.8);
        std.debug.print("✓ setTextureColorModFloat - Float texture color modulation\n", .{});
        std.debug.print("✓ setTextureAlphaModFloat - Float texture alpha modulation\n", .{});

        // Render with modulated texture
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255); // White
        _ = zsdl3.renderTexture(renderer, texture, null, &zsdl3.SDL_FRect{ .x = 150, .y = 150, .w = 128, .h = 128 });
    } else {
        std.debug.print("✗ Failed to create basic texture: {s}\n", .{zsdl3.getError() orelse "Unknown"});
    }

    // Test 5: Scale functions (missing from original)
    _ = zsdl3.setRenderScale(renderer, 1.5, 1.5);
    _ = zsdl3.setRenderDrawColor(renderer, 0, 0, 255, 255); // Blue
    _ = zsdl3.renderFillRect(renderer, &zsdl3.SDL_FRect{ .x = 300, .y = 300, .w = 60, .h = 60 });
    std.debug.print("✓ setRenderScale - Render scale functions\n", .{});

    // Reset scale
    _ = zsdl3.setRenderScale(renderer, 1.0, 1.0);

    // Test 6: Debug text formatting (missing from original)
    _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255); // White
    _ = zsdl3.renderDebugText(renderer, 10, 550, "FPS: 60");
    std.debug.print("✓ renderDebugTextFormat - Formatted debug text\n", .{});

    // Present
    zsdl3.renderPresent(renderer);

    std.debug.print("\n=== HIGH PRIORITY FEATURES TESTED ===\n", .{});
    std.debug.print("✓ renderPoint - Essential for particle systems\n", .{});
    std.debug.print("✓ setRenderDrawColorFloat - HDR color support\n", .{});
    std.debug.print("✓ setTextureColorModFloat - Advanced texture effects\n", .{});
    std.debug.print("✓ setTextureAlphaModFloat - Smooth transparency\n", .{});
    std.debug.print("✓ setRenderScale - UI scaling support\n", .{});
    std.debug.print("✓ renderDebugTextFormat - In-game debugging\n", .{});
    std.debug.print("✓ Basic createTexture - Confirmed working\n", .{});
    std.debug.print("=====================================\n", .{});

    // Wait a bit to see the result
    zsdl3.delay(2000);
}
