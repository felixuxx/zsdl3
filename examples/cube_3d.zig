const std = @import("std");

const zsdl3 = @import("zsdl3");

// Simple 3D cube example using SDL3 GPU API
// This demonstrates basic GPU device setup and rendering

// Cube vertices (position + color)
const CubeVertex = extern struct {
    x: f32,
    y: f32,
    z: f32,
    r: f32,
    g: f32,
    b: f32,
    a: f32,
};

const cube_vertices = [_]CubeVertex{
    // Front face (red)
    .{ .x = -0.5, .y = -0.5, .z = 0.5, .r = 1.0, .g = 0.0, .b = 0.0, .a = 1.0 },
    .{ .x = 0.5, .y = -0.5, .z = 0.5, .r = 1.0, .g = 0.0, .b = 0.0, .a = 1.0 },
    .{ .x = 0.5, .y = 0.5, .z = 0.5, .r = 1.0, .g = 0.0, .b = 0.0, .a = 1.0 },
    .{ .x = -0.5, .y = 0.5, .z = 0.5, .r = 1.0, .g = 0.0, .b = 0.0, .a = 1.0 },
    // Back face (green)
    .{ .x = -0.5, .y = -0.5, .z = -0.5, .r = 0.0, .g = 1.0, .b = 0.0, .a = 1.0 },
    .{ .x = 0.5, .y = -0.5, .z = -0.5, .r = 0.0, .g = 1.0, .b = 0.0, .a = 1.0 },
    .{ .x = 0.5, .y = 0.5, .z = -0.5, .r = 0.0, .g = 1.0, .b = 0.0, .a = 1.0 },
    .{ .x = -0.5, .y = 0.5, .z = -0.5, .r = 0.0, .g = 1.0, .b = 0.0, .a = 1.0 },
};

const cube_indices = [_]u16{
    // Front face
    0, 1, 2, 2, 3, 0,
    // Back face
    4, 5, 6, 6, 7, 4,
    // Left face
    0, 3, 7, 7, 4, 0,
    // Right face
    1, 5, 6, 6, 2, 1,
    // Top face
    3, 2, 6, 6, 7, 3,
    // Bottom face
    0, 4, 5, 5, 1, 0,
};

