// Clipboard & System Info Example
// Demonstrates: clipboard get/set, system RAM, platform info, power status.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() void {
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to initialize SDL: {s}", .{err});
        return;
    }
    defer zsdl3.quit();

    std.log.info("=== System Info ===", .{});
    const ram = zsdl3.getSystemRAM();
    std.log.info("System RAM: {d} MB", .{ram});

    const alignment = zsdl3.getSIMDAlignment();
    std.log.info("SIMD alignment: {d}", .{alignment});

    if (zsdl3.getPlatform()) |platform| {
        std.log.info("Platform: {s}", .{platform});
    }

    std.log.info("=== Power Info ===", .{});
    var secs: c_int = 0;
    var pct: c_int = 0;
    const power_state = zsdl3.getPowerInfo(&secs, &pct);
    std.log.info("Power state: {}", .{@intFromEnum(power_state)});
    if (secs >= 0) std.log.info("Battery time: {d}s", .{secs});
    if (pct >= 0) std.log.info("Battery charge: {d}%", .{pct});

    std.log.info("=== Clipboard ===", .{});
    if (zsdl3.hasClipboardText()) {
        if (zsdl3.getClipboardText()) |text| {
            std.log.info("Clipboard contents: {s}", .{text});
        }
    } else {
        std.log.info("Clipboard is empty, setting test text...", .{});
        _ = zsdl3.setClipboardText("Hello from zsdl3 clipboard example!");
        if (zsdl3.getClipboardText()) |text| {
            std.log.info("Set clipboard to: {s}", .{text});
        }
    }

    std.log.info("Clipboard test complete!", .{});
}
