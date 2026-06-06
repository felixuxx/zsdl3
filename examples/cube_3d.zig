// 3D Cube Example
// Renders a fully 3D rotating cube with perspective projection,
// per-face lighting, and depth-sorted triangles.
// Demonstrates: 3D math, projection, SDL_RenderGeometry for filled tris,
// event loop, and real-time rotation.

const std = @import("std");

const zsdl3 = @import("zsdl3");

const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,
};

const Tri = struct {
    indices: [3]usize,
    color: [4]f32,
};

const cube_verts = [_]Vec3{
    .{ .x = -1, .y = -1, .z = -1 }, // 0
    .{ .x = 1, .y = -1, .z = -1 }, // 1
    .{ .x = 1, .y = 1, .z = -1 }, // 2
    .{ .x = -1, .y = 1, .z = -1 }, // 3
    .{ .x = -1, .y = -1, .z = 1 }, // 4
    .{ .x = 1, .y = -1, .z = 1 }, // 5
    .{ .x = 1, .y = 1, .z = 1 }, // 6
    .{ .x = -1, .y = 1, .z = 1 }, // 7
};

const face_colors = [_][4]f32{
    .{ 1.0, 0.2, 0.2, 1.0 }, // front  - red
    .{ 0.2, 1.0, 0.2, 1.0 }, // back   - green
    .{ 0.2, 0.2, 1.0, 1.0 }, // left   - blue
    .{ 1.0, 1.0, 0.2, 1.0 }, // right  - yellow
    .{ 1.0, 0.2, 1.0, 1.0 }, // top    - magenta
    .{ 0.2, 1.0, 1.0, 1.0 }, // bottom - cyan
};

const cube_tris = [_]Tri{
    // Front face (z = 1)
    .{ .indices = .{ 4, 5, 6 }, .color = face_colors[0] },
    .{ .indices = .{ 4, 6, 7 }, .color = face_colors[0] },
    // Back face (z = -1)
    .{ .indices = .{ 1, 0, 3 }, .color = face_colors[1] },
    .{ .indices = .{ 1, 3, 2 }, .color = face_colors[1] },
    // Left face (x = -1)
    .{ .indices = .{ 0, 4, 7 }, .color = face_colors[2] },
    .{ .indices = .{ 0, 7, 3 }, .color = face_colors[2] },
    // Right face (x = 1)
    .{ .indices = .{ 5, 1, 2 }, .color = face_colors[3] },
    .{ .indices = .{ 5, 2, 6 }, .color = face_colors[3] },
    // Top face (y = 1)
    .{ .indices = .{ 7, 6, 2 }, .color = face_colors[4] },
    .{ .indices = .{ 7, 2, 3 }, .color = face_colors[4] },
    // Bottom face (y = -1)
    .{ .indices = .{ 0, 1, 5 }, .color = face_colors[5] },
    .{ .indices = .{ 0, 5, 4 }, .color = face_colors[5] },
};

fn rotateX(v: Vec3, angle: f32) Vec3 {
    const c = @cos(angle);
    const s = @sin(angle);
    return .{
        .x = v.x,
        .y = v.y * c - v.z * s,
        .z = v.y * s + v.z * c,
    };
}

fn rotateY(v: Vec3, angle: f32) Vec3 {
    const c = @cos(angle);
    const s = @sin(angle);
    return .{
        .x = v.x * c + v.z * s,
        .y = v.y,
        .z = -v.x * s + v.z * c,
    };
}

fn project(v: Vec3, focal_length: f32, aspect: f32, center_x: f32, center_y: f32) struct { x: f32, y: f32, z: f32 } {
    const z_clamped = if (v.z < 0.01) @as(f32, 0.01) else v.z;
    const inv_z = 1.0 / z_clamped;
    return .{
        .x = v.x * focal_length * inv_z * aspect + center_x,
        .y = -v.y * focal_length * inv_z + center_y,
        .z = z_clamped,
    };
}

fn computeNormal(a: Vec3, b: Vec3, c: Vec3) Vec3 {
    const u = Vec3{ .x = b.x - a.x, .y = b.y - a.y, .z = b.z - a.z };
    const v = Vec3{ .x = c.x - a.x, .y = c.y - a.y, .z = c.z - a.z };
    const nx = u.y * v.z - u.z * v.y;
    const ny = u.z * v.x - u.x * v.z;
    const nz = u.x * v.y - u.y * v.x;
    const len = @sqrt(nx * nx + ny * ny + nz * nz);
    if (len == 0) return .{ .x = 0, .y = 0, .z = 0 };
    return .{ .x = nx / len, .y = ny / len, .z = nz / len };
}

