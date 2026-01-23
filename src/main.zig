const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    // Initialize SDL
    if (zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        defer zsdl3.quit();

        // Create window
        const window = zsdl3.createWindow("ZSDL3 2D Game", 800, 600, 0);
        if (window) |win| {
            defer zsdl3.destroyWindow(win);

            // Create renderer
            const renderer = zsdl3.createRenderer(win, null, 0);
            if (renderer) |rend| {
                defer zsdl3.destroyRenderer(rend);

                var running = true;
                while (running) {
                    // Handle events
                    var event: zsdl3.SDL_Event = undefined;
                    while (zsdl3.pollEvent(&event)) {
                        switch (event.type) {
                            zsdl3.SDL_EVENT_QUIT => running = false,
                            else => {},
                        }
                    }

                    // Clear screen
                    _ = zsdl3.setRenderDrawColor(rend, 0, 0, 0, 255);
                    _ = zsdl3.renderClear(rend);

                    // Draw a rectangle
                    _ = zsdl3.setRenderDrawColor(rend, 255, 0, 0, 255);
                    const rect = zsdl3.SDL_FRect{ .x = 100, .y = 100, .w = 200, .h = 150 };
                    _ = zsdl3.renderFillRect(rend, &rect);

                    // Present
                    zsdl3.renderPresent(rend);

                    // Delay to cap framerate
                    zsdl3.delay(16);
                }
            } else {
                std.debug.print("Failed to create renderer: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
            }
        } else {
            std.debug.print("Failed to create window: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
        }
    } else {
        std.debug.print("Failed to initialize SDL: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
    }
}
