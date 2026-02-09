// TTF Font Rendering Example
// Demonstrates how to use SDL_ttf to render text

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

    // Initialize TTF
    if (!zsdl3.ttf.init()) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.debug.print("Failed to initialize TTF: {s}\n", .{err});
        return;
    }
    defer zsdl3.ttf.quit();

    // Create a window
    const window = zsdl3.createWindow("TTF Example", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
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

    // Try to open a font
    const font_paths = [_][:0]const u8{
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
        font = zsdl3.ttf.openFont(path, 48.0);
        if (font != null) {
            std.debug.print("Successfully loaded font from: {s}\n", .{path});
            break;
        }
    }
    defer if (font) |f| zsdl3.ttf.closeFont(f);

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

        // Clear screen with dark background
        _ = zsdl3.setRenderDrawColor(renderer, 20, 20, 30, 255);
        _ = zsdl3.renderClear(renderer);

        // Render text if font is available
        if (font) |f| {
            const white_color = zsdl3.SDL_Color{ .r = 255, .g = 255, .b = 255, .a = 255 };
            
            // Render text to surface and then to texture
            // Pass 0 for length to use null-terminated string
            if (zsdl3.ttf.renderTextBlended(f, "Hello, SDL3 TTF!", 0, white_color)) |surf| {
                defer zsdl3.destroySurface(surf);
                if (zsdl3.createTextureFromSurface(renderer, surf)) |tex| {
                    defer zsdl3.destroyTexture(tex);
                    var tex_w: f32 = 0;
                    var tex_h: f32 = 0;
                    if (zsdl3.textureSize(tex, &tex_w, &tex_h)) {
                        const text_rect = zsdl3.SDL_FRect{
                            .x = 50,
                            .y = 50,
                            .w = tex_w,
                            .h = tex_h,
                        };
                        _ = zsdl3.renderTexture(renderer, tex, null, &text_rect);
                    }
                }
            }
        } else {
            // Show message if no font available
            _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 0, 255);
            const msg_rect = zsdl3.SDL_FRect{
                .x = 50,
                .y = 250,
                .w = 700,
                .h = 100,
            };
            _ = zsdl3.renderFillRect(renderer, &msg_rect);
        }

        // Present the rendered frame
        zsdl3.renderPresent(renderer);

        // Small delay to prevent 100% CPU usage
        zsdl3.delay(16); // ~60 FPS
    }
}
