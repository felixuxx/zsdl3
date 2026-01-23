// SDL3 Audio Bindings
// Playback, recording, mixing

const core = @import("core.zig");
const pixels = @import("pixels.zig");

// Import types
pub const SDL_PixelFormat = pixels.SDL_PixelFormat;

// Audio structs
pub const SDL_AudioDeviceID = core.Uint32;
pub const SDL_AudioSpec = extern struct {
    format: SDL_PixelFormat,
    channels: c_int,
    freq: c_int,
};

// Audio functions
extern fn SDL_OpenAudioDevice(device: ?[*:0]const u8, recording: bool, spec: ?*const SDL_AudioSpec, obtained: ?*SDL_AudioSpec, allowed_changes: c_int) SDL_AudioDeviceID;
extern fn SDL_CloseAudioDevice(dev: SDL_AudioDeviceID) void;
extern fn SDL_PauseAudioDevice(dev: SDL_AudioDeviceID, pause_on: bool) bool;
extern fn SDL_GetAudioDeviceName(devid: SDL_AudioDeviceID) ?[*:0]const u8;
extern fn SDL_GetNumAudioDrivers() c_int;
extern fn SDL_GetAudioDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetCurrentAudioDriver() ?[*:0]const u8;

// Public API
pub const openAudioDevice = SDL_OpenAudioDevice;
pub const closeAudioDevice = SDL_CloseAudioDevice;
pub const pauseAudioDevice = SDL_PauseAudioDevice;
pub const getAudioDeviceName = SDL_GetAudioDeviceName;
pub const getNumAudioDrivers = SDL_GetNumAudioDrivers;
pub const getAudioDriver = SDL_GetAudioDriver;
pub const getCurrentAudioDriver = SDL_GetCurrentAudioDriver;
