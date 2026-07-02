const core = @import("core.zig");
const video = @import("video.zig");

pub const Uint32 = core.Uint32;
pub const SDL_Window = video.SDL_Window;
pub const SDL_EGLDisplay = video.SDL_EGLDisplay;
pub const SDL_EGLConfig = video.SDL_EGLConfig;
pub const SDL_EGLSurface = video.SDL_EGLSurface;

pub const SDL_EGLAttrib = isize;
pub const SDL_EGLint = c_int;

pub const SDL_EGLAttribArrayCallback = ?*const fn (?*anyopaque) callconv(.c) ?*SDL_EGLAttrib;
pub const SDL_EGLIntArrayCallback = ?*const fn (?*anyopaque, SDL_EGLDisplay, SDL_EGLConfig) callconv(.c) ?*SDL_EGLint;

extern fn SDL_EGL_GetCurrentConfig() SDL_EGLConfig;
extern fn SDL_EGL_GetCurrentDisplay() SDL_EGLDisplay;
extern fn SDL_EGL_GetProcAddress(proc: ?[*:0]const u8) ?*const fn () callconv(.c) void;
extern fn SDL_EGL_GetWindowSurface(window: ?*SDL_Window) SDL_EGLSurface;
extern fn SDL_EGL_SetAttributeCallbacks(platformAttribCallback: SDL_EGLAttribArrayCallback, surfaceAttribCallback: SDL_EGLIntArrayCallback, contextAttribCallback: SDL_EGLIntArrayCallback, userdata: ?*anyopaque) void;

pub const eglGetCurrentConfig = SDL_EGL_GetCurrentConfig;
pub const eglGetCurrentDisplay = SDL_EGL_GetCurrentDisplay;
pub const eglGetProcAddress = SDL_EGL_GetProcAddress;
pub const eglGetWindowSurface = SDL_EGL_GetWindowSurface;
pub const eglSetAttributeCallbacks = SDL_EGL_SetAttributeCallbacks;
