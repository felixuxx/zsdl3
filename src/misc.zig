// SDL3 Misc Bindings
// Utility functions

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");
const log = @import("log.zig");

// Import types
pub const Uint16 = core.Uint16;
pub const Uint32 = core.Uint32;
pub const SDL_LogPriority = log.SDL_LogPriority;

// Misc functions
pub const PFN_SDL_OpenURL = *const fn (url: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_CRC16 = *const fn (crc: Uint16, data: ?*const anyopaque, len: usize) callconv(.c) Uint16;
pub const PFN_SDL_CRC32 = *const fn (crc: Uint32, data: ?*const anyopaque, len: usize) callconv(.c) Uint32;
pub const PFN_SDL_murmur3_32 = *const fn (data: ?*const anyopaque, len: usize, seed: Uint32) callconv(.c) Uint32;
pub const PFN_SDL_GetNumAllocations = *const fn () callconv(.c) c_int;
pub const PFN_SDL_GetFullPath = *const fn (path: [*:0]const u8) callconv(.c) ?[*:0]const u8;

pub const MiscFunctions = struct {
    openURL: PFN_SDL_OpenURL,
    crc16: PFN_SDL_CRC16,
    crc32: PFN_SDL_CRC32,
    murmur3_32: PFN_SDL_murmur3_32,
    getNumAllocations: PFN_SDL_GetNumAllocations,
    getFullPath: PFN_SDL_GetFullPath,

    pub fn load(handle: dynamic.LibraryHandle) !MiscFunctions {
        return dynamic.loadFunctions(MiscFunctions, handle, "SDL_", .{
            .{ "crc16", "SDL_crc16" },
            .{ "crc32", "SDL_crc32" },
            .{ "murmur3_32", "SDL_murmur3_32" },
        }, &.{ "getFullPath" });
    }
};
