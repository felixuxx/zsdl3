// SDL3_mixer Bindings
// Audio mixing library

const core = @import("core.zig");
const audio = @import("audio.zig");
const surface = @import("surface.zig");

pub const Sint64 = core.Sint64;
pub const Uint32 = core.Uint32;
pub const Uint64 = core.Uint64;
pub const SDL_PropertiesID = core.SDL_PropertiesID;
pub const SDL_AudioSpec = audio.SDL_AudioSpec;
pub const SDL_AudioDeviceID = audio.SDL_AudioDeviceID;
pub const SDL_IOStream = surface.SDL_IOStream;

// Version constants
pub const SDL_MIXER_MAJOR_VERSION = 3;
pub const SDL_MIXER_MINOR_VERSION = 3;
pub const SDL_MIXER_MICRO_VERSION = 0;

// Opaque types
pub const MIX_Mixer = opaque {};
pub const MIX_Audio = opaque {};
pub const MIX_Track = opaque {};
pub const MIX_Group = opaque {};
pub const MIX_AudioDecoder = opaque {};

// Structs
pub const MIX_StereoGains = extern struct {
    left: f32,
    right: f32,
};

pub const MIX_Point3D = extern struct {
    x: f32,
    y: f32,
    z: f32,
};

// Callback types
pub const MIX_TrackStoppedCallback = ?*const fn (?*anyopaque, ?*MIX_Track) callconv(.c) void;
pub const MIX_TrackMixCallback = ?*const fn (?*anyopaque, ?*MIX_Track, ?*const SDL_AudioSpec, [*]f32, c_int) callconv(.c) void;
pub const MIX_GroupMixCallback = ?*const fn (?*anyopaque, ?*MIX_Group, ?*const SDL_AudioSpec, [*]f32, c_int) callconv(.c) void;
pub const MIX_PostMixCallback = ?*const fn (?*anyopaque, ?*MIX_Mixer, ?*const SDL_AudioSpec, [*]f32, c_int) callconv(.c) void;

// Duration constants
pub const MIX_DURATION_UNKNOWN: Sint64 = -1;
pub const MIX_DURATION_INFINITE: Sint64 = -2;

