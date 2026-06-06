// SDL3 Platform Bindings
// Platform detection

const dynamic = @import("dynamic.zig");

// Platform functions
pub const PFN_SDL_GetPlatform = *const fn () callconv(.c) ?[*:0]const u8;

pub const PlatformFunctions = struct {
    getPlatform: PFN_SDL_GetPlatform,

    pub fn load(handle: dynamic.LibraryHandle) !PlatformFunctions {
        return dynamic.loadFunctions(PlatformFunctions, handle, "SDL_", .{}, &.{});
    }
};
