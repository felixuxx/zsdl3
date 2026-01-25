const std = @import("std");
const zsdl3 = @import("zsdl3");

// Enhanced 3D Rendering Example with Robust Fallback
// This example demonstrates:
// 1. 3D cube rendering using 2D renderer as fallback
// 2. Proper 3D mathematics (rotation, projection)
// 3. Face culling for proper 3D visualization
// 4. Clean error handling and resource management
// 5. Multiple rendering modes (wireframe, solid faces, vertices)

const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,

    pub fn rotate(self: Vec3, angle_x: f32, angle_y: f32) Vec3 {
        // Rotate around Y axis
        var result = self;
        const cos_y = @cos(angle_y);
        const sin_y = @sin(angle_y);
        const temp_x = result.x * cos_y - result.z * sin_y;
        result.z = result.x * sin_y + result.z * cos_y;
        result.x = temp_x;

        // Rotate around X axis
        const cos_x = @cos(angle_x);
        const sin_x = @sin(angle_x);
        const temp_y = result.y * cos_x - result.z * sin_x;
        result.z = result.y * sin_x + result.z * cos_x;
        result.y = temp_y;

        return result;
    }

    pub fn project(self: Vec3, width: f32, height: f32) [2]f32 {
        const fov = 2.5; // Field of view factor
        const distance = 6.0; // Camera distance
        const scale = fov * distance / (distance + self.z);
        return [2]f32{
            self.x * scale + width / 2.0,
            self.y * scale + height / 2.0,
        };
    }
};

const Vertex = struct {
    position: Vec3,
    color: [3]f32,
};

// Cube vertices with distinct colors
const CUBE_VERTICES = [_]Vertex{
    .{ .position = Vec3{ .x = -1, .y = -1, .z = -1 }, .color = [3]f32{ 1, 0, 0 } }, // Red
    .{ .position = Vec3{ .x = 1, .y = -1, .z = -1 }, .color = [3]f32{ 0, 1, 0 } }, // Green
    .{ .position = Vec3{ .x = 1, .y = 1, .z = -1 }, .color = [3]f32{ 0, 0, 1 } }, // Blue
    .{ .position = Vec3{ .x = -1, .y = 1, .z = -1 }, .color = [3]f32{ 1, 1, 0 } }, // Yellow
    .{ .position = Vec3{ .x = -1, .y = -1, .z = 1 }, .color = [3]f32{ 1, 0, 1 } }, // Magenta
    .{ .position = Vec3{ .x = 1, .y = -1, .z = 1 }, .color = [3]f32{ 0, 1, 1 } }, // Cyan
    .{ .position = Vec3{ .x = 1, .y = 1, .z = 1 }, .color = [3]f32{ 1, 1, 1 } }, // White
    .{ .position = Vec3{ .x = -1, .y = 1, .z = 1 }, .color = [3]f32{ 0.5, 0.5, 0.5 } }, // Gray
};

// Cube edges for wireframe rendering
const CUBE_EDGES = [_][2]usize{
    .{ 0, 1 }, .{ 1, 2 }, .{ 2, 3 }, .{ 3, 0 }, // Front face
    .{ 4, 5 }, .{ 5, 6 }, .{ 6, 7 }, .{ 7, 4 }, // Back face
    .{ 0, 4 }, .{ 1, 5 }, .{ 2, 6 }, .{ 3, 7 }, // Connecting edges
};

// Cube faces for solid rendering (counter-clockwise winding)
const CUBE_FACES = [_][4]usize{
    .{ 0, 3, 2, 1 }, // Front face
    .{ 4, 5, 6, 7 }, // Back face
    .{ 0, 1, 5, 4 }, // Bottom face
    .{ 2, 3, 7, 6 }, // Top face
    .{ 0, 4, 7, 3 }, // Left face
    .{ 1, 2, 6, 5 }, // Right face
};

const RenderMode = enum {
    wireframe,
    solid_faces,
    vertices_only,
    wireframe_and_vertices,
};

pub fn main() !void {
    // Initialize SDL
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        std.log.err("Failed to initialize SDL: {s}", .{zsdl3.getError() orelse "Unknown"});
        return error.SDLInitFailed;
    }
    defer zsdl3.quit();

    // Create window
    const window = zsdl3.createWindow("ZSDL3 3D Example - Interactive Cube", 1024, 768, zsdl3.SDL_WINDOW_RESIZABLE | zsdl3.SDL_WINDOW_HIGH_PIXEL_DENSITY);
    if (window == null) {
        std.log.err("Failed to create window: {s}", .{zsdl3.getError() orelse "Unknown"});
        return error.WindowCreationFailed;
    }
    defer zsdl3.destroyWindow(window);

    // Try to initialize 3D rendering (with fallback to 2D)
    try run3DRenderer(window.?);
}

fn run3DRenderer(window: *zsdl3.SDL_Window) !void {
    // Try GPU mode first
    if (tryGPUMode(window)) {
        std.log.info("GPU mode completed successfully", .{});
    } else {
        std.log.info("GPU mode not available, using enhanced software 3D", .{});
        try runEnhancedSoftwareRenderer(window);
    }
}