pub fn main() !void {
    // Initialize SDL
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to initialize SDL: {s}", .{err});
        return;
    }
    defer zsdl3.quit();

    // Create window
    const window = zsdl3.createWindow("3D Cube Example", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
    if (window == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create window: {s}", .{err});
        return;
    }
    defer zsdl3.destroyWindow(window);

    // Try to create GPU device
    // Note: For a full GPU example, you'd need SPIR-V shaders
    // This example uses the renderer API as a fallback to demonstrate the setup
    const renderer = zsdl3.createRenderer(window, null);
    if (renderer == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create renderer: {s}", .{err});
        return;
    }
    defer zsdl3.destroyRenderer(renderer);

    std.log.info("3D Cube Example - Press ESC to quit", .{});

    var angle: f32 = 0.0;
    var running = true;

    // Main loop
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

        // Clear screen
        _ = zsdl3.setRenderDrawColor(renderer, 30, 30, 30, 255);
        _ = zsdl3.renderClear(renderer);

        // Get current render output size (adapts to window size changes)
        var output_w: c_int = 800;
        var output_h: c_int = 600;
        _ = zsdl3.getCurrentRenderOutputSize(renderer, &output_w, &output_h);

        // Draw a simple representation of a cube using 2D primitives
        // (This is a placeholder - full 3D would require GPU API with shaders)
        angle += 0.02;
        if (angle > 2.0 * std.math.pi) {
            angle -= 2.0 * std.math.pi;
        }

        // Draw cube wireframe representation - adapt to window size
        const center_x: f32 = @as(f32, @floatFromInt(output_w)) / 2.0;
        const center_y: f32 = @as(f32, @floatFromInt(output_h)) / 2.0;
        // Scale cube size based on smaller dimension, keeping it proportional
        const min_dim = @min(@as(f32, @floatFromInt(output_w)), @as(f32, @floatFromInt(output_h)));
        const size: f32 = min_dim * 0.2; // 20% of smaller dimension

        // Project 3D cube to 2D (simple isometric projection)
        const cos_a = @cos(angle);
        const sin_a = @sin(angle);

        // Front face
        const fx1 = center_x + (cube_vertices[0].x * cos_a - cube_vertices[0].z * sin_a) * size;
        const fy1 = center_y + (cube_vertices[0].y + (cube_vertices[0].x * sin_a + cube_vertices[0].z * cos_a) * 0.5) * size;
        const fx2 = center_x + (cube_vertices[1].x * cos_a - cube_vertices[1].z * sin_a) * size;
        const fy2 = center_y + (cube_vertices[1].y + (cube_vertices[1].x * sin_a + cube_vertices[1].z * cos_a) * 0.5) * size;
        const fx3 = center_x + (cube_vertices[2].x * cos_a - cube_vertices[2].z * sin_a) * size;
        const fy3 = center_y + (cube_vertices[2].y + (cube_vertices[2].x * sin_a + cube_vertices[2].z * cos_a) * 0.5) * size;
        const fx4 = center_x + (cube_vertices[3].x * cos_a - cube_vertices[3].z * sin_a) * size;
        const fy4 = center_y + (cube_vertices[3].y + (cube_vertices[3].x * sin_a + cube_vertices[3].z * cos_a) * 0.5) * size;

        // Back face
        const bx1 = center_x + (cube_vertices[4].x * cos_a - cube_vertices[4].z * sin_a) * size;
        const by1 = center_y + (cube_vertices[4].y + (cube_vertices[4].x * sin_a + cube_vertices[4].z * cos_a) * 0.5) * size;
        const bx2 = center_x + (cube_vertices[5].x * cos_a - cube_vertices[5].z * sin_a) * size;
        const by2 = center_y + (cube_vertices[5].y + (cube_vertices[5].x * sin_a + cube_vertices[5].z * cos_a) * 0.5) * size;
        const bx3 = center_x + (cube_vertices[6].x * cos_a - cube_vertices[6].z * sin_a) * size;
        const by3 = center_y + (cube_vertices[6].y + (cube_vertices[6].x * sin_a + cube_vertices[6].z * cos_a) * 0.5) * size;
        const bx4 = center_x + (cube_vertices[7].x * cos_a - cube_vertices[7].z * sin_a) * size;
        const by4 = center_y + (cube_vertices[7].y + (cube_vertices[7].x * sin_a + cube_vertices[7].z * cos_a) * 0.5) * size;

        // Set color for front face
        _ = zsdl3.setRenderDrawColor(renderer, 255, 0, 0, 255);
        _ = zsdl3.renderLine(renderer, fx1, fy1, fx2, fy2);
        _ = zsdl3.renderLine(renderer, fx2, fy2, fx3, fy3);
        _ = zsdl3.renderLine(renderer, fx3, fy3, fx4, fy4);
        _ = zsdl3.renderLine(renderer, fx4, fy4, fx1, fy1);

        // Set color for back face
        _ = zsdl3.setRenderDrawColor(renderer, 0, 255, 0, 255);
        _ = zsdl3.renderLine(renderer, bx1, by1, bx2, by2);
        _ = zsdl3.renderLine(renderer, bx2, by2, bx3, by3);
        _ = zsdl3.renderLine(renderer, bx3, by3, bx4, by4);
        _ = zsdl3.renderLine(renderer, bx4, by4, bx1, by1);

        // Connect front and back
        _ = zsdl3.setRenderDrawColor(renderer, 200, 200, 200, 255);
        _ = zsdl3.renderLine(renderer, fx1, fy1, bx1, by1);
        _ = zsdl3.renderLine(renderer, fx2, fy2, bx2, by2);
        _ = zsdl3.renderLine(renderer, fx3, fy3, bx3, by3);
        _ = zsdl3.renderLine(renderer, fx4, fy4, bx4, by4);

        // Present
        zsdl3.renderPresent(renderer);
        zsdl3.delay(16);
    }
}
