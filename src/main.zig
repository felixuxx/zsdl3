const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    // Initialize SDL
    if (zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        std.debug.print("SDL initialized successfully!\n", .{});

        // Create a window
        const window = zsdl3.createWindow("ZSDL3 Test", 800, 600, 0);
        if (window) |win| {
            std.debug.print("Window created successfully!\n", .{});
            zsdl3.destroyWindow(win);
        } else {
            std.debug.print("Failed to create window: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
        }

        zsdl3.quit();
    } else {
        std.debug.print("Failed to initialize SDL: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
    }
}

test "simple test" {
    const gpa = std.testing.allocator;
    var list: std.ArrayList(i32) = .empty;
    defer list.deinit(gpa);
    try list.append(gpa, 42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