// Property string constants
pub const MIX_PROP_MIXER_DEVICE_NUMBER = "SDL_mixer.mixer.device";
pub const MIX_PROP_AUDIO_LOAD_IOSTREAM_POINTER = "SDL_mixer.audio.load.iostream";
pub const MIX_PROP_AUDIO_LOAD_CLOSEIO_BOOLEAN = "SDL_mixer.audio.load.closeio";
pub const MIX_PROP_AUDIO_LOAD_PREDECODE_BOOLEAN = "SDL_mixer.audio.load.predecode";
pub const MIX_PROP_AUDIO_LOAD_PREFERRED_MIXER_POINTER = "SDL_mixer.audio.load.preferred_mixer";
pub const MIX_PROP_AUDIO_LOAD_SKIP_METADATA_TAGS_BOOLEAN = "SDL_mixer.audio.load.skip_metadata_tags";
pub const MIX_PROP_AUDIO_LOAD_IGNORE_LOOPS_BOOLEAN = "SDL_mixer.audio.load.ignore_loops";
pub const MIX_PROP_AUDIO_DECODER_STRING = "SDL_mixer.audio.decoder";
pub const MIX_PROP_METADATA_TITLE_STRING = "SDL_mixer.metadata.title";
pub const MIX_PROP_METADATA_ARTIST_STRING = "SDL_mixer.metadata.artist";
pub const MIX_PROP_METADATA_ALBUM_STRING = "SDL_mixer.metadata.album";
pub const MIX_PROP_METADATA_COPYRIGHT_STRING = "SDL_mixer.metadata.copyright";
pub const MIX_PROP_METADATA_TRACK_NUMBER = "SDL_mixer.metadata.track";
pub const MIX_PROP_METADATA_TOTAL_TRACKS_NUMBER = "SDL_mixer.metadata.total_tracks";
pub const MIX_PROP_METADATA_YEAR_NUMBER = "SDL_mixer.metadata.year";
pub const MIX_PROP_METADATA_DURATION_FRAMES_NUMBER = "SDL_mixer.metadata.duration_frames";
pub const MIX_PROP_METADATA_DURATION_INFINITE_BOOLEAN = "SDL_mixer.metadata.duration_infinite";
pub const MIX_PROP_PLAY_LOOPS_NUMBER = "SDL_mixer.play.loops";
pub const MIX_PROP_PLAY_MAX_FRAME_NUMBER = "SDL_mixer.play.max_frame";
pub const MIX_PROP_PLAY_MAX_MILLISECONDS_NUMBER = "SDL_mixer.play.max_milliseconds";
pub const MIX_PROP_PLAY_START_FRAME_NUMBER = "SDL_mixer.play.start_frame";
pub const MIX_PROP_PLAY_START_MILLISECOND_NUMBER = "SDL_mixer.play.start_millisecond";
pub const MIX_PROP_PLAY_START_ORDER_NUMBER = "SDL_mixer.play.start_order";
pub const MIX_PROP_PLAY_LOOP_START_FRAME_NUMBER = "SDL_mixer.play.loop_start_frame";
pub const MIX_PROP_PLAY_LOOP_START_MILLISECOND_NUMBER = "SDL_mixer.play.loop_start_millisecond";
pub const MIX_PROP_PLAY_FADE_IN_FRAMES_NUMBER = "SDL_mixer.play.fade_in_frames";
pub const MIX_PROP_PLAY_FADE_IN_MILLISECONDS_NUMBER = "SDL_mixer.play.fade_in_milliseconds";
pub const MIX_PROP_PLAY_FADE_IN_START_GAIN_FLOAT = "SDL_mixer.play.fade_in_start_gain";
pub const MIX_PROP_PLAY_APPEND_SILENCE_FRAMES_NUMBER = "SDL_mixer.play.append_silence_frames";
pub const MIX_PROP_PLAY_APPEND_SILENCE_MILLISECONDS_NUMBER = "SDL_mixer.play.append_silence_milliseconds";
pub const MIX_PROP_PLAY_HALT_WHEN_EXHAUSTED_BOOLEAN = "SDL_mixer.play.halt_when_exhausted";

