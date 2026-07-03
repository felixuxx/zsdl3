// Simple Mixer Example
// Plays a 440Hz sine wave with Space to toggle pause, ESC to quit.

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() void {
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO | zsdl3.SDL_INIT_AUDIO)) return;
    defer zsdl3.quit();

    if (!zsdl3.mixer.init()) return;
    defer zsdl3.mixer.quit();

    const window = zsdl3.createWindow("Mixer Example", 400, 200, zsdl3.SDL_WINDOW_RESIZABLE) orelse return;
    defer zsdl3.destroyWindow(window);

    const renderer = zsdl3.createRenderer(window, null) orelse return;
    defer zsdl3.destroyRenderer(renderer);

    const mixer = zsdl3.mixer.createMixerDevice(zsdl3.SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, null) orelse return;
    defer zsdl3.mixer.destroyMixer(mixer);

    const audio = zsdl3.mixer.createSineWaveAudio(mixer, 440, 0.5, 3000) orelse return;
    defer zsdl3.mixer.destroyAudio(audio);

    const track = zsdl3.mixer.createTrack(mixer) orelse return;
    defer zsdl3.mixer.destroyTrack(track);
    _ = zsdl3.mixer.setTrackAudio(track, audio);

    const props = zsdl3.createProperties();
    _ = zsdl3.setNumberProperty(props, zsdl3.mixer.MIX_PROP_PLAY_LOOPS_NUMBER, -1);
    _ = zsdl3.mixer.playTrack(track, props);
    zsdl3.destroyProperties(props);

    std.log.info("Playing 440Hz sine wave. ESC to quit, Space to toggle pause.", .{});

    var running = true;
    while (running) {
        var event: zsdl3.SDL_Event = undefined;
        while (zsdl3.pollEvent(&event)) {
            switch (event.type) {
                zsdl3.SDL_EVENT_QUIT => running = false,
                zsdl3.SDL_EVENT_KEY_DOWN => {
                    if (event.key.scancode == zsdl3.SDL_SCANCODE_ESCAPE) running = false;
                    if (event.key.scancode == zsdl3.SDL_SCANCODE_SPACE) {
                        if (zsdl3.mixer.trackPaused(track))
                            _ = zsdl3.mixer.resumeTrack(track)
                        else
                            _ = zsdl3.mixer.pauseTrack(track);
                    }
                },
                else => {},
            }
        }
        // Clear window to dark background
        _ = zsdl3.setRenderDrawColor(renderer, 20, 30, 50, 255);
        _ = zsdl3.renderClear(renderer);
        _ = zsdl3.renderPresent(renderer);

        zsdl3.delay(16);
    }
}
