// SDL3 Metal Bindings
// Metal graphics interop for macOS/iOS

const video = @import("video.zig");

// Metal view (opaque)
pub const SDL_MetalView = opaque {};

// Metal functions
extern fn SDL_Metal_CreateView(window: ?*video.SDL_Window) ?*SDL_MetalView;
extern fn SDL_Metal_DestroyView(view: ?*SDL_MetalView) void;
extern fn SDL_Metal_GetLayer(view: ?*SDL_MetalView) ?*anyopaque;

// Public API
pub const createView = SDL_Metal_CreateView;
pub const destroyView = SDL_Metal_DestroyView;
pub const getLayer = SDL_Metal_GetLayer;
