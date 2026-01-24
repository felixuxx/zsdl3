const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    if (zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        defer zsdl3.quit();

        std.debug.print("Simple Vulkan Test (SDL3 GPU Backend)\n", .{});

        const window = zsdl3.createWindow("Vulkan Test", 800, 600, zsdl3.SDL_WINDOW_VULKAN);
        if (window) |win| {
            defer zsdl3.destroyWindow(win);

            std.debug.print("Vulkan window created successfully!\n", .{});

            // Load Vulkan library
            if (!zsdl3.vulkanLoadLibrary()) {
                std.debug.print("Failed to load Vulkan library\n", .{});
                return;
            }
            defer zsdl3.vulkanUnloadLibrary();

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
            std.debug.print("Vulkan setup working! Ready for 3D rendering.\n", .{});

            zsdl3.delay(2000);
        } else {
            std.debug.print("Failed to create Vulkan window\n", .{});
        }
    } else {
        std.debug.print("Failed to initialize SDL3\n", .{});
    }
}
