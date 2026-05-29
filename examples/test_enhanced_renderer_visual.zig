// Enhanced Renderer Visual Smoke Test
// Exercises: clip rect, viewport, logical presentation, draw primitives,
// texture scale/blend modes, texture rotation, debug text, coordinate conversion.
// Demonstrates: comprehensive 2D renderer API coverage.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() void {
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) return;
    defer zsdl3.quit();

    const window = zsdl3.createWindow("Render Test", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE) orelse return;
    defer zsdl3.destroyWindow(window);

    const renderer = zsdl3.createRenderer(window, null) orelse return;
    defer zsdl3.destroyRenderer(renderer);

    std.log.info("=== Renderer Properties ===", .{});
    _ = zsdl3.setRenderDrawColor(renderer, 30, 30, 40, 255);
    _ = zsdl3.renderClear(renderer);

    // Renderer info
    if (zsdl3.getRendererName(renderer)) |name| {
        std.log.info("Renderer: {s}", .{name});
    }

    // Driver info
    const num_drivers = zsdl3.getNumRenderDrivers();
    std.log.info("Render drivers: {d}", .{num_drivers});

    // Draw primitives
    std.log.info("--- Drawing Primitives ---", .{});
    _ = zsdl3.setRenderDrawColor(renderer, 255, 100, 100, 255);
    _ = zsdl3.renderPoint(renderer, 100, 50);

    _ = zsdl3.setRenderDrawColor(renderer, 100, 255, 100, 255);
    _ = zsdl3.renderLine(renderer, 50, 80, 200, 80);

    const rect = zsdl3.SDL_FRect{ .x = 50, .y = 120, .w = 150, .h = 100 };
    _ = zsdl3.setRenderDrawColor(renderer, 100, 100, 255, 255);
    _ = zsdl3.renderRect(renderer, &rect);

    const fill_rect = zsdl3.SDL_FRect{ .x = 50, .y = 250, .w = 150, .h = 100 };
    _ = zsdl3.setRenderDrawColor(renderer, 200, 200, 50, 255);
    _ = zsdl3.renderFillRect(renderer, &fill_rect);

    // Multiple rects at once
    const rects = [_]zsdl3.SDL_FRect{
        .{ .x = 250, .y = 120, .w = 80, .h = 60 },
        .{ .x = 350, .y = 120, .w = 80, .h = 60 },
    };
    _ = zsdl3.setRenderDrawColor(renderer, 50, 200, 200, 255);
    _ = zsdl3.renderFillRects(renderer, &rects, 2);

    // Render scale
    std.log.info("--- Render Scale ---", .{});
    _ = zsdl3.setRenderScale(renderer, 2.0, 2.0);
    var scale_x: f32 = 0;
    var scale_y: f32 = 0;
    _ = zsdl3.getRenderScale(renderer, &scale_x, &scale_y);
    std.log.info("Scale: {d}, {d}", .{ scale_x, scale_y });
    _ = zsdl3.setRenderScale(renderer, 1.0, 1.0);

    // Clip rect
    std.log.info("--- Clip Rect ---", .{});
    const clip_rect = zsdl3.SDL_Rect{ .x = 0, .y = 350, .w = 400, .h = 200 };
    _ = zsdl3.setRenderClipRect(renderer, &clip_rect);
    var got_clip: zsdl3.SDL_Rect = undefined;
    _ = zsdl3.getRenderClipRect(renderer, &got_clip);
    std.log.info("Clip rect: x={d} y={d} w={d} h={d}", .{ got_clip.x, got_clip.y, got_clip.w, got_clip.h });
    std.log.info("Clip enabled: {}", .{zsdl3.renderClipEnabled(renderer)});

    // Draw inside clipped area
    _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255);
    _ = zsdl3.renderFillRect(renderer, &.{ .x = 0, .y = 350, .w = 400, .h = 200 });

    // Disable clip
    _ = zsdl3.setRenderClipRect(renderer, null);

    // Viewport
    std.log.info("--- Viewport ---", .{});
    const vp = zsdl3.SDL_Rect{ .x = 400, .y = 0, .w = 400, .h = 300 };
    _ = zsdl3.setRenderViewport(renderer, &vp);
    _ = zsdl3.setRenderDrawColor(renderer, 60, 60, 80, 255);
    _ = zsdl3.renderClear(renderer);
    _ = zsdl3.setRenderViewport(renderer, null);

    // Logical presentation
    std.log.info("--- Logical Presentation ---", .{});
    _ = zsdl3.setRenderLogicalPresentation(renderer, 800, 600, zsdl3.SDL_LOGICAL_PRESENTATION_LETTERBOX);
    var log_w: c_int = 0;
    var log_h: c_int = 0;
    var log_mode: zsdl3.SDL_RendererLogicalPresentation = undefined;
    _ = zsdl3.getRenderLogicalPresentation(renderer, &log_w, &log_h, &log_mode);
    std.log.info("Logical: {}x{} mode={}", .{ log_w, log_h, @intFromEnum(log_mode) });
    _ = zsdl3.setRenderLogicalPresentation(renderer, 800, 600, zsdl3.SDL_LOGICAL_PRESENTATION_DISABLED);

    // Texture creation and operations
    std.log.info("--- Texture Operations ---", .{});
    var tex: ?*zsdl3.SDL_Texture = null;

    // Create a simple texture from pixel data
    {
        const tex_w = 64;
        const tex_h = 64;
        var pixels: [tex_w * tex_h * 4]u8 = undefined;
        for (0..tex_h) |y| {
            for (0..tex_w) |x| {
                const i = (y * tex_w + x) * 4;
                pixels[i] = @intCast(x * 4);
                pixels[i + 1] = @intCast(y * 4);
                pixels[i + 2] = 128;
                pixels[i + 3] = 255;
            }
        }
        tex = zsdl3.createTexture(renderer, zsdl3.SDL_PIXELFORMAT_RGBA8888, zsdl3.SDL_TEXTUREACCESS_STATIC, tex_w, tex_h);
        if (tex) |t| {
            _ = zsdl3.updateTexture(t, null, &pixels, tex_w * 4);

            // Texture blend mode
            var blend: zsdl3.SDL_BlendMode = undefined;
            _ = zsdl3.getTextureBlendMode(t, &blend);
            std.log.info("Texture blend mode: {d}", .{blend});

            // Texture scale mode
            var scale_mode: zsdl3.SDL_ScaleMode = undefined;
            _ = zsdl3.getTextureScaleMode(t, &scale_mode);
            _ = zsdl3.setTextureScaleMode(t, zsdl3.SDL_SCALEMODE_LINEAR);
            _ = zsdl3.getTextureScaleMode(t, &scale_mode);
            std.log.info("Texture scale mode: {}", .{@intFromEnum(scale_mode)});

            // Texture color mod
            _ = zsdl3.setTextureColorMod(t, 200, 200, 255);

            // Render texture
            _ = zsdl3.renderTexture(renderer, t, null, &.{ .x = 450, .y = 350, .w = 64, .h = 64 });

            // Rotated texture
            _ = zsdl3.renderTextureRotated(renderer, t, null, &.{ .x = 550, .y = 350, .w = 64, .h = 64 }, 45.0, null, zsdl3.SDL_FLIP_NONE);

            // Texture size query
            var tw: f32 = 0;
            var th: f32 = 0;
            _ = zsdl3.textureSize(t, &tw, &th);
            std.log.info("Texture size: {}x{}", .{ tw, th });

            // Default texture scale mode
            var default_sm: zsdl3.SDL_ScaleMode = undefined;
            _ = zsdl3.getDefaultTextureScaleMode(renderer, &default_sm);
            _ = zsdl3.setDefaultTextureScaleMode(renderer, zsdl3.SDL_SCALEMODE_LINEAR);
        }
    }

    // Render debug text
    std.log.info("--- Debug Text ---", .{});
    _ = zsdl3.renderDebugText(renderer, 10, 550, "SDL3 Render Test - Press ESC to quit");

    // Get render output size
    var out_w: c_int = 0;
    var out_h: c_int = 0;
    _ = zsdl3.getCurrentRenderOutputSize(renderer, &out_w, &out_h);
    std.log.info("Output size: {}x{}", .{ out_w, out_h });

    // Safe area
    var safe: zsdl3.SDL_Rect = undefined;
    _ = zsdl3.getRenderSafeArea(renderer, &safe);
    std.log.info("Safe area: {} {} {}x{}", .{ safe.x, safe.y, safe.w, safe.h });

    // Coordinate conversion
    var rx: f32 = 0;
    var ry: f32 = 0;
    _ = zsdl3.renderCoordinatesFromWindow(renderer, 100, 100, &rx, &ry);
    var wx: f32 = 0;
    var wy: f32 = 0;
    _ = zsdl3.renderCoordinatesToWindow(renderer, 100, 100, &wx, &wy);
    std.log.info("Coord convert: (100,100) -> render({d},{d}) -> window({d},{d})", .{ rx, ry, wx, wy });

    // Draw color
    var dr: u8 = 0;
    var dg: u8 = 0;
    var db: u8 = 0;
    var da: u8 = 0;
    _ = zsdl3.getRenderDrawColor(renderer, &dr, &dg, &db, &da);
    std.log.info("Draw color: {d},{d},{d},{d}", .{ dr, dg, db, da });

    // Render VSync
    var vsync: c_int = 0;
    _ = zsdl3.getRenderVSync(renderer, &vsync);
    std.log.info("VSync: {d}", .{vsync});

    // Address mode
    var u_mode: zsdl3.SDL_TextureAddressMode = undefined;
    var v_mode: zsdl3.SDL_TextureAddressMode = undefined;
    _ = zsdl3.getRenderTextureAddressMode(renderer, &u_mode, &v_mode);
    _ = zsdl3.setRenderTextureAddressMode(renderer, zsdl3.SDL_TEXTURE_ADDRESS_CLAMP, zsdl3.SDL_TEXTURE_ADDRESS_CLAMP);
    std.log.info("Address mode: u={} v={}", .{@intFromEnum(u_mode), @intFromEnum(v_mode)});

    _ = zsdl3.renderPresent(renderer);

    if (tex) |t| zsdl3.destroyTexture(t);

    std.log.info("=== Render Test Complete ===", .{});
}
