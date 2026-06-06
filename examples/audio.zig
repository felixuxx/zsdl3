// Audio Playback Example
// Generates a sine wave and plays it through the default audio device.
// Demonstrates: audio device enumeration, stream creation, data queue,
// gain control, frequency ratio, stream-level pause/resume.
// Press ESC or close window to stop.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    var sdl = try zsdl3.SDL.load();
    defer sdl.unload();

    std.log.info("=== Audio Drivers ===", .{});
    const num_drivers = sdl.audio.getNumAudioDrivers();
    std.log.info("Audio drivers: {d}", .{num_drivers});
    var i: c_int = 0;
    while (i < num_drivers) : (i += 1) {
        if (sdl.audio.getAudioDriver(i)) |name| {
            std.log.info("  {d}: {s}", .{ i, name });
        }
    }
    if (sdl.audio.getCurrentAudioDriver()) |cur| {
        std.log.info("Current audio driver: {s}", .{cur});
    }

    var dev_count: c_int = 0;
    const devices = sdl.audio.getAudioPlaybackDevices(&dev_count);
    std.log.info("Playback devices: {d}", .{dev_count});
    if (devices) |devs| {
        for (0..@as(usize, @intCast(dev_count))) |j| {
            if (sdl.audio.getAudioDeviceName(devs[j])) |name| {
                std.log.info("  {d}: {s}", .{ j, name });
            }
        }
    }

    const spec = zsdl3.SDL_AudioSpec{
        .format = zsdl3.SDL_AUDIO_F32LE,
        .channels = 1,
        .freq = 48000,
    };

    const device = sdl.audio.openAudioDevice(zsdl3.SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, &spec);
    if (device == 0) {
        const err = sdl.core.getError() orelse "Unknown error";
        std.log.err("Failed to open audio device: {s}", .{err});
        return;
    }
    defer sdl.audio.closeAudioDevice(device);

    var got_spec: zsdl3.SDL_AudioSpec = undefined;
    var sample_frames: c_int = 0;
    _ = sdl.audio.getAudioDeviceFormat(device, &got_spec, &sample_frames);
    std.log.info("Opened device: {}Hz {}ch format={}", .{ got_spec.freq, got_spec.channels, got_spec.format });

    // Gain control
    const default_gain = sdl.audio.getAudioDeviceGain(device);
    std.log.info("Default device gain: {d:.2}", .{default_gain});
    _ = sdl.audio.setAudioDeviceGain(device, 0.5);
    std.log.info("Set device gain to: {d:.2}", .{sdl.audio.getAudioDeviceGain(device)});

    const stream = sdl.audio.createAudioStream(&spec, &spec) orelse return;
    defer sdl.audio.destroyAudioStream(stream);

    _ = sdl.audio.bindAudioStream(device, stream);

    // Frequency ratio (pitch/speed shift)
    _ = sdl.audio.setAudioStreamFrequencyRatio(stream, 1.0);
    std.log.info("Audio stream frequency ratio: {d:.2}", .{sdl.audio.getAudioStreamFrequencyRatio(stream)});

    // Generate a 440Hz sine wave
    const freq: f32 = 440.0;
    const sample_rate: f32 = 48000.0;
    const duration_sec: f32 = 1.0;
    const num_samples: usize = @intFromFloat(sample_rate * duration_sec);
    var samples: []f32 = undefined;

    const allocator = std.heap.page_allocator;
    const buf = allocator.alloc(u8, num_samples * @sizeOf(f32)) catch return;
    defer allocator.free(buf);
    samples = @as([]f32, @ptrCast(@alignCast(buf)));

    for (0..num_samples) |n| {
        samples[n] = @sin(2.0 * std.math.pi * freq * @as(f32, @floatFromInt(n)) / sample_rate) * 0.5;
    }

    const buf_len: c_int = @intCast(buf.len);
    _ = sdl.audio.putAudioStreamData(stream, buf.ptr, buf_len);
    _ = sdl.audio.flushAudioStream(stream);

    std.log.info("Playing 440Hz sine wave for 3 seconds...", .{});

    // Device-level pause/resume
    _ = sdl.audio.pauseAudioDevice(device);
    sdl.time.delay(500);
    _ = sdl.audio.resumeAudioDevice(device);

    var running = true;
    var frame: u32 = 0;
    while (running and frame < 60 * 3) : (frame += 1) {
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
        sdl.time.delay(16);
    }

    // Stream-level pause/resume (distinct from device-level)
    _ = sdl.audio.pauseAudioStreamDevice(stream);
    std.log.info("Stream device paused: {}", .{sdl.audio.audioStreamDevicePaused(stream)});
    _ = sdl.audio.resumeAudioStreamDevice(stream);
    std.log.info("Stream device resumed: {}", .{sdl.audio.audioStreamDevicePaused(stream)});

    _ = sdl.audio.unbindAudioStream(stream);
    std.log.info("Audio test complete!", .{});
}
