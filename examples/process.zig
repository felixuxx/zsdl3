// Process Spawning Example
// Spawns processes and reads their output.
// Demonstrates: SDL_CreateProcess, SDL_CreateProcessWithProperties,
// SDL_GetProcessOutput, SDL_GetProcessProperties, SDL_ReadProcess, SDL_WaitProcess.

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

    // --- Method 1: createProcess ---
    std.log.info("--- Method 1: createProcess ---", .{});
    const args = [_]?[*:0]const u8{ "echo", "Hello from SDL3 process!", null };

    const process = zsdl3.createProcess(&args, false);
    if (process == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to create process: {s}", .{err});
        return;
    }
    defer zsdl3.destroyProcess(process);

    // Query process properties
    const props = zsdl3.getProcessProperties(process);
    std.log.info("Process properties ID: {d}", .{props});

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

    // --- Method 2: readProcess (simpler alternative) ---
    std.log.info("--- Method 2: readProcess ---", .{});
    const args2 = [_]?[*:0]const u8{ "echo", "Read process output", null };
    const process2 = zsdl3.createProcess(&args2, false);
    if (process2) |proc| {
        var datasize: usize = 0;
        var read_exitcode: c_int = 0;
        const data = zsdl3.readProcess(proc, &datasize, &read_exitcode);
        defer if (data) |d| zsdl3.stdinc.free(d);
        if (data) |d| {
            const bytes = @as([*]const u8, @ptrCast(d))[0..datasize];
            std.log.info("readProcess output ({d} bytes): {s}", .{ datasize, bytes });
        }
        std.log.info("readProcess exit code: {d}", .{read_exitcode});
        zsdl3.destroyProcess(proc);
    }

    std.log.info("Process test complete!", .{});
}
