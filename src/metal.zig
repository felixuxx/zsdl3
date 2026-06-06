// SDL3 Metal Bindings
// Metal graphics interop for macOS/iOS

const dynamic = @import("dynamic.zig");
const video = @import("video.zig");

// Metal view (opaque)
pub const SDL_MetalView = opaque {};

// Metal functions
pub const PFN_SDL_Metal_LoadLibrary = *const fn () callconv(.c) bool;
pub const PFN_SDL_Metal_GetLibrary = *const fn () callconv(.c) ?*anyopaque;
pub const PFN_SDL_Metal_UnloadLibrary = *const fn () callconv(.c) void;
pub const PFN_SDL_Metal_CreateView = *const fn (window: ?*video.SDL_Window) callconv(.c) ?*SDL_MetalView;
pub const PFN_SDL_Metal_DestroyView = *const fn (view: ?*SDL_MetalView) callconv(.c) void;
pub const PFN_SDL_Metal_GetLayer = *const fn (view: ?*SDL_MetalView) callconv(.c) ?*anyopaque;
pub const PFN_SDL_Metal_GetDrawableSize = *const fn (window: ?*video.SDL_Window, w: ?*c_int, h: ?*c_int) callconv(.c) void;

pub const MetalFunctions = struct {
    loadLibrary: ?PFN_SDL_Metal_LoadLibrary,
    getLibrary: ?PFN_SDL_Metal_GetLibrary,
    unloadLibrary: ?PFN_SDL_Metal_UnloadLibrary,
    createView: PFN_SDL_Metal_CreateView,
    destroyView: PFN_SDL_Metal_DestroyView,
    getLayer: PFN_SDL_Metal_GetLayer,
    getDrawableSize: ?PFN_SDL_Metal_GetDrawableSize,

    pub fn load(handle: dynamic.LibraryHandle) !MetalFunctions {
        return dynamic.loadFunctions(MetalFunctions, handle, "SDL_", .{
            .{ "loadLibrary", "SDL_Metal_LoadLibrary" },
            .{ "getLibrary", "SDL_Metal_GetLibrary" },
            .{ "unloadLibrary", "SDL_Metal_UnloadLibrary" },
            .{ "createView", "SDL_Metal_CreateView" },
            .{ "destroyView", "SDL_Metal_DestroyView" },
            .{ "getLayer", "SDL_Metal_GetLayer" },
            .{ "getDrawableSize", "SDL_Metal_GetDrawableSize" },
        }, &.{ "loadLibrary", "getLibrary", "unloadLibrary", "getDrawableSize" });
    }
};
