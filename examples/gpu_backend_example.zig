const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    // Initialize SDL with GPU support
    if (zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        defer zsdl3.quit();

        std.debug.print("SDL3 GPU Backend Example\n", .{});

        // List available GPU drivers
        const num_drivers = zsdl3.getNumGPUDrivers();
        std.debug.print("Available GPU drivers: {}\n", .{num_drivers});

        var i: c_int = 0;
        while (i < num_drivers) : (i += 1) {
            if (zsdl3.getGPUDriver(i)) |driver_name| {
                std.debug.print("  Driver {}: {s}\n", .{ i, driver_name });
            }
        }

        // Create window
        const window = zsdl3.createWindow("GPU Backend Example", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
        if (window) |win| {
            defer zsdl3.destroyWindow(win);

            // Create GPU device with Vulkan driver
            const device = zsdl3.createGPUDevice(zsdl3.SDL_GPU_SHADERFORMAT_SPIRV, false, "vulkan");
            if (device) |dev| {
                defer zsdl3.destroyGPUDevice(dev);

                std.debug.print("GPU device created with Vulkan driver!\n", .{});

                // Get GPU device driver info
                if (zsdl3.getGPUDeviceDriver(dev)) |driver_name| {
                    std.debug.print("GPU driver: {s}\n", .{driver_name});
                }

                // Claim window for GPU
                if (zsdl3.claimWindowForGPUDevice(dev, win)) {
                    defer zsdl3.releaseWindowFromGPUDevice(dev, win);

                    std.debug.print("Window claimed for GPU rendering\n", .{});
                    std.debug.print("GPU backend setup complete!\n", .{});

                    // Keep window open for testing
                    zsdl3.delay(2000);
                } else {
                    std.debug.print("Failed to claim window for GPU\n", .{});
                }
            } else {
                std.debug.print("Failed to create GPU device\n", .{});

                // Try with any available driver
                const fallback_device = zsdl3.createGPUDevice(0, false, null);
                if (fallback_device) |dev| {
                    defer zsdl3.destroyGPUDevice(dev);
                    std.debug.print("GPU device created with fallback driver!\n", .{});

                    if (zsdl3.claimWindowForGPUDevice(dev, win)) {
                        defer zsdl3.releaseWindowFromGPUDevice(dev, win);
                        std.debug.print("Window claimed for GPU rendering\n", .{});
                        std.debug.print("GPU backend setup complete with fallback!\n", .{});

                        zsdl3.delay(2000);
                    }
                }
            }
        } else {
            std.debug.print("Failed to create window\n", .{});
        }
    } else {
        std.debug.print("Failed to initialize SDL3\n", .{});
    }
}
