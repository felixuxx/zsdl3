// Enhanced Renderer Visual Test
// Clean 2x3 grid layout demonstrating: draw primitives, viewport,
// clip rect, textures, color scale, and debug text.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() void {
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) return;
    defer zsdl3.quit();

    const window = zsdl3.createWindow("Renderer Test", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE) orelse return;
    defer zsdl3.destroyWindow(window);

    const renderer = zsdl3.createRenderer(window, null) orelse return;
    defer zsdl3.destroyRenderer(renderer);

    // Renderer info
    if (zsdl3.getRendererName(renderer)) |name| {
        std.log.info("Renderer: {s}", .{name});
    }
    const num_drivers = zsdl3.getNumRenderDrivers();
    std.log.info("Render drivers: {d}", .{num_drivers});

    // Create texture
    const tex_w = 64;
    const tex_h = 64;
    var tex_pixels: [tex_w * tex_h * 4]u8 = undefined;
    for (0..tex_h) |y| {
        for (0..tex_w) |x| {
            const i = (y * tex_w + x) * 4;
            tex_pixels[i] = @intCast(x * 4);
            tex_pixels[i + 1] = @intCast(y * 4);
            tex_pixels[i + 2] = 128;
            tex_pixels[i + 3] = 255;
        }
    }
    const tex: ?*zsdl3.SDL_Texture = zsdl3.createTexture(renderer, zsdl3.SDL_PIXELFORMAT_RGBA8888, zsdl3.SDL_TEXTUREACCESS_STATIC, tex_w, tex_h);
    if (tex) |t| {
        _ = zsdl3.updateTexture(t, null, &tex_pixels, tex_w * 4);
        _ = zsdl3.setTextureScaleMode(t, zsdl3.SDL_SCALEMODE_LINEAR);
        _ = zsdl3.setTextureColorMod(t, 200, 200, 255);
    }

    std.log.info("=== Rendering (ESC or close window to quit) ===", .{});

    var running = true;
    while (running) {
        var event: zsdl3.SDL_Event = undefined;
        while (zsdl3.pollEvent(&event)) {
            switch (event.type) {
                zsdl3.SDL_EVENT_QUIT => running = false,
                zsdl3.SDL_EVENT_KEY_DOWN => {
                    if (event.key.scancode == zsdl3.SDL_SCANCODE_ESCAPE) running = false;
                },
                else => {},
            }
        }

        // Clear entire window to border color
        _ = zsdl3.setRenderDrawColor(renderer, 80, 80, 80, 255);
        _ = zsdl3.renderClear(renderer);

        // Fill 6 cell backgrounds (each 400x200, with 2px gap between cells)
        // Row 0
        _ = zsdl3.setRenderDrawColor(renderer, 25, 25, 45, 255); // navy
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 1, .y = 1, .w = 398, .h = 198 }); // primitives

        _ = zsdl3.setRenderDrawColor(renderer, 25, 45, 25, 255); // green
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 401, .y = 1, .w = 398, .h = 198 }); // viewport

        // Row 1
        _ = zsdl3.setRenderDrawColor(renderer, 50, 25, 25, 255); // maroon
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 1, .y = 201, .w = 398, .h = 198 }); // clip

        _ = zsdl3.setRenderDrawColor(renderer, 25, 40, 50, 255); // teal
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 401, .y = 201, .w = 398, .h = 198 }); // textures

        // Row 2
        _ = zsdl3.setRenderDrawColor(renderer, 50, 25, 50, 255); // purple
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 1, .y = 401, .w = 398, .h = 198 }); // color scale

        _ = zsdl3.setRenderDrawColor(renderer, 50, 40, 25, 255); // brown
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 401, .y = 401, .w = 398, .h = 198 }); // debug text

        // ---- Cell (0,0): Draw Primitives ----
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255);
        _ = zsdl3.renderDebugText(renderer, 8, 6, "Draw Primitives");

        _ = zsdl3.setRenderDrawColor(renderer, 255, 100, 100, 255);
        _ = zsdl3.renderPoint(renderer, 60, 38);

        _ = zsdl3.setRenderDrawColor(renderer, 100, 255, 100, 255);
        _ = zsdl3.renderLine(renderer, 20, 62, 200, 62);

        _ = zsdl3.setRenderDrawColor(renderer, 100, 100, 255, 255);
        _ = zsdl3.renderRect(renderer, &.{ .x = 20, .y = 78, .w = 160, .h = 48 });

        _ = zsdl3.setRenderDrawColor(renderer, 200, 200, 50, 255);
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 20, .y = 138, .w = 160, .h = 50 });

        _ = zsdl3.setRenderDrawColor(renderer, 50, 200, 200, 255);
        _ = zsdl3.renderFillRects(renderer, &[_]zsdl3.SDL_FRect{
            .{ .x = 220, .y = 78, .w = 100, .h = 42 },
            .{ .x = 220, .y = 140, .w = 100, .h = 42 },
        }, 2);

        // ---- Cell (1,0): Viewport ----
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255);
        _ = zsdl3.renderDebugText(renderer, 408, 6, "Viewport");

        // Set viewport to cell interior
        _ = zsdl3.setRenderViewport(renderer, &.{ .x = 404, .y = 22, .w = 392, .h = 174 });
        _ = zsdl3.setRenderDrawColor(renderer, 25, 45, 25, 255);
        _ = zsdl3.renderClear(renderer);

        // Draw viewport-relative coordinates (origin = viewport top-left)
        _ = zsdl3.setRenderDrawColor(renderer, 255, 80, 80, 255);
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 15, .y = 15, .w = 120, .h = 55 });

        _ = zsdl3.setRenderDrawColor(renderer, 100, 255, 100, 255);
        _ = zsdl3.renderLine(renderer, 15, 90, 370, 90);

        _ = zsdl3.setRenderDrawColor(renderer, 200, 200, 50, 255);
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 15, .y = 105, .w = 355, .h = 55 });

        _ = zsdl3.setRenderViewport(renderer, null);

        // ---- Cell (0,1): Clip Rect ----
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255);
        _ = zsdl3.renderDebugText(renderer, 8, 206, "Clip Rect");

        // Set clip rect to cell interior
        _ = zsdl3.setRenderClipRect(renderer, &.{ .x = 4, .y = 222, .w = 392, .h = 172 });

        // Fill clip area background
        _ = zsdl3.setRenderDrawColor(renderer, 50, 25, 25, 255);
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 4, .y = 222, .w = 392, .h = 172 });

        // Yellow rect — fully inside clip
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 50, 255);
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 15, .y = 238, .w = 160, .h = 50 });

        // Magenta rect — extends past x=395, gets clipped
        _ = zsdl3.setRenderDrawColor(renderer, 255, 50, 255, 255);
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 300, .y = 238, .w = 200, .h = 50 });

        // Cyan rect — extends past y=393, gets clipped
        _ = zsdl3.setRenderDrawColor(renderer, 50, 255, 255, 255);
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 15, .y = 340, .w = 300, .h = 80 });

        _ = zsdl3.setRenderClipRect(renderer, null);

        // ---- Cell (1,1): Textures ----
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255);
        _ = zsdl3.renderDebugText(renderer, 408, 206, "Textures");

        if (tex) |t| {
            // Normal texture
            _ = zsdl3.renderTexture(renderer, t, null, &.{ .x = 420, .y = 240, .w = 64, .h = 64 });

            // Rotated 45 degrees
            _ = zsdl3.renderTextureRotated(renderer, t, null, &.{ .x = 530, .y = 240, .w = 64, .h = 64 }, 45.0, null, zsdl3.SDL_FLIP_NONE);

            // Scaled up
            _ = zsdl3.renderTexture(renderer, t, null, &.{ .x = 640, .y = 235, .w = 80, .h = 80 });
        }

        // ---- Cell (0,2): Color Scale ----
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255);
        _ = zsdl3.renderDebugText(renderer, 8, 406, "Color Scale");
        _ = zsdl3.renderDebugText(renderer, 20, 425, "1.0x");
        _ = zsdl3.renderDebugText(renderer, 150, 425, "0.5x");
        _ = zsdl3.renderDebugText(renderer, 280, 425, "2.0x");

        // Full brightness
        _ = zsdl3.setRenderDrawColor(renderer, 255, 80, 80, 255);
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 15, .y = 445, .w = 110, .h = 60 });

        // Half brightness
        _ = zsdl3.setRenderColorScale(renderer, 0.5);
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 145, .y = 445, .w = 110, .h = 60 });

        // Double brightness
        _ = zsdl3.setRenderColorScale(renderer, 2.0);
        _ = zsdl3.renderFillRect(renderer, &.{ .x = 275, .y = 445, .w = 110, .h = 60 });

        _ = zsdl3.setRenderColorScale(renderer, 1.0);

        // ---- Cell (1,2): Debug Text ----
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255);
        _ = zsdl3.renderDebugText(renderer, 408, 406, "Debug Text");

        _ = zsdl3.setRenderDrawColor(renderer, 180, 180, 180, 255);
        _ = zsdl3.renderDebugText(renderer, 415, 430, "ESC to quit");

        _ = zsdl3.setRenderDrawColor(renderer, 100, 255, 100, 255);
        _ = zsdl3.renderDebugText(renderer, 415, 455, "Renderer Test");

        _ = zsdl3.setRenderDrawColor(renderer, 100, 100, 255, 255);
        _ = zsdl3.renderDebugText(renderer, 415, 480, "zsdl3 bindings");

        _ = zsdl3.renderPresent(renderer);
        zsdl3.delay(16);
    }

    if (tex) |t| zsdl3.destroyTexture(t);
    std.log.info("=== Render Test Complete ===", .{});
}
