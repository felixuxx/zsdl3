// SDL3 Metal Bindings
// Metal graphics interop for macOS/iOS

const core = @import("core.zig");
const video = @import("video.zig");

// Metal view (opaque)
pub const SDL_MetalView = opaque {};

// Metal functions
extern fn SDL_Metal_LoadLibrary() bool;
extern fn SDL_Metal_GetLibrary() ?*anyopaque;
extern fn SDL_Metal_UnloadLibrary() void;
extern fn SDL_Metal_CreateView(window: ?*video.SDL_Window) ?*SDL_MetalView;
extern fn SDL_Metal_DestroyView(view: ?*SDL_MetalView) void;
extern fn SDL_Metal_GetLayer(view: ?*SDL_MetalView) ?*anyopaque;
extern fn SDL_Metal_GetDrawableSize(window: ?*video.SDL_Window, w: ?*c_int, h: ?*c_int) void;

// Public API
pub const loadLibrary = SDL_Metal_LoadLibrary;
pub const getLibrary = SDL_Metal_GetLibrary;
pub const unloadLibrary = SDL_Metal_UnloadLibrary;
pub const createView = SDL_Metal_CreateView;
pub const destroyView = SDL_Metal_DestroyView;
pub const getLayer = SDL_Metal_GetLayer;
pub const getDrawableSize = SDL_Metal_GetDrawableSize;
