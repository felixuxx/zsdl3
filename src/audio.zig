// SDL3 Audio Bindings
// Playback, recording, mixing

const core = @import("core.zig");
pub const SDL_AudioDeviceID = core.Uint32;
const pixels = @import("pixels.zig");

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
extern fn SDL_OpenAudioDevice(devid: SDL_AudioDeviceID, spec: ?*const SDL_AudioSpec) SDL_AudioDeviceID;
extern fn SDL_CloseAudioDevice(dev: SDL_AudioDeviceID) void;
extern fn SDL_PauseAudioDevice(dev: SDL_AudioDeviceID, pause_on: bool) bool;
extern fn SDL_GetAudioDeviceName(devid: SDL_AudioDeviceID) ?[*:0]const u8;
extern fn SDL_GetNumAudioDrivers() c_int;
extern fn SDL_GetAudioDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetCurrentAudioDriver() ?[*:0]const u8;
extern fn SDL_GetAudioPlaybackDevices(count: ?*c_int) ?[*]SDL_AudioDeviceID;
extern fn SDL_GetAudioRecordingDevices(count: ?*c_int) ?[*]SDL_AudioDeviceID;
extern fn SDL_GetAudioDeviceFormat(devid: SDL_AudioDeviceID, spec: ?*SDL_AudioSpec, sample_frames: ?*c_int) bool;
extern fn SDL_GetAudioDeviceChannelMap(devid: SDL_AudioDeviceID, count: ?*c_int) ?[*]c_int;
extern fn SDL_IsAudioDevicePhysical(devid: SDL_AudioDeviceID) bool;
extern fn SDL_IsAudioDevicePlayback(devid: SDL_AudioDeviceID) bool;
extern fn SDL_ResumeAudioDevice(dev: SDL_AudioDeviceID) bool;
extern fn SDL_AudioDevicePaused(dev: SDL_AudioDeviceID) bool;
extern fn SDL_ClearAudioStream(stream: ?*SDL_AudioStream) bool;
extern fn SDL_CreateAudioStream(src_spec: ?*const SDL_AudioSpec, dst_spec: ?*const SDL_AudioSpec) ?*SDL_AudioStream;
extern fn SDL_DestroyAudioStream(stream: ?*SDL_AudioStream) void;
extern fn SDL_GetAudioStreamData(stream: ?*SDL_AudioStream, buf: ?*anyopaque, len: c_int) c_int;
extern fn SDL_GetAudioStreamDevice(stream: ?*SDL_AudioStream) SDL_AudioDeviceID;
extern fn SDL_GetAudioStreamFormat(stream: ?*SDL_AudioStream, src_spec: ?*SDL_AudioSpec, dst_spec: ?*SDL_AudioSpec) bool;
extern fn SDL_GetAudioStreamProperties(stream: ?*SDL_AudioStream) core.SDL_PropertiesID;
extern fn SDL_GetAudioStreamQueued(stream: ?*SDL_AudioStream) c_int;
extern fn SDL_LockAudioStream(stream: ?*SDL_AudioStream) bool;
extern fn SDL_OpenAudioDeviceStream(device: SDL_AudioDeviceID, spec: ?*const SDL_AudioSpec, callback: ?*const fn (?*anyopaque, ?*SDL_AudioStream, c_int, c_int) callconv(.C) void, userdata: ?*anyopaque) ?*SDL_AudioStream;
extern fn SDL_PutAudioStreamData(stream: ?*SDL_AudioStream, buf: ?*const anyopaque, len: c_int) bool;
extern fn SDL_SetAudioStreamFormat(stream: ?*SDL_AudioStream, src_spec: ?*const SDL_AudioSpec, dst_spec: ?*const SDL_AudioSpec) bool;
extern fn SDL_SetAudioStreamGetCallback(stream: ?*SDL_AudioStream, callback: ?*const fn (?*anyopaque, ?*SDL_AudioStream, c_int, c_int) callconv(.C) void, userdata: ?*anyopaque) bool;
extern fn SDL_SetAudioStreamPutCallback(stream: ?*SDL_AudioStream, callback: ?*const fn (?*anyopaque, ?*SDL_AudioStream, c_int, c_int) callconv(.C) void, userdata: ?*anyopaque) bool;
extern fn SDL_UnlockAudioStream(stream: ?*SDL_AudioStream) void;
extern fn SDL_FlushAudioStream(stream: ?*SDL_AudioStream) bool;
extern fn SDL_BindAudioStream(device: SDL_AudioDeviceID, stream: ?*SDL_AudioStream) bool;
extern fn SDL_BindAudioStreams(device: SDL_AudioDeviceID, streams: ?[*]?*SDL_AudioStream, num_streams: c_int) bool;
extern fn SDL_UnbindAudioStream(stream: ?*SDL_AudioStream) void;
extern fn SDL_UnbindAudioStreams(streams: ?[*]?*SDL_AudioStream, num_streams: c_int) void;
extern fn SDL_ConvertAudioSamples(src_format: SDL_AudioFormat, src_channels: c_int, src_rate: c_int, src_data: ?*const anyopaque, src_len: c_int, dst_format: SDL_AudioFormat, dst_channels: c_int, dst_rate: c_int, dst_data: ?*anyopaque, dst_len: c_int) bool;
extern fn SDL_GetAudioFormatName(format: SDL_AudioFormat) ?[*:0]const u8;
extern fn SDL_GetSilenceValueForFormat(format: SDL_AudioFormat) c_int;
extern fn SDL_MixAudio(dst: ?[*]u8, src: ?[*]const u8, format: SDL_AudioFormat, len: core.Uint32, volume: f32) bool;
extern fn SDL_QueueAudio(dev: SDL_AudioDeviceID, data: ?*const anyopaque, len: core.Uint32) bool;
extern fn SDL_DequeueAudio(dev: SDL_AudioDeviceID, data: ?*anyopaque, len: core.Uint32) core.Uint32;
extern fn SDL_GetQueuedAudioSize(dev: SDL_AudioDeviceID) core.Uint32;
extern fn SDL_ClearQueuedAudio(dev: SDL_AudioDeviceID) void;

