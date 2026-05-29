// Dialog & MessageBox Example
// Opens a file dialog and shows the result in a message box.
// Demonstrates: SDL_ShowOpenFileDialog, SDL_ShowSimpleMessageBox.

const std = @import("std");
const zsdl3 = @import("zsdl3");

fn fileDialogCallback(userdata: ?*anyopaque, files: ?[*]const ?[*:0]const u8, count: c_int) callconv(.c) void {
    const ctx: *bool = @ptrCast(@alignCast(userdata orelse return));
    ctx.* = true;
    if (count > 0) {
        if (files) |f| {
            if (f[0]) |path| {
                std.log.info("Selected file: {s}", .{path});
            }
        }
    } else {
        std.log.info("File dialog cancelled", .{});
    }
}

pub fn main() void {
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to initialize SDL: {s}", .{err});
        return;
    }
    defer zsdl3.quit();

    const window = zsdl3.createWindow("Dialog Test", 400, 300, zsdl3.SDL_WINDOW_RESIZABLE) orelse return;
    defer zsdl3.destroyWindow(window);

    std.log.info("Opening file dialog...", .{});

    const filter = [_]zsdl3.SDL_DialogFileFilter{
        .{ .name = "All files", .pattern = "*" },
    };

    var dialog_done = false;
    zsdl3.showOpenFileDialog(fileDialogCallback, &dialog_done, window, &filter, 1, null, false);

    var running = true;
    while (running) {
        var event: zsdl3.SDL_Event = undefined;
        while (zsdl3.pollEvent(&event)) {
            switch (event.type) {
                zsdl3.SDL_EVENT_QUIT => running = false,
                zsdl3.SDL_EVENT_KEY_DOWN => {
                    if (event.key.scancode == zsdl3.SDL_SCANCODE_ESCAPE) running = false;
                },
                else => {},
            }
        }
        if (dialog_done) {
            _ = zsdl3.showSimpleMessageBox(zsdl3.SDL_MESSAGEBOX_INFORMATION, "File Dialog", "File dialog completed! Check console for path.", window);
            dialog_done = false;
        }
        zsdl3.delay(16);
    }

    std.log.info("Dialog test complete!", .{});
}
