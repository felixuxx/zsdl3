// SDL3 CPUInfo Bindings
// CPU feature detection

const dynamic = @import("dynamic.zig");

// CPU cacheline size constant
pub const SDL_CACHELINE_SIZE: c_int = 128;

// CPU functions
pub const PFN_SDL_GetNumLogicalCPUCores = *const fn () callconv(.c) c_int;
pub const PFN_SDL_GetCPUCacheLineSize = *const fn () callconv(.c) c_int;
pub const PFN_SDL_HasAltiVec = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasMMX = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasSSE = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasSSE2 = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasSSE3 = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasSSE41 = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasSSE42 = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasAVX = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasAVX2 = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasAVX512F = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasARMSIMD = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasNEON = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasLSX = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasLASX = *const fn () callconv(.c) bool;
pub const PFN_SDL_GetSystemPageSize = *const fn () callconv(.c) c_int;

pub const CpuInfoFunctions = struct {
    getNumLogicalCPUCores: PFN_SDL_GetNumLogicalCPUCores,
    getCPUCacheLineSize: PFN_SDL_GetCPUCacheLineSize,
    hasAltiVec: PFN_SDL_HasAltiVec,
    hasMMX: PFN_SDL_HasMMX,
    hasSSE: PFN_SDL_HasSSE,
    hasSSE2: PFN_SDL_HasSSE2,
    hasSSE3: PFN_SDL_HasSSE3,
    hasSSE41: PFN_SDL_HasSSE41,
    hasSSE42: PFN_SDL_HasSSE42,
    hasAVX: PFN_SDL_HasAVX,
    hasAVX2: PFN_SDL_HasAVX2,
    hasAVX512F: PFN_SDL_HasAVX512F,
    hasARMSIMD: PFN_SDL_HasARMSIMD,
    hasNEON: PFN_SDL_HasNEON,
    hasLSX: PFN_SDL_HasLSX,
    hasLASX: PFN_SDL_HasLASX,
    getSystemPageSize: PFN_SDL_GetSystemPageSize,

    pub fn load(handle: dynamic.LibraryHandle) !CpuInfoFunctions {
        return dynamic.loadFunctions(CpuInfoFunctions, handle, "SDL_", .{}, &.{});
    }
};
