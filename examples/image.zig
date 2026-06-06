// Image Loading Example
// Loads and displays a PNG image using SDL3_image and core SDL.
// Demonstrates: image loading via IMG_LoadTexture and SDL_LoadPNG,
// pixel inspection, surface rotation, save-to-file, centered rendering.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    std.log.info("SDL3 Image Test", .{});

    var sdl = try zsdl3.SDL.load();
    defer sdl.unload();

    if (!sdl.core.init(zsdl3.SDL_INIT_VIDEO)) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to initialize SDL: {s}", .{err});
        return;
    }

    var img = try zsdl3.Image.load();
    defer img.unload();

    const window = sdl.video.createWindow("Image Test", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
    if (window == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to create window: {s}", .{err});
        return;
    }
    defer sdl.video.destroyWindow(window);

    const renderer = sdl.render.createRenderer(window, null);
    if (renderer == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to create renderer: {s}", .{err});
        return;
    }
    defer sdl.render.destroyRenderer(renderer);

    std.log.info("SDL_image version: {d}", .{img.functions.version()});

    const test_image_path = "test.png";

    // --- Path 1: Load via SDL3_image ---
    std.log.info("--- Loading via SDL3_image ---", .{});
    const texture = img.functions.loadTexture(renderer, test_image_path);
    if (texture != null) {
        std.log.info("Successfully loaded image via SDL3_image!", .{});
    } else {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.warn("Could not load image via SDL3_image: {s}", .{err});
        std.log.info("Place test.png in the working directory to test image loading", .{});
    }

    // --- Path 2: Load via core SDL LoadPNG ---
    std.log.info("--- Loading via core SDL_LoadPNG ---", .{});
    const surface = sdl.surface.loadPNG(test_image_path);
    var rotated_surface: ?*zsdl3.surface.SDL_Surface = null;

    if (surface) |surf| {
        std.log.info("Loaded PNG as surface: {}x{} {}bpp", .{ surf.w, surf.h, 8 });
        defer sdl.surface.destroySurface(surf);

        // Read a pixel to inspect data
        var r: f32 = 0;
        var g: f32 = 0;
        var b: f32 = 0;
        var a: f32 = 0;
        _ = sdl.surface.readSurfacePixelFloat(surf, 0, 0, &r, &g, &b, &a);
        std.log.info("Pixel (0,0): r={d:.3} g={d:.3} b={d:.3} a={d:.3}", .{ r, g, b, a });

        // Save the loaded surface to a new file
        _ = sdl.surface.savePNG(surf, "output.png");
        std.log.info("Saved surface to output.png", .{});

        // Rotate the surface 45 degrees
        rotated_surface = sdl.surface.rotateSurface(surf, 45.0);
        if (rotated_surface) |rot| {
            std.log.info("Rotated surface: {}x{}", .{ rot.w, rot.h });
        }
    } else {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.warn("Could not load PNG via core SDL: {s}", .{err});
    }
    defer if (rotated_surface) |rot| sdl.surface.destroySurface(rot);

    var running = true;
    while (running) {
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

        _ = sdl.render.setRenderDrawColor(renderer, 30, 30, 30, 255);
        _ = sdl.render.renderClear(renderer);

        // Draw original texture (left half)
        if (texture) |t| {
            var win_w: c_int = 0;
            var win_h: c_int = 0;
            _ = sdl.video.getWindowSize(window, &win_w, &win_h);

            const dst = zsdl3.SDL_FRect{
                .x = @floatFromInt(@divTrunc(win_w, 4) - 128),
                .y = @floatFromInt(@divTrunc(win_h, 2) - 128),
                .w = 256,
                .h = 256,
            };
            _ = sdl.render.renderTexture(renderer, t, null, &dst);
        }

        // Draw rotated surface as texture (right half)
        if (rotated_surface) |rot| {
            if (sdl.render.createTextureFromSurface(renderer, rot)) |rot_tex| {
                defer sdl.render.destroyTexture(rot_tex);
                var win_w: c_int = 0;
                var win_h: c_int = 0;
                _ = sdl.video.getWindowSize(window, &win_w, &win_h);
                const dst2 = zsdl3.SDL_FRect{
                    .x = @floatFromInt(@divTrunc(win_w * 3, 4) - 128),
                    .y = @floatFromInt(@divTrunc(win_h, 2) - 128),
                    .w = 256,
                    .h = 256,
                };
                _ = sdl.render.renderTexture(renderer, rot_tex, null, &dst2);
            }
        }

        _ = sdl.render.renderPresent(renderer);
        sdl.time.delay(16);
    }

    if (texture) |t| {
        sdl.render.destroyTexture(t);
    }

    std.log.info("Test complete!", .{});
}
