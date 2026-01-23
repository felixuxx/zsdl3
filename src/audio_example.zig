const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    // Initialize SDL with audio
    if (zsdl3.init(zsdl3.SDL_INIT_AUDIO)) {
        defer zsdl3.quit();

        std.debug.print("Audio Example - Testing audio device enumeration\n", .{});

        // Get audio driver info
        const driver = zsdl3.getCurrentAudioDriver();
        if (driver) |d| {
            std.debug.print("Current audio driver: {s}\n", .{d});
        }

        const num_drivers = zsdl3.getNumAudioDrivers();
        std.debug.print("Available audio drivers: {d}\n", .{num_drivers});

        var i: c_int = 0;
        while (i < num_drivers) : (i += 1) {
            const driver_name = zsdl3.getAudioDriver(i);
            if (driver_name) |name| {
                std.debug.print("  Driver {d}: {s}\n", .{ i, name });
            }
        }

        // Try to open default audio device
        var spec: zsdl3.SDL_AudioSpec = undefined;
        var obtained: zsdl3.SDL_AudioSpec = undefined;

        const device_id = zsdl3.openAudioDevice(null, false, &spec, &obtained, 0);
        if (device_id != 0) {
            defer zsdl3.closeAudioDevice(device_id);

            std.debug.print("Audio device opened successfully!\n", .{});
            std.debug.print("  Format: {d}, Channels: {d}, Freq: {d}\n", .{ obtained.format, obtained.channels, obtained.freq });

            // Test pause/unpause
            _ = zsdl3.pauseAudioDevice(device_id, true); // Pause
            std.debug.print("Audio device paused\n", .{});
            _ = zsdl3.pauseAudioDevice(device_id, false); // Unpause
            std.debug.print("Audio device unpaused\n", .{});
        } else {
            std.debug.print("Failed to open audio device: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
        }

        std.debug.print("Audio Example completed!\n", .{});
    } else {
        std.debug.print("Failed to initialize SDL audio: {s}\n", .{zsdl3.getError() orelse "Unknown error"});
    }
}
