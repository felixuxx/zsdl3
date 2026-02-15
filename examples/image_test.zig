const std = @import("std");

const zsdl3 = @import("zsdl3");

pub fn main() !void {
    std.log.info("SDL3 Image Test", .{});

    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to initialize SDL: {s}", .{err});
        return;
    }
    defer zsdl3.quit();

    const window = zsdl3.createWindow("Image Test", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
    if (window == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create window: {s}", .{err});
        return;
    }
    defer zsdl3.destroyWindow(window);

    const renderer = zsdl3.createRenderer(window, null);
    if (renderer == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create renderer: {s}", .{err});
        return;
    }
    defer zsdl3.destroyRenderer(renderer);

    std.log.info("SDL_image version: {d}", .{zsdl3.image.version()});

    const test_image_path = "test.png";
    std.log.info("Attempting to load: {s}", .{test_image_path});

    const texture = zsdl3.image.loadTexture(renderer, test_image_path);

    if (texture != null) {
        std.log.info("Successfully loaded image!", .{});
    } else {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.warn("Could not load image: {s}", .{err});
        std.log.info("Place test.png in the working directory to test image loading", .{});
    }

    var running = true;
    while (running) {
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

        _ = zsdl3.setRenderDrawColor(renderer, 30, 30, 30, 255);
        _ = zsdl3.renderClear(renderer);

        if (texture) |t| {
            var win_w: c_int = 0;
            var win_h: c_int = 0;
            _ = zsdl3.getWindowSize(window, &win_w, &win_h);

            const dst = zsdl3.SDL_FRect{
                .x = @floatFromInt(@divTrunc(win_w - 256, 2)),
                .y = @floatFromInt(@divTrunc(win_h - 256, 2)),
                .w = 256,
                .h = 256,
            };
            _ = zsdl3.renderTexture(renderer, t, null, &dst);
        }

        zsdl3.renderPresent(renderer);
        zsdl3.delay(16);
    }

    if (texture) |t| {
        zsdl3.destroyTexture(t);
    }

    std.log.info("Test complete!", .{});
}