pub fn main() !void {
    var sdl = try zsdl3.SDL.load();
    defer sdl.unload();

    const window = sdl.video.createWindow("3D Cube", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
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

    var yaw: f32 = 0.0;
    var pitch: f32 = 0.0;
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

        _ = sdl.render.setRenderDrawColor(renderer, 15, 15, 20, 255);
        _ = sdl.render.renderClear(renderer);

        var output_w: c_int = 800;
        var output_h: c_int = 600;
        _ = sdl.render.getCurrentRenderOutputSize(renderer, &output_w, &output_h);

        const center_x: f32 = @as(f32, @floatFromInt(output_w)) / 2.0;
        const center_y: f32 = @as(f32, @floatFromInt(output_h)) / 2.0;
        const aspect = @as(f32, @floatFromInt(output_w)) / @as(f32, @floatFromInt(output_h));
        const focal_length = @as(f32, @floatFromInt(@min(output_w, output_h)));

        yaw += 0.008;
        pitch += 0.005;

        const light_dir = Vec3{ .x = 0.5, .y = -0.7, .z = -0.5 };
        const light_len = @sqrt(light_dir.x * light_dir.x + light_dir.y * light_dir.y + light_dir.z * light_dir.z);
        const light = Vec3{ .x = light_dir.x / light_len, .y = light_dir.y / light_len, .z = light_dir.z / light_len };

        var transformed_verts: [8]Vec3 = undefined;
        for (&cube_verts, 0..) |v, i| {
            var tv = rotateY(v, yaw);
            tv = rotateX(tv, pitch);
            tv.z += 6.0;
            transformed_verts[i] = tv;
        }

        const TriDepth = struct {
            tri_idx: usize,
            depth: f32,
        };

        var tri_depths: [cube_tris.len]TriDepth = undefined;
        for (&cube_tris, 0..) |tri, i| {
            const va = transformed_verts[tri.indices[0]];
            const vb = transformed_verts[tri.indices[1]];
            const vc = transformed_verts[tri.indices[2]];
            const depth = (va.z + vb.z + vc.z) / 3.0;
            tri_depths[i] = .{ .tri_idx = i, .depth = depth };
        }

        std.sort.block(TriDepth, &tri_depths, {}, struct {
            fn lessThan(_: void, a: TriDepth, b: TriDepth) bool {
                return a.depth > b.depth;
            }
        }.lessThan);

        var sdl_vertices: [cube_tris.len * 3]zsdl3.SDL_Vertex = undefined;
        var indices: [cube_tris.len * 3]c_int = undefined;

        var vert_count: usize = 0;
        for (&tri_depths) |td| {
            const tri = cube_tris[td.tri_idx];
            const va = transformed_verts[tri.indices[0]];
            const vb = transformed_verts[tri.indices[1]];
            const vc = transformed_verts[tri.indices[2]];

            const normal = computeNormal(va, vb, vc);
            const dot = normal.x * light.x + normal.y * light.y + normal.z * light.z;
            const intensity = @min(1.0, @max(0.15, dot * 0.7 + 0.3));

            const pa = project(va, focal_length, aspect, center_x, center_y);
            const pb = project(vb, focal_length, aspect, center_x, center_y);
            const pc = project(vc, focal_length, aspect, center_x, center_y);

            const color = tri.color;
            for (&[_]struct { x: f32, y: f32 }{ .{ .x = pa.x, .y = pa.y }, .{ .x = pb.x, .y = pb.y }, .{ .x = pc.x, .y = pc.y } }) |p| {
                sdl_vertices[vert_count] = .{
                    .position = .{ .x = p.x, .y = p.y },
                    .color = .{
                        .r = color[0] * intensity,
                        .g = color[1] * intensity,
                        .b = color[2] * intensity,
                        .a = 1.0,
                    },
                    .tex_coord = .{ .x = 0, .y = 0 },
                };
                indices[vert_count] = @intCast(vert_count);
                vert_count += 1;
            }
        }

        _ = sdl.render.renderGeometry(renderer, null, &sdl_vertices, @intCast(vert_count), &indices, @intCast(indices.len));

        _ = sdl.render.renderPresent(renderer);
        sdl.time.delay(16);
    }
}
