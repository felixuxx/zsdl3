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

pub fn main() !void {
    var sdl = try zsdl3.SDL.load();
    defer sdl.unload();

    const window = sdl.video.createWindow("Dialog Test", 400, 300, zsdl3.SDL_WINDOW_RESIZABLE) orelse return;
    defer sdl.video.destroyWindow(window);

    std.log.info("Opening file dialog...", .{});

    const filter = [_]zsdl3.SDL_DialogFileFilter{
        .{ .name = "All files", .pattern = "*" },
    };

    var dialog_done = false;
    sdl.dialog.showOpenFileDialog(fileDialogCallback, &dialog_done, window, &filter, 1, null, false);

    var running = true;
    while (running) {
        var event: zsdl3.SDL_Event = undefined;
        while (sdl.events.pollEvent(&event)) {
            switch (event.type) {
                zsdl3.SDL_EVENT_QUIT => running = false,
                zsdl3.SDL_EVENT_KEY_DOWN => {
                    if (event.key.scancode == zsdl3.SDL_SCANCODE_ESCAPE) running = false;
                },
                else => {},
            }
        }
        if (dialog_done) {
            _ = sdl.messagebox.showSimpleMessageBox(zsdl3.SDL_MESSAGEBOX_INFORMATION, "File Dialog", "File dialog completed! Check console for path.", window);
            dialog_done = false;
        }
        sdl.time.delay(16);
    }

    std.log.info("Dialog test complete!", .{});
}
