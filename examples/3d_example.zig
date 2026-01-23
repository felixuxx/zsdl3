const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    // Initialize SDL with video
    if (zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        defer zsdl3.quit();

        std.debug.print("3D GPU Rendering Example\n", .{});

        // Create window
        const window = zsdl3.createWindow("ZSDL3 3D GPU Example", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
        if (window) |win| {
            defer zsdl3.destroyWindow(win);

            // Try to create GPU device with Vulkan preference
            const device = zsdl3.createGPUDevice(zsdl3.SDL_GPU_SHADERFORMAT_SPIRV, false, null);
            if (device) |dev| {
                defer zsdl3.destroyGPUDevice(dev);

                std.debug.print("GPU device created successfully!\n", .{});

                // Claim window for GPU rendering
                if (zsdl3.claimWindowForGPUDevice(dev, win)) {
                    defer zsdl3.releaseWindowFromGPUDevice(dev, win);

                    std.debug.print("Window claimed for GPU rendering\n", .{});

                    // Note: For a complete 3D example, we would need:
                    // - SDL_CreateGPUVertexBuffer / SDL_CreateGPUIndexBuffer
                    // - SDL_CreateGPUTransferBuffer for data upload
                    // - SDL_UploadToGPU for vertex/index data
                    // - SDL_CreateGPUGraphicsPipeline with shaders
                    // - SDL_BeginGPURenderPass for rendering
                    // - SDL_BindGPUVertexBuffers / SDL_DrawGPUPrimitives

                    std.debug.print("GPU setup complete - ready for 3D rendering!\n", .{});
                    std.debug.print("(Full 3D pipeline requires additional GPU bindings)\n", .{});

                    // Keep window open briefly
                    zsdl3.delay(2000);
                } else {
                    std.debug.print("Failed to claim window for GPU: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
                }
            } else {
                std.debug.print("GPU device creation failed: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
                std.debug.print("3D rendering requires Vulkan, D3D12, or Metal support\n", .{});

                // Fallback: show render-based 2D as alternative
                const renderer = zsdl3.createRenderer(win, null, 0);
                if (renderer) |rend| {
                    defer zsdl3.destroyRenderer(rend);

                    std.debug.print("Falling back to 2D rendering with renderer\n", .{});

                    var running = true;
                    var angle: f32 = 0;

                    while (running and angle < 360) {
                        // Handle events
                        var event: zsdl3.SDL_Event = undefined;
                        while (zsdl3.pollEvent(&event)) {
                            if (event.type == zsdl3.SDL_EVENT_QUIT) running = false;
                        }

                        // Clear
                        _ = zsdl3.setRenderDrawColor(rend, 20, 20, 40, 255);
                        _ = zsdl3.renderClear(rend);

                        // Draw rotating "3D-like" elements
                        _ = zsdl3.setRenderDrawColor(rend, 255, 100, 100, 255);

                        // Simulate 3D rotation with scaling
                        const scale = 1.0 + 0.5 * @sin(angle * std.math.pi / 180.0);
                        const size = @as(c_int, @intFromFloat(50 * scale));

                        const rect = zsdl3.SDL_FRect{
                            .x = @as(f32, @floatFromInt(400 - @divTrunc(size, 2))),
                            .y = @as(f32, @floatFromInt(300 - @divTrunc(size, 2))),
                            .w = @as(f32, @floatFromInt(size)),
                            .h = @as(f32, @floatFromInt(size)),
                        };
                        _ = zsdl3.renderFillRect(rend, &rect);

                        // Draw "depth" lines
                        _ = zsdl3.setRenderDrawColor(rend, 100, 255, 100, 255);
                        _ = zsdl3.renderLine(rend, @as(f32, @floatFromInt(400 + @as(c_int, @intFromFloat(100 * @cos((angle + 45) * std.math.pi / 180.0))))), @as(f32, @floatFromInt(300 + @as(c_int, @intFromFloat(100 * @sin((angle + 45) * std.math.pi / 180.0))))), @as(f32, @floatFromInt(400 + @as(c_int, @intFromFloat(150 * @cos((angle + 135) * std.math.pi / 180.0))))), @as(f32, @floatFromInt(300 + @as(c_int, @intFromFloat(150 * @sin((angle + 135) * std.math.pi / 180.0))))));

                        zsdl3.renderPresent(rend);

                        angle += 2;
                        zsdl3.delay(16);
                    }

                    std.debug.print("2D fallback rendering completed\n", .{});
                }
            }

            std.debug.print("3D GPU Example completed!\n", .{});
        } else {
            std.debug.print("Failed to create window: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
        }
    } else {
        std.debug.print("Failed to initialize SDL: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
    }
}
