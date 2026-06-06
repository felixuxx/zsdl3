// Process Spawning Example
// Spawns processes and reads their output.
// Demonstrates: SDL_CreateProcess, SDL_CreateProcessWithProperties,
// SDL_GetProcessOutput, SDL_GetProcessProperties, SDL_ReadProcess, SDL_WaitProcess.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    var sdl = try zsdl3.SDL.load();
    defer sdl.unload();

    std.log.info("=== Process Example ===", .{});

    // --- Method 1: createProcess ---
    std.log.info("--- Method 1: createProcess ---", .{});
    const args = [_]?[*:0]const u8{ "echo", "Hello from SDL3 process!", null };

    const process = sdl.process.createProcess(&args, false);
    if (process == null) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to create process: {s}", .{err});
        return;
    }
    defer sdl.process.destroyProcess(process);

    // Query process properties
    const props = sdl.process.getProcessProperties(process);
    std.log.info("Process properties ID: {d}", .{props});

    std.log.info("Process created, waiting for output...", .{});

    var exitcode: c_int = 0;
    _ = sdl.process.waitProcess(process, true, &exitcode);
    std.log.info("Process exited with code: {d}", .{exitcode});

    if (sdl.process.getProcessOutput(process)) |output| {
        var buf: [4096]u8 = undefined;
        const bytes_read = sdl.filesystem.readIO(output, &buf, buf.len);
        if (bytes_read > 0) {
            std.log.info("Process output ({d} bytes): {s}", .{ bytes_read, buf[0..bytes_read] });
        }
        _ = sdl.filesystem.closeIO(output);
    }

    // --- Method 2: readProcess (simpler alternative) ---
    std.log.info("--- Method 2: readProcess ---", .{});
    const args2 = [_]?[*:0]const u8{ "echo", "Read process output", null };
    const process2 = sdl.process.createProcess(&args2, false);
    if (process2) |proc| {
        var datasize: usize = 0;
        var read_exitcode: c_int = 0;
        const data = sdl.process.readProcess(proc, &datasize, &read_exitcode);
        if (data) |d| {
            const bytes = @as([*]const u8, @ptrCast(d))[0..datasize];
            std.log.info("readProcess output ({d} bytes): {s}", .{ datasize, bytes });
        }
        std.log.info("readProcess exit code: {d}", .{read_exitcode});
        sdl.process.destroyProcess(proc);
    }

    std.log.info("Process test complete!", .{});
}
