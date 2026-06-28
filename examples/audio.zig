// Audio Playback Example
// Generates a sine wave and plays it through the default audio device.
// Demonstrates: audio device enumeration, stream creation, data queue,
// gain control, frequency ratio, stream-level pause/resume.
// Press ESC or close window to stop.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() void {
    if (!zsdl3.init(zsdl3.SDL_INIT_AUDIO)) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to initialize SDL: {s}", .{err});
        return;
    }
    defer zsdl3.quit();

    std.log.info("=== Audio Drivers ===", .{});
    const num_drivers = zsdl3.getNumAudioDrivers();
    std.log.info("Audio drivers: {d}", .{num_drivers});
    var i: c_int = 0;
    while (i < num_drivers) : (i += 1) {
        if (zsdl3.getAudioDriver(i)) |name| {
            std.log.info("  {d}: {s}", .{ i, name });
        }
    }
    if (zsdl3.getCurrentAudioDriver()) |cur| {
        std.log.info("Current audio driver: {s}", .{cur});
    }

    var dev_count: c_int = 0;
    const devices = zsdl3.getAudioPlaybackDevices(&dev_count);
    std.log.info("Playback devices: {d}", .{dev_count});
    if (devices) |devs| {
        for (0..@as(usize, @intCast(dev_count))) |j| {
            if (zsdl3.getAudioDeviceName(devs[j])) |name| {
                std.log.info("  {d}: {s}", .{ j, name });
            }
        }
    }

    const spec = zsdl3.SDL_AudioSpec{
        .format = zsdl3.SDL_AUDIO_F32LE,
        .channels = 1,
        .freq = 48000,
    };

    const device = zsdl3.openAudioDevice(zsdl3.SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, &spec);
    if (device == 0) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.log.err("Failed to open audio device: {s}", .{err});
        return;
    }
    defer zsdl3.closeAudioDevice(device);

    var got_spec: zsdl3.SDL_AudioSpec = undefined;
    var sample_frames: c_int = 0;
    _ = zsdl3.getAudioDeviceFormat(device, &got_spec, &sample_frames);
    std.log.info("Opened device: {}Hz {}ch format={}", .{ got_spec.freq, got_spec.channels, got_spec.format });

    // Gain control
    const default_gain = zsdl3.getAudioDeviceGain(device);
    std.log.info("Default device gain: {d:.2}", .{default_gain});
    _ = zsdl3.setAudioDeviceGain(device, 0.5);
    std.log.info("Set device gain to: {d:.2}", .{zsdl3.getAudioDeviceGain(device)});

    const stream = zsdl3.createAudioStream(&spec, &spec) orelse return;
    defer zsdl3.destroyAudioStream(stream);

    _ = zsdl3.bindAudioStream(device, stream);

    // Frequency ratio (pitch/speed shift)
    _ = zsdl3.setAudioStreamFrequencyRatio(stream, 1.0);
    std.log.info("Audio stream frequency ratio: {d:.2}", .{zsdl3.getAudioStreamFrequencyRatio(stream)});

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
    _ = zsdl3.putAudioStreamData(stream, @ptrCast(buf.ptr), buf_len);
    _ = zsdl3.flushAudioStream(stream);

    std.log.info("Playing 440Hz sine wave for 3 seconds...", .{});

    // Device-level pause/resume
    _ = zsdl3.pauseAudioDevice(device);
    zsdl3.delay(500);
    _ = zsdl3.resumeAudioDevice(device);

    var running = true;
    var frame: u32 = 0;
    while (running and frame < 60 * 3) : (frame += 1) {
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
        zsdl3.delay(16);
    }

    // Stream-level pause/resume (distinct from device-level)
    _ = zsdl3.pauseAudioStreamDevice(stream);
    std.log.info("Stream device paused: {}", .{zsdl3.audioStreamDevicePaused(stream)});
    _ = zsdl3.resumeAudioStreamDevice(stream);
    std.log.info("Stream device resumed: {}", .{zsdl3.audioStreamDevicePaused(stream)});

    _ = zsdl3.unbindAudioStream(stream);
    std.log.info("Audio test complete!", .{});
}
