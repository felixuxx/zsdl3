// Basic 2D Rendering Example
// A minimal example showing how to create a window, renderer, and draw a simple shape

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

        // Draw a simple rectangle (yellow)
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 0, 255);
        const rect = zsdl3.SDL_FRect{
            .x = 300,
            .y = 200,
            .w = 200,
            .h = 200,
        };
        _ = zsdl3.renderFillRect(renderer, &rect);

        // Present the rendered frame
        zsdl3.renderPresent(renderer);

        // Small delay to prevent 100% CPU usage
        zsdl3.delay(16); // ~60 FPS
    }
}
