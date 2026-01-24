const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    // Initialize SDL3 for windowing only
    if (zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        defer zsdl3.quit();

        std.debug.print("Vulkan Rendering Example (SDL3 GPU Backend)\n", .{});

        // Create window with Vulkan flag
        const window = zsdl3.createWindow("Vulkan Example", 800, 600, zsdl3.SDL_WINDOW_VULKAN);
        if (window) |win| {
            defer zsdl3.destroyWindow(win);

            std.debug.print("Vulkan window created\n", .{});

            // Load Vulkan library via SDL3
            if (!zsdl3.vulkanLoadLibrary()) {
                std.debug.print("Failed to load Vulkan library\n", .{});
                return;
            }
            defer zsdl3.vulkanUnloadLibrary();

            std.debug.print("Vulkan library loaded via SDL3\n", .{});

            // Get Vulkan instance extensions required by SDL3
            var extension_count: u32 = 0;
            if (!zsdl3.vulkanGetInstanceExtensions(win, &extension_count, null)) {
                std.debug.print("Failed to get Vulkan instance extension count\n", .{});
                return;
            }

            const extensions = try std.heap.page_allocator.alloc(?[*:0]const u8, extension_count);
            defer std.heap.page_allocator.free(extensions);

            if (!zsdl3.vulkanGetInstanceExtensions(win, &extension_count, extensions.ptr)) {
                std.debug.print("Failed to get Vulkan instance extensions\n", .{});
                return;
            }

            std.debug.print("Got {} Vulkan extensions\n", .{extension_count});
            std.debug.print("Vulkan setup complete! Ready for rendering.\n", .{});

            // Keep window open for testing
            zsdl3.delay(3000);
        } else {
            std.debug.print("Failed to create Vulkan window\n", .{});
        }
    } else {
        std.debug.print("Failed to initialize SDL3\n", .{});
    }
}
