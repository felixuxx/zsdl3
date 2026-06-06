// SDL3 System Bindings
// System queries

const dynamic = @import("dynamic.zig");

// System functions
pub const PFN_SDL_GetSystemRAM = *const fn () callconv(.c) c_int;
pub const PFN_SDL_GetSIMDAlignment = *const fn () callconv(.c) usize;

pub const SystemFunctions = struct {
    getSystemRAM: PFN_SDL_GetSystemRAM,
    getSIMDAlignment: PFN_SDL_GetSIMDAlignment,

    pub fn load(handle: dynamic.LibraryHandle) !SystemFunctions {
        return dynamic.loadFunctions(SystemFunctions, handle, "SDL_", .{}, &.{});
    }
};
