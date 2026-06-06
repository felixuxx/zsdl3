const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    var sdl = try zsdl3.SDL.load();
    defer sdl.unload();

    if (sdl.core.init(zsdl3.SDL_INIT_VIDEO | zsdl3.SDL_INIT_AUDIO)) {
        defer sdl.core.quit();
        sdl.log.logInfo(zsdl3.SDL_LOG_CATEGORY_APPLICATION, "SDL initialized successfully");
        const window = sdl.video.createWindow("ZSDL3 Enhanced Example", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
        if (window) |win| {
            defer sdl.video.destroyWindow(win);
            const renderer = sdl.render.createRenderer(win, null);
            if (renderer) |rend| {
                defer sdl.render.destroyRenderer(rend);
                const platform = sdl.platform.getPlatform() orelse "Unknown";
                var title_buf: [256]u8 = undefined;
                const title = std.fmt.bufPrintZ(&title_buf, "ZSDL3 Example - {s}", .{platform}) catch "ZSDL3 Example";
                _ = sdl.video.setWindowTitle(win, title.ptr);
                var running = true;
                var rect_x: f32 = 100;
                var rect_y: f32 = 100;
                var window_w: c_int = 800;
                var window_h: c_int = 600;
                var frame_count: u32 = 0;
                const start_time = sdl.time.getTicks();
                while (running) {
                    _ = sdl.video.getWindowSize(win, &window_w, &window_h);
                    var event: zsdl3.SDL_Event = undefined;
                    while (sdl.events.pollEvent(&event)) {
                        switch (event.type) {
                            zsdl3.SDL_EVENT_QUIT => running = false,
                            zsdl3.SDL_EVENT_KEY_DOWN => {
                                const scancode = event.key.scancode;
                                if (scancode == zsdl3.SDL_SCANCODE_ESCAPE) {
                                    running = false;
                                } else if (scancode == zsdl3.SDL_SCANCODE_LEFT) {
                                    rect_x -= 10;
                                } else if (scancode == zsdl3.SDL_SCANCODE_RIGHT) {
                                    rect_x += 10;
                                } else if (scancode == zsdl3.SDL_SCANCODE_UP) {
                                    rect_y -= 10;
                                } else if (scancode == zsdl3.SDL_SCANCODE_DOWN) {
                                    rect_y += 10;
                                }
                            },
                            else => {},
                        }
                    }
                    _ = sdl.render.setRenderDrawColor(rend, 50, 100, 150, 255);
                    _ = sdl.render.renderClear(rend);
                    _ = sdl.render.setRenderDrawColor(rend, 255, 255, 0, 255);
                    const rect = zsdl3.SDL_FRect{ .x = rect_x, .y = rect_y, .w = 200, .h = 150 };
                    _ = sdl.render.renderFillRect(rend, &rect);
                    _ = sdl.render.renderPresent(rend);
                    frame_count += 1;
                    sdl.time.delay(16);
                }
                const end_time = sdl.time.getTicks();
                const fps = @as(f32, @floatFromInt(frame_count)) / (@as(f32, @floatFromInt(end_time - start_time)) / 1000.0);
                std.debug.print("Game loop ended. Average FPS: {d:.2}\n", .{fps});
                sdl.log.logInfo(zsdl3.SDL_LOG_CATEGORY_APPLICATION, "Game loop ended");
                const platform_name = sdl.platform.getPlatform();
                if (platform_name) |p| {
                    std.debug.print("Platform: {s}\n", .{p});
                }
                const ram = sdl.system.getSystemRAM();
                std.debug.print("System RAM: {d} MB\n", .{ram});
                var sensor_count: c_int = 0;
                const sensors = sdl.sensor.getSensors(&sensor_count);
                if (sensors != null and sensor_count > 0) {
                    std.debug.print("Found {d} sensors\n", .{sensor_count});
                }
                var touch_count: c_int = 0;
                const touches = sdl.touch.getTouchDevices(&touch_count);
                if (touches != null and touch_count > 0) {
                    std.debug.print("Found {d} touch devices\n", .{touch_count});
                }
            } else {
                std.debug.print("Failed to create renderer: {s}\n", .{sdl.core.getError() orelse "Unknown error"});
            }
        } else {
            std.debug.print("Failed to create window: {s}\n", .{sdl.core.getError() orelse "Unknown error"});
        }
    } else {
        std.debug.print("Failed to initialize SDL: {s}\n", .{sdl.core.getError() orelse "Unknown error"});
    }
}