// Mixer functions
extern fn MIX_Version() c_int;
extern fn MIX_Init() bool;
extern fn MIX_Quit() void;
extern fn MIX_GetNumAudioDecoders() c_int;
extern fn MIX_GetAudioDecoder(index: c_int) ?[*:0]const u8;
extern fn MIX_CreateMixerDevice(devid: SDL_AudioDeviceID, spec: ?*const SDL_AudioSpec) ?*MIX_Mixer;
extern fn MIX_CreateMixer(spec: ?*const SDL_AudioSpec) ?*MIX_Mixer;
extern fn MIX_DestroyMixer(mixer: ?*MIX_Mixer) void;
extern fn MIX_GetMixerProperties(mixer: ?*MIX_Mixer) SDL_PropertiesID;
extern fn MIX_GetMixerFormat(mixer: ?*MIX_Mixer, spec: ?*SDL_AudioSpec) bool;
extern fn MIX_LockMixer(mixer: ?*MIX_Mixer) void;
extern fn MIX_UnlockMixer(mixer: ?*MIX_Mixer) void;
extern fn MIX_GetMixerGain(mixer: ?*MIX_Mixer) f32;
extern fn MIX_SetMixerGain(mixer: ?*MIX_Mixer, gain: f32) bool;
extern fn MIX_GetMixerFrequencyRatio(mixer: ?*MIX_Mixer) f32;
extern fn MIX_SetMixerFrequencyRatio(mixer: ?*MIX_Mixer, ratio: f32) bool;
extern fn MIX_LoadAudio(mixer: ?*MIX_Mixer, path: ?[*:0]const u8, predecode: bool) ?*MIX_Audio;
extern fn MIX_LoadAudio_IO(mixer: ?*MIX_Mixer, io: ?*SDL_IOStream, predecode: bool, closeio: bool) ?*MIX_Audio;
extern fn MIX_LoadAudioNoCopy(mixer: ?*MIX_Mixer, data: ?*const anyopaque, datalen: usize, free_when_done: bool) ?*MIX_Audio;
extern fn MIX_LoadAudioWithProperties(props: SDL_PropertiesID) ?*MIX_Audio;
extern fn MIX_LoadRawAudio(mixer: ?*MIX_Mixer, data: ?*const anyopaque, datalen: usize, spec: ?*const SDL_AudioSpec) ?*MIX_Audio;
extern fn MIX_LoadRawAudio_IO(mixer: ?*MIX_Mixer, io: ?*SDL_IOStream, spec: ?*const SDL_AudioSpec, closeio: bool) ?*MIX_Audio;
extern fn MIX_LoadRawAudioNoCopy(mixer: ?*MIX_Mixer, data: ?*const anyopaque, datalen: usize, spec: ?*const SDL_AudioSpec, free_when_done: bool) ?*MIX_Audio;
extern fn MIX_CreateSineWaveAudio(mixer: ?*MIX_Mixer, hz: c_int, amplitude: f32, ms: Sint64) ?*MIX_Audio;
extern fn MIX_GetAudioProperties(audio: ?*MIX_Audio) SDL_PropertiesID;
extern fn MIX_GetAudioDuration(audio: ?*MIX_Audio) Sint64;
extern fn MIX_GetAudioFormat(audio: ?*MIX_Audio, spec: ?*SDL_AudioSpec) bool;
extern fn MIX_DestroyAudio(audio: ?*MIX_Audio) void;
extern fn MIX_CreateTrack(mixer: ?*MIX_Mixer) ?*MIX_Track;
extern fn MIX_DestroyTrack(track: ?*MIX_Track) void;
extern fn MIX_GetTrackProperties(track: ?*MIX_Track) SDL_PropertiesID;
extern fn MIX_GetTrackMixer(track: ?*MIX_Track) ?*MIX_Mixer;
extern fn MIX_GetTrackAudio(track: ?*MIX_Track) ?*MIX_Audio;
extern fn MIX_SetTrackAudio(track: ?*MIX_Track, audio: ?*MIX_Audio) bool;
extern fn MIX_SetTrackAudioStream(track: ?*MIX_Track, stream: ?*anyopaque) bool;
extern fn MIX_SetTrackIOStream(track: ?*MIX_Track, io: ?*SDL_IOStream, closeio: bool) bool;
extern fn MIX_SetTrackRawIOStream(track: ?*MIX_Track, io: ?*SDL_IOStream, spec: ?*const SDL_AudioSpec, closeio: bool) bool;
extern fn MIX_GetTrackAudioStream(track: ?*MIX_Track) ?*anyopaque;
extern fn MIX_GetTrackGain(track: ?*MIX_Track) f32;
extern fn MIX_SetTrackGain(track: ?*MIX_Track, gain: f32) bool;
extern fn MIX_GetTrackFrequencyRatio(track: ?*MIX_Track) f32;
extern fn MIX_SetTrackFrequencyRatio(track: ?*MIX_Track, ratio: f32) bool;
extern fn MIX_GetTrackLoops(track: ?*MIX_Track) c_int;
extern fn MIX_SetTrackLoops(track: ?*MIX_Track, loops: c_int) bool;
extern fn MIX_GetTrackFadeFrames(track: ?*MIX_Track) Uint32;
extern fn MIX_GetTrackRemaining(track: ?*MIX_Track) Sint64;
extern fn MIX_GetTrackPlaybackPosition(track: ?*MIX_Track) Uint64;
extern fn MIX_SetTrackPlaybackPosition(track: ?*MIX_Track, frame: Uint64) bool;
extern fn MIX_SetTrack3DPosition(track: ?*MIX_Track, position: MIX_Point3D, max_distance: f32) bool;
extern fn MIX_GetTrack3DPosition(track: ?*MIX_Track, position: ?*MIX_Point3D, max_distance: ?*f32) bool;
extern fn MIX_SetTrackStereo(track: ?*MIX_Track, gains: MIX_StereoGains) bool;
extern fn MIX_SetTrackOutputChannelMap(track: ?*MIX_Track, channel_map: ?[*]c_int, num_channels: c_int) bool;
extern fn MIX_SetTrackGroup(track: ?*MIX_Track, group: ?*MIX_Group) bool;
extern fn MIX_PlayTrack(track: ?*MIX_Track, props: SDL_PropertiesID) bool;
extern fn MIX_PlayAudio(mixer: ?*MIX_Mixer, audio: ?*MIX_Audio, props: SDL_PropertiesID) ?*MIX_Track;
extern fn MIX_PlayTag(mixer: ?*MIX_Mixer, tag: ?[*:0]const u8, props: SDL_PropertiesID) bool;
extern fn MIX_StopTrack(track: ?*MIX_Track) bool;
extern fn MIX_StopTag(mixer: ?*MIX_Mixer, tag: ?[*:0]const u8) bool;
extern fn MIX_StopAllTracks(mixer: ?*MIX_Mixer) bool;
extern fn MIX_PauseTrack(track: ?*MIX_Track) bool;
extern fn MIX_PauseTag(mixer: ?*MIX_Mixer, tag: ?[*:0]const u8) bool;
extern fn MIX_PauseAllTracks(mixer: ?*MIX_Mixer) bool;
extern fn MIX_ResumeTrack(track: ?*MIX_Track) bool;
extern fn MIX_ResumeTag(mixer: ?*MIX_Mixer, tag: ?[*:0]const u8) bool;
extern fn MIX_ResumeAllTracks(mixer: ?*MIX_Mixer) bool;
extern fn MIX_TrackPaused(track: ?*MIX_Track) bool;
extern fn MIX_TrackPlaying(track: ?*MIX_Track) bool;
extern fn MIX_TagTrack(track: ?*MIX_Track, tag: ?[*:0]const u8) bool;
extern fn MIX_UntagTrack(track: ?*MIX_Track) bool;
extern fn MIX_SetTrackStoppedCallback(track: ?*MIX_Track, callback: MIX_TrackStoppedCallback, userdata: ?*anyopaque) bool;
extern fn MIX_SetTrackRawCallback(track: ?*MIX_Track, callback: MIX_TrackMixCallback, userdata: ?*anyopaque) bool;
extern fn MIX_SetTrackCookedCallback(track: ?*MIX_Track, callback: MIX_TrackMixCallback, userdata: ?*anyopaque) bool;
extern fn MIX_SetGroupPostMixCallback(group: ?*MIX_Group, callback: MIX_GroupMixCallback, userdata: ?*anyopaque) bool;
extern fn MIX_SetPostMixCallback(mixer: ?*MIX_Mixer, callback: MIX_PostMixCallback, userdata: ?*anyopaque) bool;
extern fn MIX_SetTagGain(mixer: ?*MIX_Mixer, tag: ?[*:0]const u8, gain: f32) bool;
extern fn MIX_CreateGroup(mixer: ?*MIX_Mixer) ?*MIX_Group;
extern fn MIX_DestroyGroup(group: ?*MIX_Group) void;
extern fn MIX_GetGroupProperties(group: ?*MIX_Group) SDL_PropertiesID;
extern fn MIX_GetGroupMixer(group: ?*MIX_Group) ?*MIX_Mixer;
extern fn MIX_CreateAudioDecoder(mixer: ?*MIX_Mixer, src: ?*SDL_IOStream, closeio: bool) ?*MIX_AudioDecoder;
extern fn MIX_CreateAudioDecoder_IO(mixer: ?*MIX_Mixer, src: ?*SDL_IOStream, spec: ?*const SDL_AudioSpec, closeio: bool) ?*MIX_AudioDecoder;
extern fn MIX_DecodeAudio(decoder: ?*MIX_AudioDecoder, buf: ?*?*anyopaque, len: ?*usize) bool;
extern fn MIX_GetAudioDecoderProperties(decoder: ?*MIX_AudioDecoder) SDL_PropertiesID;
extern fn MIX_GetAudioDecoderFormat(decoder: ?*MIX_AudioDecoder, spec: ?*SDL_AudioSpec) bool;
extern fn MIX_DestroyAudioDecoder(decoder: ?*MIX_AudioDecoder) void;
extern fn MIX_Generate(mixer: ?*MIX_Mixer, pcm: ?*f32, frames: c_int, spec: ?*SDL_AudioSpec) c_int;
extern fn MIX_MSToFrames(mixer: ?*MIX_Mixer, ms: c_int) Uint32;
extern fn MIX_FramesToMS(mixer: ?*MIX_Mixer, frames: Uint32) c_int;
extern fn MIX_TrackMSToFrames(track: ?*MIX_Track, ms: c_int) Uint32;
extern fn MIX_TrackFramesToMS(track: ?*MIX_Track, frames: Uint32) c_int;
extern fn MIX_AudioMSToFrames(audio: ?*MIX_Audio, ms: c_int) Uint32;
extern fn MIX_AudioFramesToMS(audio: ?*MIX_Audio, frames: Uint32) c_int;

