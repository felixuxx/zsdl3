const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    // Simple enhanced renderer test
    if (zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        defer zsdl3.quit();

        const window = zsdl3.createWindow("Enhanced Visual Test", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
        if (window) |win| {
            defer zsdl3.destroyWindow(win);

            const renderer = zsdl3.createRenderer(win, null);
            if (renderer) |rend| {
                defer zsdl3.destroyRenderer(rend);

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

                    _ = zsdl3.setRenderDrawColor(rend, 100, 149, 237, 255);
                    _ = zsdl3.renderClear(rend);
                    zsdl3.renderPresent(rend);
                    zsdl3.delay(16);
                }
            }
        }
    }
}
