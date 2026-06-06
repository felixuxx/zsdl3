// SDL3 Audio Bindings
// Playback, recording, mixing

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");
pub const SDL_AudioDeviceID = core.Uint32;

// Audio format (matches SDL_AudioFormat in SDL3)
pub const SDL_AudioFormat = c_uint;

// Audio device constants
pub const SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK: SDL_AudioDeviceID = 0xFFFFFFFF;
pub const SDL_AUDIO_DEVICE_DEFAULT_RECORDING: SDL_AudioDeviceID = 0xFFFFFFFE;

pub const SDL_AUDIO_UNKNOWN: SDL_AudioFormat = 0x0000;
pub const SDL_AUDIO_U8: SDL_AudioFormat = 0x0008;
pub const SDL_AUDIO_S8: SDL_AudioFormat = 0x8008;
pub const SDL_AUDIO_S16LE: SDL_AudioFormat = 0x8010;
pub const SDL_AUDIO_S16BE: SDL_AudioFormat = 0x9010;
pub const SDL_AUDIO_S32LE: SDL_AudioFormat = 0x8020;
pub const SDL_AUDIO_S32BE: SDL_AudioFormat = 0x9020;
pub const SDL_AUDIO_F32LE: SDL_AudioFormat = 0x8120;
pub const SDL_AUDIO_F32BE: SDL_AudioFormat = 0x9120;

// Audio structs
pub const SDL_AudioSpec = extern struct {
    format: SDL_AudioFormat,
    channels: c_int,
    freq: c_int,
};

pub const SDL_AudioStream = opaque {};

