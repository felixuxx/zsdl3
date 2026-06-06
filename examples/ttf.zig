// TTF Font Rendering Example
// Loads a TrueType font and renders text to the screen.
// Demonstrates: TTF initialization, font loading from common system paths,
// text rendering via renderTextBlended, surface-to-texture conversion.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    var sdl = try zsdl3.SDL.load();
    defer sdl.unload();

    // Initialize SDL with video subsystem
    if (!sdl.core.init(zsdl3.SDL_INIT_VIDEO)) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.debug.print("Failed to initialize SDL: {s}\n", .{err});
        return;
    }

    var ttf = try zsdl3.TTF.load();
    defer ttf.unload();

    // Initialize TTF
    if (!ttf.functions.init()) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.debug.print("Failed to initialize TTF: {s}\n", .{err});
        return;
    }
    defer ttf.functions.quit();

    // Create a window
    const window = sdl.video.createWindow("TTF Example", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
    if (window == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.debug.print("Failed to create window: {s}\n", .{err});
        return;
    }
    defer sdl.video.destroyWindow(window);

    // Create a renderer
    const renderer = sdl.render.createRenderer(window, null);
    if (renderer == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.debug.print("Failed to create renderer: {s}\n", .{err});
        return;
    }
    defer sdl.render.destroyRenderer(renderer);

    // Try to open a font
    const font_paths = [_][:0]const u8{
        "DejaVuSans.ttf",
        "examples/DejaVuSans.ttf",
        "/usr/share/fonts/TTF/JetBrainsMonoNerdFontMono-Regular.ttf",
        "/usr/share/fonts/Adwaita/AdwaitaSans-Regular.ttf",
        "/usr/share/fonts/TTF/Vera.ttf",
        "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
        "/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf",
        "/System/Library/Fonts/Helvetica.ttc",
        "C:/Windows/Fonts/arial.ttf",
        "arial.ttf",
    };

    var font: ?*zsdl3.ttf.TTF_Font = null;

    for (font_paths) |path| {
        font = ttf.functions.openFont(path, 48.0);
        if (font != null) {
            std.debug.print("Successfully loaded font from: {s}\n", .{path});
            break;
        }
    }
    defer if (font) |f| ttf.functions.closeFont(f);

    // Main loop
    var running = true;

    while (running) {
        // Handle events
        var event: zsdl3.SDL_Event = undefined;
        while (sdl.events.pollEvent(&event)) {
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

        // Clear screen with dark background
        _ = sdl.render.setRenderDrawColor(renderer, 20, 20, 30, 255);
        _ = sdl.render.renderClear(renderer);

        // Render text if font is available
        if (font) |f| {
            const white_color = zsdl3.SDL_Color{ .r = 255, .g = 255, .b = 255, .a = 255 };

            // Render text to surface and then to texture
            // Pass 0 for length to use null-terminated string
            if (ttf.functions.renderTextBlended(f, "Hello, SDL3 TTF!", 0, white_color)) |surf| {
                defer sdl.surface.destroySurface(surf);
                if (sdl.render.createTextureFromSurface(renderer, surf)) |tex| {
                    defer sdl.render.destroyTexture(tex);
                    var tex_w: f32 = 0;
                    var tex_h: f32 = 0;
                    if (sdl.render.textureSize(tex, &tex_w, &tex_h)) {
                        const text_rect = zsdl3.SDL_FRect{
                            .x = 50,
                            .y = 50,
                            .w = tex_w,
                            .h = tex_h,
                        };
                        _ = sdl.render.renderTexture(renderer, tex, null, &text_rect);
                    }
                }
            }
        } else {
            // Show message if no font available
            _ = sdl.render.setRenderDrawColor(renderer, 255, 255, 0, 255);
            const msg_rect = zsdl3.SDL_FRect{
                .x = 50,
                .y = 250,
                .w = 700,
                .h = 100,
            };
            _ = sdl.render.renderFillRect(renderer, &msg_rect);
        }

        // Present the rendered frame
        _ = sdl.render.renderPresent(renderer);

        // Small delay to prevent 100% CPU usage
        sdl.time.delay(16); // ~60 FPS
    }
}