// Public API
pub const version = MIX_Version;
pub const init = MIX_Init;
pub const quit = MIX_Quit;
pub const getNumAudioDecoders = MIX_GetNumAudioDecoders;
pub const getAudioDecoder = MIX_GetAudioDecoder;
pub const createMixerDevice = MIX_CreateMixerDevice;
pub const createMixer = MIX_CreateMixer;
pub const destroyMixer = MIX_DestroyMixer;
pub const getMixerProperties = MIX_GetMixerProperties;
pub const getMixerFormat = MIX_GetMixerFormat;
pub const lockMixer = MIX_LockMixer;
pub const unlockMixer = MIX_UnlockMixer;
pub const getMixerGain = MIX_GetMixerGain;
pub const setMixerGain = MIX_SetMixerGain;
pub const getMixerFrequencyRatio = MIX_GetMixerFrequencyRatio;
pub const setMixerFrequencyRatio = MIX_SetMixerFrequencyRatio;
pub const loadAudio = MIX_LoadAudio;
pub const loadAudioIO = MIX_LoadAudio_IO;
pub const loadAudioNoCopy = MIX_LoadAudioNoCopy;
pub const loadAudioWithProperties = MIX_LoadAudioWithProperties;
pub const loadRawAudio = MIX_LoadRawAudio;
pub const loadRawAudioIO = MIX_LoadRawAudio_IO;
pub const loadRawAudioNoCopy = MIX_LoadRawAudioNoCopy;
pub const createSineWaveAudio = MIX_CreateSineWaveAudio;
pub const getAudioProperties = MIX_GetAudioProperties;
pub const getAudioDuration = MIX_GetAudioDuration;
pub const getAudioFormat = MIX_GetAudioFormat;
pub const destroyAudio = MIX_DestroyAudio;
pub const createTrack = MIX_CreateTrack;
pub const destroyTrack = MIX_DestroyTrack;
pub const getTrackProperties = MIX_GetTrackProperties;
pub const getTrackMixer = MIX_GetTrackMixer;
pub const getTrackAudio = MIX_GetTrackAudio;
pub const setTrackAudio = MIX_SetTrackAudio;
pub const setTrackAudioStream = MIX_SetTrackAudioStream;
pub const setTrackIOStream = MIX_SetTrackIOStream;
pub const setTrackRawIOStream = MIX_SetTrackRawIOStream;
pub const getTrackAudioStream = MIX_GetTrackAudioStream;
pub const getTrackGain = MIX_GetTrackGain;
pub const setTrackGain = MIX_SetTrackGain;
pub const getTrackFrequencyRatio = MIX_GetTrackFrequencyRatio;
pub const setTrackFrequencyRatio = MIX_SetTrackFrequencyRatio;
pub const getTrackLoops = MIX_GetTrackLoops;
pub const setTrackLoops = MIX_SetTrackLoops;
pub const getTrackFadeFrames = MIX_GetTrackFadeFrames;
pub const getTrackRemaining = MIX_GetTrackRemaining;
pub const getTrackPlaybackPosition = MIX_GetTrackPlaybackPosition;
pub const setTrackPlaybackPosition = MIX_SetTrackPlaybackPosition;
pub const setTrack3DPosition = MIX_SetTrack3DPosition;
pub const getTrack3DPosition = MIX_GetTrack3DPosition;
pub const setTrackStereo = MIX_SetTrackStereo;
pub const setTrackOutputChannelMap = MIX_SetTrackOutputChannelMap;
pub const setTrackGroup = MIX_SetTrackGroup;
pub const playTrack = MIX_PlayTrack;
pub const playAudio = MIX_PlayAudio;
pub const playTag = MIX_PlayTag;
pub const stopTrack = MIX_StopTrack;
pub const stopTag = MIX_StopTag;
pub const stopAllTracks = MIX_StopAllTracks;
pub const pauseTrack = MIX_PauseTrack;
pub const pauseTag = MIX_PauseTag;
pub const pauseAllTracks = MIX_PauseAllTracks;
pub const resumeTrack = MIX_ResumeTrack;
pub const resumeTag = MIX_ResumeTag;
pub const resumeAllTracks = MIX_ResumeAllTracks;
pub const trackPaused = MIX_TrackPaused;
pub const trackPlaying = MIX_TrackPlaying;
pub const tagTrack = MIX_TagTrack;
pub const untagTrack = MIX_UntagTrack;
pub const setTrackStoppedCallback = MIX_SetTrackStoppedCallback;
pub const setTrackRawCallback = MIX_SetTrackRawCallback;
pub const setTrackCookedCallback = MIX_SetTrackCookedCallback;
pub const setGroupPostMixCallback = MIX_SetGroupPostMixCallback;
pub const setPostMixCallback = MIX_SetPostMixCallback;
pub const setTagGain = MIX_SetTagGain;
pub const createGroup = MIX_CreateGroup;
pub const destroyGroup = MIX_DestroyGroup;
pub const getGroupProperties = MIX_GetGroupProperties;
pub const getGroupMixer = MIX_GetGroupMixer;
pub const createAudioDecoder = MIX_CreateAudioDecoder;
pub const createAudioDecoderIO = MIX_CreateAudioDecoder_IO;
pub const decodeAudio = MIX_DecodeAudio;
pub const getAudioDecoderProperties = MIX_GetAudioDecoderProperties;
pub const getAudioDecoderFormat = MIX_GetAudioDecoderFormat;
pub const destroyAudioDecoder = MIX_DestroyAudioDecoder;
pub const generateMixer = MIX_Generate;
pub const msToFrames = MIX_MSToFrames;
pub const framesToMS = MIX_FramesToMS;
pub const trackMSToFrames = MIX_TrackMSToFrames;
pub const trackFramesToMS = MIX_TrackFramesToMS;
pub const audioMSToFrames = MIX_AudioMSToFrames;
pub const audioFramesToMS = MIX_AudioFramesToMS;
