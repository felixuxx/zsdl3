// SDL3 SharedObject Bindings
// Dynamic library loading

const dynamic = @import("dynamic.zig");

// Shared object handle
pub const SDL_SharedObject = opaque {};

// Shared object functions
pub const PFN_SDL_LoadObject = *const fn (sofile: ?[*:0]const u8) callconv(.c) ?*SDL_SharedObject;
pub const PFN_SDL_LoadFunction = *const fn (handle: ?*SDL_SharedObject, name: ?[*:0]const u8) callconv(.c) ?*anyopaque;
pub const PFN_SDL_UnloadObject = *const fn (handle: ?*SDL_SharedObject) callconv(.c) void;

pub const SharedObjectFunctions = struct {
    loadObject: PFN_SDL_LoadObject,
    loadFunction: PFN_SDL_LoadFunction,
    unloadObject: PFN_SDL_UnloadObject,

    pub fn load(handle: dynamic.LibraryHandle) !SharedObjectFunctions {
        return dynamic.loadFunctions(SharedObjectFunctions, handle, "SDL_", .{}, &.{});
    }
};
