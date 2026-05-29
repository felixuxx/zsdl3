// Basic 2D Rendering Example
// Minimal SDL3 setup: creates a window and renderer, draws rectangles
// with color scaling and rect intersection tests.
// Demonstrates: init, window/renderer creation, event loop, draw primitives,
// render color scale, rect intersection geometry.

const std = @import("std");

const zsdl3 = @import("zsdl3");

pub fn main() void {
    // Initialize SDL with video subsystem
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.debug.print("Failed to initialize SDL: {s}\n", .{err});
        return;
    }
    defer zsdl3.quit();

    // Create a window
    const window = zsdl3.createWindow("Basic 2D Example", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
    if (window == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.debug.print("Failed to create window: {s}\n", .{err});
        return;
    }
    defer zsdl3.destroyWindow(window);

    // Create a renderer
    const renderer = zsdl3.createRenderer(window, null);
    if (renderer == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.debug.print("Failed to create renderer: {s}\n", .{err});
        return;
    }
    defer zsdl3.destroyRenderer(renderer);

    // Rect intersection test
    const rect_a = zsdl3.SDL_FRect{ .x = 100, .y = 100, .w = 200, .h = 200 };
    const rect_b = zsdl3.SDL_FRect{ .x = 200, .y = 200, .w = 200, .h = 200 };
    const rect_c = zsdl3.SDL_FRect{ .x = 500, .y = 500, .w = 100, .h = 100 };
    std.log.info("A intersects B: {}", .{zsdl3.hasRectIntersectionFloat(&rect_a, &rect_b)});
    std.log.info("A intersects C: {}", .{zsdl3.hasRectIntersectionFloat(&rect_a, &rect_c)});

    var intersection: zsdl3.SDL_FRect = undefined;
    if (zsdl3.getRectIntersectionFloat(&rect_a, &rect_b, &intersection)) {
        std.log.info("Intersection rect: x={d:.0} y={d:.0} w={d:.0} h={d:.0}", .{ intersection.x, intersection.y, intersection.w, intersection.h });
    }

    // Main loop
    var running = true;
    while (running) {
        // Handle events
        var event: zsdl3.SDL_Event = undefined;
        while (zsdl3.pollEvent(&event)) {
            switch (event.type) {
                zsdl3.SDL_EVENT_QUIT => running = false,
                zsdl3.SDL_EVENT_KEY_DOWN => {
                    if (event.key.scancode == zsdl3.SDL_SCANCODE_ESCAPE) {
                        running = false;
                    }
                },
                else => {},
            }
        }

        // Clear screen with a color (dark blue)
        _ = zsdl3.setRenderDrawColor(renderer, 30, 60, 90, 255);
        _ = zsdl3.renderClear(renderer);

        // Draw full brightness rectangle (yellow)
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 0, 255);
        _ = zsdl3.renderFillRect(renderer, &rect_a);

        // Draw with color scale 0.5 (dimmer)
        _ = zsdl3.setRenderColorScale(renderer, 0.5);
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 0, 255);
        _ = zsdl3.renderFillRect(renderer, &rect_b);
        var scale: f32 = 0;
        _ = zsdl3.getRenderColorScale(renderer, &scale);
        std.log.info("Color scale: {d:.2}", .{scale});
        _ = zsdl3.setRenderColorScale(renderer, 1.0);

        // Draw non-intersecting rect (cyan)
        _ = zsdl3.setRenderDrawColor(renderer, 0, 255, 255, 255);
        _ = zsdl3.renderFillRect(renderer, &rect_c);

        // Present the rendered frame
        _ = zsdl3.renderPresent(renderer);

        // Small delay to prevent 100% CPU usage
        zsdl3.delay(16); // ~60 FPS
    }
}