fn tryGPUMode(window: *zsdl3.SDL_Window) bool {
    // Try to create GPU device
    const device = zsdl3.createGPUDevice(zsdl3.SDL_GPU_SHADERFORMAT_SPIRV, false, null);
    if (device == null) {
        return false;
    }
    defer zsdl3.destroyGPUDevice(device);

    // Try to claim window
    if (!zsdl3.claimWindowForGPUDevice(device, window)) {
        return false;
    }
    defer zsdl3.releaseWindowFromGPUDevice(device, window);

    std.log.info("GPU device available - running GPU demo", .{});

    // Simple GPU demo - just test basic functionality
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

        const cmdbuf = zsdl3.acquireGPUCommandBuffer(device);
        if (cmdbuf) |buf| {
            _ = zsdl3.submitGPUCommandBuffer(buf);
        }

        zsdl3.delay(16);
    }

    return true;
}

fn runEnhancedSoftwareRenderer(window: *zsdl3.SDL_Window) !void {
    // Create 2D renderer
    const renderer = zsdl3.createRenderer(window, null, 0);
    if (renderer == null) {
        return error.RendererCreationFailed;
    }
    defer zsdl3.destroyRenderer(renderer);

    var rotation_x: f32 = 0.0;
    var rotation_y: f32 = 0.0;
    var render_mode: RenderMode = .wireframe_and_vertices;
    var auto_rotate = true;
    var running = true;
    var frame_count: u32 = 0;
    const start_time = zsdl3.getTicks();

    std.log.info("Controls:", .{});
    std.log.info("  SPACE: Toggle render mode", .{});
    std.log.info("  R: Toggle auto-rotation", .{});
    std.log.info("  Arrow keys: Manual rotation", .{});
    std.log.info("  ESC: Exit", .{});

    while (running) {
        // Handle events
        var event: zsdl3.SDL_Event = undefined;
        while (zsdl3.pollEvent(&event)) {
            switch (event.type) {
                zsdl3.SDL_EVENT_QUIT => running = false,
                zsdl3.SDL_EVENT_KEY_DOWN => {
                    switch (event.key.scancode) {
                        zsdl3.SDL_SCANCODE_ESCAPE => running = false,
                        zsdl3.SDL_SCANCODE_SPACE => {
                            // Cycle through render modes
                            render_mode = switch (render_mode) {
                                .wireframe => .solid_faces,
                                .solid_faces => .vertices_only,
                                .vertices_only => .wireframe_and_vertices,
                                .wireframe_and_vertices => .wireframe,
                            };
                        },
                        zsdl3.SDL_SCANCODE_R => auto_rotate = !auto_rotate,
                        zsdl3.SDL_SCANCODE_LEFT => rotation_y -= 0.1,
                        zsdl3.SDL_SCANCODE_RIGHT => rotation_y += 0.1,
                        zsdl3.SDL_SCANCODE_UP => rotation_x -= 0.1,
                        zsdl3.SDL_SCANCODE_DOWN => rotation_x += 0.1,
                        else => {},
                    }
                },
                else => {},
            }
        }

        // Auto-rotate if enabled
        if (auto_rotate) {
            rotation_x += 0.008;
            rotation_y += 0.012;
        }

        // Get window size
        var window_w: c_int = 1024;
        var window_h: c_int = 768;
        _ = zsdl3.getWindowSize(window, &window_w, &window_h);

        // Clear screen with dark blue
        _ = zsdl3.setRenderDrawColor(renderer, 10, 10, 30, 255);
        _ = zsdl3.renderClear(renderer);

        // Transform and project vertices
        var transformed_vertices: [8]Vec3 = undefined;
        var projected_vertices: [8][2]f32 = undefined;

        for (CUBE_VERTICES, 0..) |vertex, i| {
            transformed_vertices[i] = vertex.position.rotate(rotation_x, rotation_y);
            projected_vertices[i] = transformed_vertices[i].project(@floatFromInt(window_w), @floatFromInt(window_h));
        }

        // Render based on current mode
        switch (render_mode) {
            .wireframe => {
                // Draw wireframe edges
                for (CUBE_EDGES) |edge| {
                    const v1 = projected_vertices[edge[0]];
                    const v2 = projected_vertices[edge[1]];
                    const color1 = CUBE_VERTICES[edge[0]].color;
                    const color2 = CUBE_VERTICES[edge[1]].color;

                    // Average colors for edge
                    const r = @as(u8, @intFromFloat((color1[0] + color2[0]) * 127.5));
                    const g = @as(u8, @intFromFloat((color1[1] + color2[1]) * 127.5));
                    const b = @as(u8, @intFromFloat((color1[2] + color2[2]) * 127.5));

                    _ = zsdl3.setRenderDrawColor(renderer, r, g, b, 255);
                    _ = zsdl3.renderLine(renderer, v1[0], v1[1], v2[0], v2[1]);
                }
            },
            .solid_faces => {
                // Render solid faces with backface culling
                for (CUBE_FACES) |face| {
                    // Simple backface culling - check if face is pointing towards camera
                    const edge1 = Vec3{
                        .x = transformed_vertices[face[1]].x - transformed_vertices[face[0]].x,
                        .y = transformed_vertices[face[1]].y - transformed_vertices[face[0]].y,
                        .z = transformed_vertices[face[1]].z - transformed_vertices[face[0]].z,
                    };
                    const edge2 = Vec3{
                        .x = transformed_vertices[face[2]].x - transformed_vertices[face[0]].x,
                        .y = transformed_vertices[face[2]].y - transformed_vertices[face[0]].y,
                        .z = transformed_vertices[face[2]].z - transformed_vertices[face[0]].z,
                    };

                    // Cross product for normal (just need z-component for backface culling)
                    const normal_z = edge1.x * edge2.y - edge1.y * edge2.x;

                    // Only render if facing camera
                    if (normal_z < 0) {
                        // Calculate face color (average of vertex colors)
                        var face_color = [3]f32{ 0, 0, 0 };
                        for (face) |vertex_index| {
                            const vertex_color = CUBE_VERTICES[vertex_index].color;
                            face_color[0] += vertex_color[0] / 4.0;
                            face_color[1] += vertex_color[1] / 4.0;
                            face_color[2] += vertex_color[2] / 4.0;
                        }

                        const r = @as(u8, @intFromFloat(face_color[0] * 255.0));
                        const g = @as(u8, @intFromFloat(face_color[1] * 255.0));
                        const b = @as(u8, @intFromFloat(face_color[2] * 255.0));
                        _ = zsdl3.setRenderDrawColor(renderer, r, g, b, 200);

                        // Draw filled polygon (triangle fan approach)
                        const v0 = projected_vertices[face[0]];
                        for (1..face.len - 1) |i| {
                            const v1 = projected_vertices[face[i]];
                            const v2 = projected_vertices[face[i + 1]];

                            // This is a simplified approach - in a real 3D engine you'd use
                            // proper polygon filling algorithms or triangles
                            _ = zsdl3.renderLine(renderer, v0[0], v0[1], v1[0], v1[1]);
                            _ = zsdl3.renderLine(renderer, v1[0], v1[1], v2[0], v2[1]);
                            _ = zsdl3.renderLine(renderer, v2[0], v2[1], v0[0], v0[1]);
                        }
                    }
                }
            },
            .vertices_only => {},
            .wireframe_and_vertices => {
                // Draw wireframe edges
                for (CUBE_EDGES) |edge| {
                    const v1 = projected_vertices[edge[0]];
                    const v2 = projected_vertices[edge[1]];
                    const color1 = CUBE_VERTICES[edge[0]].color;
                    const color2 = CUBE_VERTICES[edge[1]].color;

                    // Average colors for edge
                    const r = @as(u8, @intFromFloat((color1[0] + color2[0]) * 127.5));
                    const g = @as(u8, @intFromFloat((color1[1] + color2[1]) * 127.5));
                    const b = @as(u8, @intFromFloat((color1[2] + color2[2]) * 127.5));

                    _ = zsdl3.setRenderDrawColor(renderer, r, g, b, 255);
                    _ = zsdl3.renderLine(renderer, v1[0], v1[1], v2[0], v2[1]);
                }
            },
        }

        if (render_mode == .vertices_only or render_mode == .wireframe_and_vertices) {
            // Draw vertices as points
            for (projected_vertices, CUBE_VERTICES) |vertex, original_vertex| {
                const color = original_vertex.color;
                const r = @as(u8, @intFromFloat(color[0] * 255.0));
                const g = @as(u8, @intFromFloat(color[1] * 255.0));
                const b = @as(u8, @intFromFloat(color[2] * 255.0));

                _ = zsdl3.setRenderDrawColor(renderer, r, g, b, 255);
                const points = [_]zsdl3.SDL_FPoint{zsdl3.SDL_FPoint{ .x = vertex[0], .y = vertex[1] }};
                _ = zsdl3.renderPoints(renderer, &points, 1);
            }
        }

        zsdl3.renderPresent(renderer);

        // Update FPS counter and title
        frame_count += 1;
        if (frame_count % 60 == 0) {
            const elapsed = @as(f32, @floatFromInt(zsdl3.getTicks() - start_time)) / 1000.0;
            const fps = @as(f32, @floatFromInt(frame_count)) / elapsed;

            const mode_name = switch (render_mode) {
                .wireframe => "Wireframe",
                .solid_faces => "Solid Faces",
                .vertices_only => "Vertices Only",
                .wireframe_and_vertices => "Wireframe + Vertices",
            };

            const rotate_status = if (auto_rotate) "Auto-Rotate" else "Manual";

            var title_buf: [256]u8 = undefined;
            const title = std.fmt.bufPrintZ(&title_buf, "ZSDL3 3D Example - {s} - {s} - FPS: {d:.1}", .{ mode_name, rotate_status, fps }) catch "ZSDL3 3D Example";
            _ = zsdl3.setWindowTitle(window, title.ptr);
        }

        zsdl3.delay(16); // ~60 FPS
    }
}
