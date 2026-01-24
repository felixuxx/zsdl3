const std = @import("std");
const zsdl3 = @import("zsdl3");
pub fn main() !void {
    if (zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        defer zsdl3.quit();

        const loaded = zsdl3.vulkanLoadLibrary();
        std.debug.print("SDL3 Vulkan library loaded: {}\n", .{loaded});

        if (loaded) {
            const extensions = zsdl3.vulkanGetInstanceExtensions(null);
            std.debug.print("Vulkan extensions available: {}\n", .{extensions != null});
        } else {
            std.debug.print("SDL3 Vulkan NOT supported - rebuild SDL3 with Vulkan\n", .{});
        }
    } else {
        std.debug.print("SDL init failed\n", .{});
    }
}
