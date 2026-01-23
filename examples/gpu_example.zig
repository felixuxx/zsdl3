const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    // Initialize SDL with GPU support
    if (zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        defer zsdl3.quit();

        std.debug.print("3D GPU Example - Testing GPU device creation\n", .{});

        // Create window
        const window = zsdl3.createWindow("ZSDL3 3D GPU Example", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
        if (window) |win| {
            defer zsdl3.destroyWindow(win);

            // Try to create GPU device
            const device = zsdl3.createGPUDevice(0, false, null); // Try default shaders
            if (device) |dev| {
                defer zsdl3.destroyGPUDevice(dev);

                std.debug.print("GPU device created successfully!\n", .{});

                // Claim window for GPU
                if (zsdl3.claimWindowForGPUDevice(dev, win)) {
                    defer zsdl3.releaseWindowFromGPUDevice(dev, win);

                    std.debug.print("Window claimed for GPU rendering\n", .{});

                    // Create command buffer
                    const cmdbuf = zsdl3.acquireGPUCommandBuffer(dev);
                    if (cmdbuf) |buf| {
                        // Submit empty command buffer (just testing)
                        if (zsdl3.submitGPUCommandBuffer(buf)) {
                            std.debug.print("GPU command buffer submitted successfully\n", .{});
                        } else {
                            std.debug.print("Failed to submit GPU command buffer: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
                        }
                    } else {
                        std.debug.print("Failed to acquire GPU command buffer: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
                    }
                } else {
                    std.debug.print("Failed to claim window for GPU: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
                }
            } else {
                std.debug.print("GPU device creation failed (expected on systems without Vulkan/D3D12/Metal): {s}\n", .{zsdl3.getError() orelse "Unknown error"});
                std.debug.print("This is normal - 3D GPU requires compatible graphics drivers\n", .{});
            }

            // Test atomic operations
            var spinlock: zsdl3.SDL_SpinLock = 0;
            zsdl3.lockSpinlock(&spinlock);
            std.debug.print("Spinlock test successful\n", .{});
            zsdl3.unlockSpinlock(&spinlock);

            // Test GUID
            var guid_str: [37]u8 = undefined;
            const test_guid = zsdl3.stringToGUID("12345678-1234-1234-1234-123456789012");
            zsdl3.guidToString(test_guid, @as(?[*:0]u8, @ptrCast(&guid_str)), @as(c_int, @intCast(guid_str.len)));
            std.debug.print("GUID test: {s}\n", .{std.mem.span(@as([*:0]u8, @ptrCast(&guid_str)))});

            std.debug.print("3D GPU Example completed successfully!\n", .{});
        } else {
            std.debug.print("Failed to create window: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
        }
    } else {
        std.debug.print("Failed to initialize SDL: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
    }
}
