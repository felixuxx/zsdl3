// Clipboard & System Info Example
// Demonstrates: clipboard get/set/clear, system RAM, page size, platform info, power status.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    var sdl = try zsdl3.SDL.load();
    defer sdl.unload();

    std.log.info("=== System Info ===", .{});
    const ram = sdl.system.getSystemRAM();
    std.log.info("System RAM: {d} MB", .{ram});

    const page_size = sdl.cpuinfo.getSystemPageSize();
    std.log.info("System page size: {d} bytes", .{page_size});

    const alignment = sdl.system.getSIMDAlignment();
    std.log.info("SIMD alignment: {d}", .{alignment});

    if (sdl.platform.getPlatform()) |platform| {
        std.log.info("Platform: {s}", .{platform});
    }

    std.log.info("=== Power Info ===", .{});
    var secs: c_int = 0;
    var pct: c_int = 0;
    const power_state = sdl.power.getPowerInfo(&secs, &pct);
    std.log.info("Power state: {}", .{@intFromEnum(power_state)});
    if (secs >= 0) std.log.info("Battery time: {d}s", .{secs});
    if (pct >= 0) std.log.info("Battery charge: {d}%", .{pct});

    std.log.info("=== Clipboard ===", .{});
    if (sdl.clipboard.hasClipboardText()) {
        if (sdl.clipboard.getClipboardText()) |text| {
            std.log.info("Clipboard contents: {s}", .{text});
        }
    } else {
        std.log.info("Clipboard is empty, setting test text...", .{});
        _ = sdl.clipboard.setClipboardText("Hello from zsdl3 clipboard example!");
        if (sdl.clipboard.getClipboardText()) |text| {
            std.log.info("Set clipboard to: {s}", .{text});
        }
    }

    // Clear the clipboard
    _ = sdl.clipboard.clearClipboardData();
    std.log.info("Clipboard cleared, has text: {}", .{sdl.clipboard.hasClipboardText()});

    std.log.info("Clipboard test complete!", .{});
}
