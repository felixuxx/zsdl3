// Process Spawning Example
// Spawns a process and reads its output.
// Demonstrates: SDL_CreateProcess, SDL_GetProcessOutput, SDL_WaitProcess.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() void {
    if (!zsdl3.init(0)) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to initialize SDL: {s}", .{err});
        return;
    }
    defer zsdl3.quit();

    std.log.info("=== Process Example ===", .{});

    const args = [_]?[*:0]const u8{ "echo", "Hello from SDL3 process!", null };

    const process = zsdl3.createProcess(&args, false);
    if (process == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create process: {s}", .{err});
        return;
    }
    defer zsdl3.destroyProcess(process);

    std.log.info("Process created, waiting for output...", .{});

    var exitcode: c_int = 0;
    _ = zsdl3.waitProcess(process, true, &exitcode);
    std.log.info("Process exited with code: {d}", .{exitcode});

    if (zsdl3.getProcessOutput(process)) |output| {
        var buf: [4096]u8 = undefined;
        const bytes_read = zsdl3.readIO(output, &buf, buf.len);
        if (bytes_read > 0) {
            std.log.info("Process output ({d} bytes): {s}", .{ bytes_read, buf[0..bytes_read] });
        }
        _ = zsdl3.closeIO(output);
    }

    std.log.info("Process test complete!", .{});
}
