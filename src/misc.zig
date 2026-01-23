// SDL3 Misc Bindings
// Utility functions

const core = @import("core.zig");
const log = @import("log.zig");

// Import types
pub const Uint16 = core.Uint16;
pub const Uint32 = core.Uint32;
pub const SDL_LogPriority = log.SDL_LogPriority;

// Misc functions
extern fn SDL_OpenURL(url: [*:0]const u8) bool;
extern fn SDL_GetDefaultLogOutputFunction() ?*const fn (?*anyopaque, c_int, SDL_LogPriority, [*:0]const u8) callconv(.C) void;
extern fn SDL_CRC16(crc: Uint16, data: ?*const anyopaque, len: usize) Uint16;
extern fn SDL_CRC32(crc: Uint32, data: ?*const anyopaque, len: usize) Uint32;
extern fn SDL_murmur3_32(data: ?*const anyopaque, len: usize, seed: Uint32) Uint32;
extern fn SDL_GetNumAllocations() c_int;
extern fn SDL_GetFullPath(path: [*:0]const u8) ?[*:0]const u8;

// Public API
pub const openURL = SDL_OpenURL;
pub const getDefaultLogOutputFunction = SDL_GetDefaultLogOutputFunction;
pub const crc16 = SDL_CRC16;
pub const crc32 = SDL_CRC32;
pub const murmur3_32 = SDL_murmur3_32;
pub const getNumAllocations = SDL_GetNumAllocations;
pub const getFullPath = SDL_GetFullPath;