// Audio functions
pub const PFN_SDL_OpenAudioDevice = *const fn (devid: SDL_AudioDeviceID, spec: ?*const SDL_AudioSpec) callconv(.c) SDL_AudioDeviceID;
pub const PFN_SDL_CloseAudioDevice = *const fn (dev: SDL_AudioDeviceID) callconv(.c) void;
pub const PFN_SDL_PauseAudioDevice = *const fn (dev: SDL_AudioDeviceID) callconv(.c) bool;
pub const PFN_SDL_GetAudioDeviceName = *const fn (devid: SDL_AudioDeviceID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetNumAudioDrivers = *const fn () callconv(.c) c_int;
pub const PFN_SDL_GetAudioDriver = *const fn (index: c_int) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetCurrentAudioDriver = *const fn () callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetAudioPlaybackDevices = *const fn (count: ?*c_int) callconv(.c) ?[*]SDL_AudioDeviceID;
pub const PFN_SDL_GetAudioRecordingDevices = *const fn (count: ?*c_int) callconv(.c) ?[*]SDL_AudioDeviceID;
pub const PFN_SDL_GetAudioDeviceFormat = *const fn (devid: SDL_AudioDeviceID, spec: ?*SDL_AudioSpec, sample_frames: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_GetAudioDeviceChannelMap = *const fn (devid: SDL_AudioDeviceID, count: ?*c_int) callconv(.c) ?[*]c_int;
pub const PFN_SDL_IsAudioDevicePhysical = *const fn (devid: SDL_AudioDeviceID) callconv(.c) bool;
pub const PFN_SDL_IsAudioDevicePlayback = *const fn (devid: SDL_AudioDeviceID) callconv(.c) bool;
pub const PFN_SDL_ResumeAudioDevice = *const fn (dev: SDL_AudioDeviceID) callconv(.c) bool;
pub const PFN_SDL_AudioDevicePaused = *const fn (dev: SDL_AudioDeviceID) callconv(.c) bool;
pub const PFN_SDL_ClearAudioStream = *const fn (stream: ?*SDL_AudioStream) callconv(.c) bool;
pub const PFN_SDL_CreateAudioStream = *const fn (src_spec: ?*const SDL_AudioSpec, dst_spec: ?*const SDL_AudioSpec) callconv(.c) ?*SDL_AudioStream;
pub const PFN_SDL_DestroyAudioStream = *const fn (stream: ?*SDL_AudioStream) callconv(.c) void;
pub const PFN_SDL_GetAudioStreamData = *const fn (stream: ?*SDL_AudioStream, buf: ?*anyopaque, len: c_int) callconv(.c) c_int;
pub const PFN_SDL_GetAudioStreamDevice = *const fn (stream: ?*SDL_AudioStream) callconv(.c) SDL_AudioDeviceID;
pub const PFN_SDL_GetAudioStreamFormat = *const fn (stream: ?*SDL_AudioStream, src_spec: ?*SDL_AudioSpec, dst_spec: ?*SDL_AudioSpec) callconv(.c) bool;
pub const PFN_SDL_GetAudioStreamProperties = *const fn (stream: ?*SDL_AudioStream) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_GetAudioStreamQueued = *const fn (stream: ?*SDL_AudioStream) callconv(.c) c_int;
pub const PFN_SDL_LockAudioStream = *const fn (stream: ?*SDL_AudioStream) callconv(.c) bool;
pub const PFN_SDL_OpenAudioDeviceStream = *const fn (device: SDL_AudioDeviceID, spec: ?*const SDL_AudioSpec, callback: ?*const fn (?*anyopaque, ?*SDL_AudioStream, c_int, c_int) callconv(.c) void, userdata: ?*anyopaque) callconv(.c) ?*SDL_AudioStream;
pub const PFN_SDL_PutAudioStreamData = *const fn (stream: ?*SDL_AudioStream, buf: ?*const anyopaque, len: c_int) callconv(.c) bool;
pub const PFN_SDL_SetAudioStreamFormat = *const fn (stream: ?*SDL_AudioStream, src_spec: ?*const SDL_AudioSpec, dst_spec: ?*const SDL_AudioSpec) callconv(.c) bool;
pub const PFN_SDL_SetAudioStreamGetCallback = *const fn (stream: ?*SDL_AudioStream, callback: ?*const fn (?*anyopaque, ?*SDL_AudioStream, c_int, c_int) callconv(.c) void, userdata: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_SetAudioStreamPutCallback = *const fn (stream: ?*SDL_AudioStream, callback: ?*const fn (?*anyopaque, ?*SDL_AudioStream, c_int, c_int) callconv(.c) void, userdata: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_UnlockAudioStream = *const fn (stream: ?*SDL_AudioStream) callconv(.c) bool;
pub const PFN_SDL_FlushAudioStream = *const fn (stream: ?*SDL_AudioStream) callconv(.c) bool;
pub const PFN_SDL_BindAudioStream = *const fn (device: SDL_AudioDeviceID, stream: ?*SDL_AudioStream) callconv(.c) bool;
pub const PFN_SDL_BindAudioStreams = *const fn (device: SDL_AudioDeviceID, streams: ?[*]?*SDL_AudioStream, num_streams: c_int) callconv(.c) bool;
pub const PFN_SDL_UnbindAudioStream = *const fn (stream: ?*SDL_AudioStream) callconv(.c) void;
pub const PFN_SDL_UnbindAudioStreams = *const fn (streams: ?[*]?*SDL_AudioStream, num_streams: c_int) callconv(.c) void;
pub const PFN_SDL_ConvertAudioSamples = *const fn (src_spec: ?*const SDL_AudioSpec, src_data: ?*const core.Uint8, src_len: c_int, dst_spec: ?*const SDL_AudioSpec, dst_data: ?*?*core.Uint8, dst_len: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_GetAudioFormatName = *const fn (format: SDL_AudioFormat) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetSilenceValueForFormat = *const fn (format: SDL_AudioFormat) callconv(.c) c_int;
pub const PFN_SDL_MixAudio = *const fn (dst: ?[*]u8, src: ?[*]const u8, format: SDL_AudioFormat, len: core.Uint32, volume: f32) callconv(.c) bool;

// Additional SDL3 audio APIs
pub const PFN_SDL_GetAudioStreamGain = *const fn (stream: ?*SDL_AudioStream) callconv(.c) f32;
pub const PFN_SDL_SetAudioStreamGain = *const fn (stream: ?*SDL_AudioStream, gain: f32) callconv(.c) bool;

pub const SDL_IOStream = opaque {};
pub const PFN_SDL_LoadWAV_IO = *const fn (src: ?*SDL_IOStream, closeio: bool, spec: ?*SDL_AudioSpec, audio_buf: ?*?*u8, audio_len: ?*core.Uint32) callconv(.c) bool;
pub const PFN_SDL_LoadWAV = *const fn (path: [*:0]const u8, spec: ?*SDL_AudioSpec, audio_buf: ?*?*u8, audio_len: ?*core.Uint32) callconv(.c) bool;

// Additional audio functions
pub const PFN_SDL_GetAudioDeviceGain = *const fn (devid: SDL_AudioDeviceID) callconv(.c) f32;
pub const PFN_SDL_SetAudioDeviceGain = *const fn (devid: SDL_AudioDeviceID, gain: f32) callconv(.c) bool;
pub const PFN_SDL_GetAudioStreamFrequencyRatio = *const fn (stream: ?*SDL_AudioStream) callconv(.c) f32;
pub const PFN_SDL_SetAudioStreamFrequencyRatio = *const fn (stream: ?*SDL_AudioStream, ratio: f32) callconv(.c) bool;
pub const PFN_SDL_GetAudioStreamInputChannelMap = *const fn (stream: ?*SDL_AudioStream, count: ?*c_int) callconv(.c) ?[*]c_int;
pub const PFN_SDL_GetAudioStreamOutputChannelMap = *const fn (stream: ?*SDL_AudioStream, count: ?*c_int) callconv(.c) ?[*]c_int;
pub const PFN_SDL_SetAudioStreamInputChannelMap = *const fn (stream: ?*SDL_AudioStream, chmap: ?[*]const c_int, count: c_int) callconv(.c) bool;
pub const PFN_SDL_SetAudioStreamOutputChannelMap = *const fn (stream: ?*SDL_AudioStream, chmap: ?[*]const c_int, count: c_int) callconv(.c) bool;
pub const PFN_SDL_GetAudioStreamAvailable = *const fn (stream: ?*SDL_AudioStream) callconv(.c) c_int;
pub const PFN_SDL_PauseAudioStreamDevice = *const fn (stream: ?*SDL_AudioStream) callconv(.c) bool;
pub const PFN_SDL_ResumeAudioStreamDevice = *const fn (stream: ?*SDL_AudioStream) callconv(.c) bool;
pub const PFN_SDL_AudioStreamDevicePaused = *const fn (stream: ?*SDL_AudioStream) callconv(.c) bool;

pub const AudioFunctions = struct {
    openAudioDevice: PFN_SDL_OpenAudioDevice,
    closeAudioDevice: PFN_SDL_CloseAudioDevice,
    pauseAudioDevice: PFN_SDL_PauseAudioDevice,
    getAudioDeviceName: PFN_SDL_GetAudioDeviceName,
    getNumAudioDrivers: PFN_SDL_GetNumAudioDrivers,
    getAudioDriver: PFN_SDL_GetAudioDriver,
    getCurrentAudioDriver: PFN_SDL_GetCurrentAudioDriver,
    getAudioPlaybackDevices: PFN_SDL_GetAudioPlaybackDevices,
    getAudioRecordingDevices: PFN_SDL_GetAudioRecordingDevices,
    getAudioDeviceFormat: PFN_SDL_GetAudioDeviceFormat,
    getAudioDeviceChannelMap: PFN_SDL_GetAudioDeviceChannelMap,
    isAudioDevicePhysical: PFN_SDL_IsAudioDevicePhysical,
    isAudioDevicePlayback: PFN_SDL_IsAudioDevicePlayback,
    resumeAudioDevice: PFN_SDL_ResumeAudioDevice,
    audioDevicePaused: PFN_SDL_AudioDevicePaused,
    clearAudioStream: PFN_SDL_ClearAudioStream,
    createAudioStream: PFN_SDL_CreateAudioStream,
    destroyAudioStream: PFN_SDL_DestroyAudioStream,
    getAudioStreamData: PFN_SDL_GetAudioStreamData,
    getAudioStreamDevice: PFN_SDL_GetAudioStreamDevice,
    getAudioStreamFormat: PFN_SDL_GetAudioStreamFormat,
    getAudioStreamProperties: PFN_SDL_GetAudioStreamProperties,
    getAudioStreamQueued: PFN_SDL_GetAudioStreamQueued,
    lockAudioStream: PFN_SDL_LockAudioStream,
    openAudioDeviceStream: PFN_SDL_OpenAudioDeviceStream,
    putAudioStreamData: PFN_SDL_PutAudioStreamData,
    setAudioStreamFormat: PFN_SDL_SetAudioStreamFormat,
    setAudioStreamGetCallback: PFN_SDL_SetAudioStreamGetCallback,
    setAudioStreamPutCallback: PFN_SDL_SetAudioStreamPutCallback,
    unlockAudioStream: PFN_SDL_UnlockAudioStream,
    flushAudioStream: PFN_SDL_FlushAudioStream,
    bindAudioStream: PFN_SDL_BindAudioStream,
    bindAudioStreams: PFN_SDL_BindAudioStreams,
    unbindAudioStream: PFN_SDL_UnbindAudioStream,
    unbindAudioStreams: PFN_SDL_UnbindAudioStreams,
    convertAudioSamples: PFN_SDL_ConvertAudioSamples,
    getAudioFormatName: PFN_SDL_GetAudioFormatName,
    getSilenceValueForFormat: PFN_SDL_GetSilenceValueForFormat,
    mixAudio: PFN_SDL_MixAudio,
    getAudioStreamGain: PFN_SDL_GetAudioStreamGain,
    setAudioStreamGain: PFN_SDL_SetAudioStreamGain,
    loadWAV_IO: PFN_SDL_LoadWAV_IO,
    loadWAV: PFN_SDL_LoadWAV,
    getAudioDeviceGain: PFN_SDL_GetAudioDeviceGain,
    setAudioDeviceGain: PFN_SDL_SetAudioDeviceGain,
    getAudioStreamFrequencyRatio: PFN_SDL_GetAudioStreamFrequencyRatio,
    setAudioStreamFrequencyRatio: PFN_SDL_SetAudioStreamFrequencyRatio,
    getAudioStreamInputChannelMap: PFN_SDL_GetAudioStreamInputChannelMap,
    getAudioStreamOutputChannelMap: PFN_SDL_GetAudioStreamOutputChannelMap,
    setAudioStreamInputChannelMap: PFN_SDL_SetAudioStreamInputChannelMap,
    setAudioStreamOutputChannelMap: PFN_SDL_SetAudioStreamOutputChannelMap,
    getAudioStreamAvailable: PFN_SDL_GetAudioStreamAvailable,
    pauseAudioStreamDevice: PFN_SDL_PauseAudioStreamDevice,
    resumeAudioStreamDevice: PFN_SDL_ResumeAudioStreamDevice,
    audioStreamDevicePaused: PFN_SDL_AudioStreamDevicePaused,

    pub fn load(handle: dynamic.LibraryHandle) !AudioFunctions {
        return dynamic.loadFunctions(AudioFunctions, handle, "SDL_", .{}, &.{});
    }
};