// Additional SDL3 audio APIs
extern fn SDL_GetAudioStreamGain(stream: ?*SDL_AudioStream) f32;
extern fn SDL_SetAudioStreamGain(stream: ?*SDL_AudioStream, gain: f32) bool;

pub const SDL_IOStream = opaque {};
extern fn SDL_LoadWAV_IO(src: ?*SDL_IOStream, closeio: bool, spec: ?*SDL_AudioSpec, audio_buf: ?*?*u8, audio_len: ?*core.Uint32) bool;
extern fn SDL_LoadWAV(path: ?[*:0]const u8, spec: ?*SDL_AudioSpec, audio_buf: ?*?*u8, audio_len: ?*core.Uint32) bool;

// Public API
pub const openAudioDevice = SDL_OpenAudioDevice;
pub const closeAudioDevice = SDL_CloseAudioDevice;
pub const pauseAudioDevice = SDL_PauseAudioDevice;
pub const getAudioDeviceName = SDL_GetAudioDeviceName;
pub const getNumAudioDrivers = SDL_GetNumAudioDrivers;
pub const getAudioDriver = SDL_GetAudioDriver;
pub const getCurrentAudioDriver = SDL_GetCurrentAudioDriver;
pub const getAudioPlaybackDevices = SDL_GetAudioPlaybackDevices;
pub const getAudioRecordingDevices = SDL_GetAudioRecordingDevices;
pub const getAudioDeviceFormat = SDL_GetAudioDeviceFormat;
pub const getAudioDeviceChannelMap = SDL_GetAudioDeviceChannelMap;
pub const isAudioDevicePhysical = SDL_IsAudioDevicePhysical;
pub const isAudioDevicePlayback = SDL_IsAudioDevicePlayback;
pub const resumeAudioDevice = SDL_ResumeAudioDevice;
pub const audioDevicePaused = SDL_AudioDevicePaused;
pub const clearAudioStream = SDL_ClearAudioStream;
pub const createAudioStream = SDL_CreateAudioStream;
pub const destroyAudioStream = SDL_DestroyAudioStream;
pub const getAudioStreamData = SDL_GetAudioStreamData;
pub const getAudioStreamDevice = SDL_GetAudioStreamDevice;
pub const getAudioStreamFormat = SDL_GetAudioStreamFormat;
pub const getAudioStreamProperties = SDL_GetAudioStreamProperties;
pub const getAudioStreamQueued = SDL_GetAudioStreamQueued;
pub const lockAudioStream = SDL_LockAudioStream;
pub const openAudioDeviceStream = SDL_OpenAudioDeviceStream;
pub const putAudioStreamData = SDL_PutAudioStreamData;
pub const setAudioStreamFormat = SDL_SetAudioStreamFormat;
pub const setAudioStreamGetCallback = SDL_SetAudioStreamGetCallback;
pub const setAudioStreamPutCallback = SDL_SetAudioStreamPutCallback;
pub const unlockAudioStream = SDL_UnlockAudioStream;
pub const flushAudioStream = SDL_FlushAudioStream;
pub const bindAudioStream = SDL_BindAudioStream;
pub const bindAudioStreams = SDL_BindAudioStreams;
pub const unbindAudioStream = SDL_UnbindAudioStream;
pub const unbindAudioStreams = SDL_UnbindAudioStreams;
pub const convertAudioSamples = SDL_ConvertAudioSamples;
pub const getAudioFormatName = SDL_GetAudioFormatName;
pub const getSilenceValueForFormat = SDL_GetSilenceValueForFormat;
pub const mixAudio = SDL_MixAudio;
pub const queueAudio = SDL_QueueAudio;
pub const dequeueAudio = SDL_DequeueAudio;
pub const getQueuedAudioSize = SDL_GetQueuedAudioSize;
pub const clearQueuedAudio = SDL_ClearQueuedAudio;
pub const getAudioStreamGain = SDL_GetAudioStreamGain;
pub const setAudioStreamGain = SDL_SetAudioStreamGain;
pub const loadWAV_IO = SDL_LoadWAV_IO;
pub const loadWAV = SDL_LoadWAV;
