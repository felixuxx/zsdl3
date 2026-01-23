const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    // Initialize SDL with video and audio
    if (zsdl3.init(zsdl3.SDL_INIT_VIDEO | zsdl3.SDL_INIT_AUDIO)) {
        defer zsdl3.quit();

        // Log initialization
        zsdl3.logMessage(zsdl3.SDL_LOG_CATEGORY_APPLICATION, zsdl3.SDL_LogPriority.SDL_LOG_PRIORITY_INFO, "SDL initialized successfully");

        // Create window
        const window = zsdl3.createWindow("ZSDL3 Enhanced Example", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
        if (window) |win| {
            defer zsdl3.destroyWindow(win);

            // Create renderer
            const renderer = zsdl3.createRenderer(win, null, 0);
            if (renderer) |rend| {
                defer zsdl3.destroyRenderer(rend);

                // Set window title with platform info
                const platform = zsdl3.getPlatform() orelse "Unknown";
                var title_buf: [256]u8 = undefined;
                const title = std.fmt.bufPrintZ(&title_buf, "ZSDL3 Example - {s}", .{platform}) catch "ZSDL3 Example";
                _ = zsdl3.setWindowTitle(win, title.ptr);

                var running = true;
                var rect_x: f32 = 100;
                var rect_y: f32 = 100;

                while (running) {
                    // Handle events
                    var event: zsdl3.SDL_Event = undefined;
                    while (zsdl3.pollEvent(&event)) {
                        switch (event.type) {
                            zsdl3.SDL_EVENT_QUIT => running = false,
                            zsdl3.SDL_EVENT_KEY_DOWN => {
                                const scancode = event.key.scancode;
                                if (scancode == 41) { // ESC
                                    running = false;
                                } else if (scancode == 80) { // LEFT
                                    rect_x -= 10;
                                } else if (scancode == 79) { // RIGHT
                                    rect_x += 10;
                                } else if (scancode == 82) { // UP
                                    rect_y -= 10;
                                } else if (scancode == 81) { // DOWN
                                    rect_y += 10;
                                }
                            },
                            else => {},
                        }
                    }

                    // Clear screen with blue background
                    _ = zsdl3.setRenderDrawColor(rend, 50, 100, 150, 255);
                    _ = zsdl3.renderClear(rend);

                    // Draw movable rectangle
                    _ = zsdl3.setRenderDrawColor(rend, 255, 255, 0, 255);
                    const rect = zsdl3.SDL_FRect{ .x = rect_x, .y = rect_y, .w = 200, .h = 150 };
                    _ = zsdl3.renderFillRect(rend, &rect);

                    // Draw a line
                    _ = zsdl3.setRenderDrawColor(rend, 255, 0, 255, 255);
                    _ = zsdl3.renderLine(rend, 0, 0, 800, 600);

                    // Present
                    zsdl3.renderPresent(rend);

                    // Delay to cap framerate
                    zsdl3.delay(16);
                }

                zsdl3.logMessage(zsdl3.SDL_LOG_CATEGORY_APPLICATION, zsdl3.SDL_LogPriority.SDL_LOG_PRIORITY_INFO, "Game loop ended");
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
