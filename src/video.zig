// SDL3 Video Bindings
// Window management, display handling

const core = @import("core.zig");
const pixels = @import("pixels.zig");
const dynamic = @import("dynamic.zig");

// Import basic types
pub const Uint32 = core.Uint32;
pub const Uint64 = core.Uint64;
pub const SDL_DisplayID = core.SDL_DisplayID;
pub const SDL_WindowID = core.SDL_WindowID;

// Window flags
pub const SDL_WindowFlags = Uint64;
pub const SDL_WINDOW_FULLSCREEN: SDL_WindowFlags = 0x0000000000000001;
pub const SDL_WINDOW_OPENGL: SDL_WindowFlags = 0x0000000000000002;
pub const SDL_WINDOW_OCCLUDED: SDL_WindowFlags = 0x0000000000000004;
pub const SDL_WINDOW_HIDDEN: SDL_WindowFlags = 0x0000000000000008;
pub const SDL_WINDOW_BORDERLESS: SDL_WindowFlags = 0x0000000000000010;
pub const SDL_WINDOW_RESIZABLE: SDL_WindowFlags = 0x0000000000000020;
pub const SDL_WINDOW_MINIMIZED: SDL_WindowFlags = 0x0000000000000040;
pub const SDL_WINDOW_MAXIMIZED: SDL_WindowFlags = 0x0000000000000080;
pub const SDL_WINDOW_MOUSE_GRABBED: SDL_WindowFlags = 0x0000000000000100;
pub const SDL_WINDOW_INPUT_FOCUS: SDL_WindowFlags = 0x0000000000000200;
pub const SDL_WINDOW_MOUSE_FOCUS: SDL_WindowFlags = 0x0000000000000400;
pub const SDL_WINDOW_EXTERNAL: SDL_WindowFlags = 0x0000000000000800;
pub const SDL_WINDOW_MODAL: SDL_WindowFlags = 0x0000000000001000;
pub const SDL_WINDOW_HIGH_PIXEL_DENSITY: SDL_WindowFlags = 0x0000000000002000;
pub const SDL_WINDOW_MOUSE_CAPTURE: SDL_WindowFlags = 0x0000000000004000;
pub const SDL_WINDOW_MOUSE_RELATIVE_MODE: SDL_WindowFlags = 0x0000000000008000;
pub const SDL_WINDOW_ALWAYS_ON_TOP: SDL_WindowFlags = 0x0000000000010000;
pub const SDL_WINDOW_UTILITY: SDL_WindowFlags = 0x0000000000020000;
pub const SDL_WINDOW_TOOLTIP: SDL_WindowFlags = 0x0000000000040000;
pub const SDL_WINDOW_POPUP_MENU: SDL_WindowFlags = 0x0000000000080000;
pub const SDL_WINDOW_KEYBOARD_GRABBED: SDL_WindowFlags = 0x0000000000100000;
pub const SDL_WINDOW_FILL_DOCUMENT: SDL_WindowFlags = 0x0000000000200000;
pub const SDL_WINDOW_VULKAN: SDL_WindowFlags = 0x0000000010000000;
pub const SDL_WINDOW_METAL: SDL_WindowFlags = 0x0000000020000000;
pub const SDL_WINDOW_TRANSPARENT: SDL_WindowFlags = 0x0000000040000000;
pub const SDL_WINDOW_NOT_FOCUSABLE: SDL_WindowFlags = 0x0000000080000000;

// Window position macros (simplified)
pub const SDL_WINDOWPOS_UNDEFINED: c_int = 0x1FFF0000;
pub const SDL_WINDOWPOS_CENTERED: c_int = 0x2FFF0000;

// Flash operation
pub const SDL_FlashOperation = enum(c_int) {
    SDL_FLASH_CANCEL,
    SDL_FLASH_BRIEFLY,
    SDL_FLASH_UNTIL_FOCUSED,
};

// Progress state
pub const SDL_ProgressState = enum(c_int) {
    SDL_PROGRESS_STATE_INVALID = -1,
    SDL_PROGRESS_STATE_NONE,
    SDL_PROGRESS_STATE_INDETERMINATE,
    SDL_PROGRESS_STATE_NORMAL,
    SDL_PROGRESS_STATE_PAUSED,
    SDL_PROGRESS_STATE_ERROR,
};

// Opaque structs
pub const SDL_Window = opaque {};
pub const SDL_Cursor = opaque {};
pub const SDL_GLContext = opaque {};
pub const SDL_EGLDisplay = ?*anyopaque;
pub const SDL_EGLConfig = ?*anyopaque;
pub const SDL_EGLSurface = ?*anyopaque;

// GL attribute enum
pub const SDL_GLAttr = enum(c_int) {
    SDL_GL_RED_SIZE,
    SDL_GL_GREEN_SIZE,
    SDL_GL_BLUE_SIZE,
    SDL_GL_ALPHA_SIZE,
    SDL_GL_BUFFER_SIZE,
    SDL_GL_DOUBLEBUFFER,
    SDL_GL_DEPTH_SIZE,
    SDL_GL_STENCIL_SIZE,
    SDL_GL_ACCUM_RED_SIZE,
    SDL_GL_ACCUM_GREEN_SIZE,
    SDL_GL_ACCUM_BLUE_SIZE,
    SDL_GL_ACCUM_ALPHA_SIZE,
    SDL_GL_STEREO,
    SDL_GL_MULTISAMPLEBUFFERS,
    SDL_GL_MULTISAMPLESAMPLES,
    SDL_GL_ACCELERATED_VISUAL,
    SDL_GL_RETAINED_BACKING,
    SDL_GL_CONTEXT_MAJOR_VERSION,
    SDL_GL_CONTEXT_MINOR_VERSION,
    SDL_GL_CONTEXT_FLAGS,
    SDL_GL_CONTEXT_PROFILE_MASK,
    SDL_GL_SHARE_WITH_CURRENT_CONTEXT,
    SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR,
    SDL_GL_CONTEXT_RESET_NOTIFICATION,
    SDL_GL_CONTEXT_NO_ERROR,
    SDL_GL_FLOATBUFFERS,
    SDL_GL_EGL_PLATFORM,
};

// GL profile constants
pub const SDL_GL_CONTEXT_PROFILE_CORE: Uint32 = 0x0001;
pub const SDL_GL_CONTEXT_PROFILE_COMPATIBILITY: Uint32 = 0x0002;
pub const SDL_GL_CONTEXT_PROFILE_ES: Uint32 = 0x0004;

// GL context flags
pub const SDL_GL_CONTEXT_DEBUG_FLAG: Uint32 = 0x0001;
pub const SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG: Uint32 = 0x0002;
pub const SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG: Uint32 = 0x0004;
pub const SDL_GL_CONTEXT_RESET_ISOLATION_FLAG: Uint32 = 0x0008;

// GL context release behavior
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE: Uint32 = 0x0000;
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH: Uint32 = 0x0001;

// GL context reset notification
pub const SDL_GL_CONTEXT_RESET_NO_NOTIFICATION: Uint32 = 0x0000;
pub const SDL_GL_CONTEXT_RESET_LOSE_CONTEXT: Uint32 = 0x0001;

// EGL types
pub const SDL_EGLAttrib = isize;
pub const SDL_FunctionPointer = ?*anyopaque;

pub const SDL_EGLAttribArrayCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) ?*SDL_EGLAttrib;
pub const SDL_EGLIntArrayCallback = ?*const fn (userdata: ?*anyopaque, display: SDL_EGLDisplay, config: SDL_EGLConfig) callconv(.c) ?*c_int;

// Display mode struct
pub const SDL_DisplayMode = extern struct {
    displayID: SDL_DisplayID,
    format: c_uint, // SDL_PixelFormat
    w: c_int,
    h: c_int,
    pixel_density: f32,
    refresh_rate: f32,
    refresh_rate_numerator: c_int,
    refresh_rate_denominator: c_int,
    internal: ?*anyopaque,
};

// Display orientation
pub const SDL_DisplayOrientation = enum(c_int) {
    SDL_ORIENTATION_UNKNOWN,
    SDL_ORIENTATION_LANDSCAPE,
    SDL_ORIENTATION_LANDSCAPE_FLIPPED,
    SDL_ORIENTATION_PORTRAIT,
    SDL_ORIENTATION_PORTRAIT_FLIPPED,
};

// System theme
pub const SDL_SystemTheme = enum(c_int) {
    SDL_SYSTEM_THEME_UNKNOWN,
    SDL_SYSTEM_THEME_LIGHT,
    SDL_SYSTEM_THEME_DARK,
};

// Video function pointer types
pub const PFN_SDL_GetNumVideoDrivers = *const fn () callconv(.c) c_int;
pub const PFN_SDL_GetVideoDriver = *const fn (index: c_int) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetCurrentVideoDriver = *const fn () callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetSystemTheme = *const fn () callconv(.c) SDL_SystemTheme;
pub const PFN_SDL_GetDisplays = *const fn (count: ?*c_int) callconv(.c) ?[*]SDL_DisplayID;
pub const PFN_SDL_GetPrimaryDisplay = *const fn () callconv(.c) SDL_DisplayID;
pub const PFN_SDL_GetDisplayProperties = *const fn (displayID: SDL_DisplayID) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_GetDisplayName = *const fn (displayID: SDL_DisplayID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetDisplayBounds = *const fn (displayID: SDL_DisplayID, rect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetDisplayUsableBounds = *const fn (displayID: SDL_DisplayID, rect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetNaturalDisplayOrientation = *const fn (displayID: SDL_DisplayID) callconv(.c) SDL_DisplayOrientation;
pub const PFN_SDL_GetCurrentDisplayOrientation = *const fn (displayID: SDL_DisplayID) callconv(.c) SDL_DisplayOrientation;
pub const PFN_SDL_GetDisplayContentScale = *const fn (displayID: SDL_DisplayID) callconv(.c) f32;
pub const PFN_SDL_GetDesktopDisplayMode = *const fn (displayID: SDL_DisplayID) callconv(.c) ?*const SDL_DisplayMode;
pub const PFN_SDL_GetCurrentDisplayMode = *const fn (displayID: SDL_DisplayID) callconv(.c) ?*const SDL_DisplayMode;
pub const PFN_SDL_GetFullscreenDisplayModes = *const fn (displayID: SDL_DisplayID, count: ?*c_int) callconv(.c) ?[*]?*SDL_DisplayMode;
pub const PFN_SDL_GetClosestFullscreenDisplayMode = *const fn (displayID: SDL_DisplayID, w: c_int, h: c_int, refresh_rate: f32, include_high_density_modes: bool, closest: ?*SDL_DisplayMode) callconv(.c) bool;
pub const PFN_SDL_GetDisplayForPoint = *const fn (point: ?*const SDL_Point) callconv(.c) SDL_DisplayID;
pub const PFN_SDL_GetDisplayForRect = *const fn (rect: ?*const SDL_Rect) callconv(.c) SDL_DisplayID;
pub const PFN_SDL_GetDisplayForWindow = *const fn (window: ?*SDL_Window) callconv(.c) SDL_DisplayID;
pub const PFN_SDL_GetWindowPixelDensity = *const fn (window: ?*SDL_Window) callconv(.c) f32;
pub const PFN_SDL_GetWindowDisplayScale = *const fn (window: ?*SDL_Window) callconv(.c) f32;
pub const PFN_SDL_SetWindowFullscreenMode = *const fn (window: ?*SDL_Window, mode: ?*const SDL_DisplayMode) callconv(.c) bool;
pub const PFN_SDL_GetWindowFullscreenMode = *const fn (window: ?*SDL_Window) callconv(.c) ?*const SDL_DisplayMode;
pub const PFN_SDL_GetWindowPixelFormat = *const fn (window: ?*SDL_Window) callconv(.c) c_uint;
pub const PFN_SDL_GetWindows = *const fn (count: ?*c_int) callconv(.c) ?[*]?*SDL_Window;
pub const PFN_SDL_CreateWindow = *const fn (title: ?[*:0]const u8, w: c_int, h: c_int, flags: SDL_WindowFlags) callconv(.c) ?*SDL_Window;
pub const PFN_SDL_DestroyWindow = *const fn (window: ?*SDL_Window) callconv(.c) void;
pub const PFN_SDL_GetWindowID = *const fn (window: ?*SDL_Window) callconv(.c) SDL_WindowID;
pub const PFN_SDL_GetWindowFromID = *const fn (id: SDL_WindowID) callconv(.c) ?*SDL_Window;
pub const PFN_SDL_GetWindowParent = *const fn (window: ?*SDL_Window) callconv(.c) ?*SDL_Window;
pub const PFN_SDL_GetWindowProperties = *const fn (window: ?*SDL_Window) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_GetWindowFlags = *const fn (window: ?*SDL_Window) callconv(.c) SDL_WindowFlags;
pub const PFN_SDL_SetWindowTitle = *const fn (window: ?*SDL_Window, title: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GetWindowTitle = *const fn (window: ?*SDL_Window) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_SetWindowIcon = *const fn (window: ?*SDL_Window, icon: ?*SDL_Surface) callconv(.c) bool;
pub const PFN_SDL_SetWindowPosition = *const fn (window: ?*SDL_Window, x: c_int, y: c_int) callconv(.c) bool;
pub const PFN_SDL_GetWindowPosition = *const fn (window: ?*SDL_Window, x: ?*c_int, y: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_SetWindowSize = *const fn (window: ?*SDL_Window, w: c_int, h: c_int) callconv(.c) bool;
pub const PFN_SDL_GetWindowSize = *const fn (window: ?*SDL_Window, w: ?*c_int, h: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_GetWindowBordersSize = *const fn (window: ?*SDL_Window, top: ?*c_int, left: ?*c_int, bottom: ?*c_int, right: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_GetWindowSizeInPixels = *const fn (window: ?*SDL_Window, w: ?*c_int, h: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_SetWindowMinimumSize = *const fn (window: ?*SDL_Window, min_w: c_int, min_h: c_int) callconv(.c) bool;
pub const PFN_SDL_GetWindowMinimumSize = *const fn (window: ?*SDL_Window, w: ?*c_int, h: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_SetWindowMaximumSize = *const fn (window: ?*SDL_Window, max_w: c_int, max_h: c_int) callconv(.c) bool;
pub const PFN_SDL_GetWindowMaximumSize = *const fn (window: ?*SDL_Window, w: ?*c_int, h: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_SetWindowBordered = *const fn (window: ?*SDL_Window, bordered: bool) callconv(.c) bool;
pub const PFN_SDL_SetWindowResizable = *const fn (window: ?*SDL_Window, resizable: bool) callconv(.c) bool;
pub const PFN_SDL_SetWindowAlwaysOnTop = *const fn (window: ?*SDL_Window, on_top: bool) callconv(.c) bool;
pub const PFN_SDL_ShowWindow = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_HideWindow = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_RaiseWindow = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_MaximizeWindow = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_MinimizeWindow = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_RestoreWindow = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_SetWindowFullscreen = *const fn (window: ?*SDL_Window, fullscreen: bool) callconv(.c) bool;
pub const PFN_SDL_WindowHasSurface = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_GetWindowSurface = *const fn (window: ?*SDL_Window) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_UpdateWindowSurface = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_UpdateWindowSurfaceRects = *const fn (window: ?*SDL_Window, rects: ?[*]const SDL_Rect, numrects: c_int) callconv(.c) bool;
pub const PFN_SDL_DestroyWindowSurface = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_SetWindowKeyboardGrab = *const fn (window: ?*SDL_Window, grabbed: bool) callconv(.c) bool;
pub const PFN_SDL_SetWindowMouseGrab = *const fn (window: ?*SDL_Window, grabbed: bool) callconv(.c) bool;
pub const PFN_SDL_GetWindowKeyboardGrab = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_GetWindowMouseGrab = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_SetWindowMouseRect = *const fn (window: ?*SDL_Window, rect: ?*const SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetWindowMouseRect = *const fn (window: ?*SDL_Window) callconv(.c) ?*const SDL_Rect;
pub const PFN_SDL_SetWindowOpacity = *const fn (window: ?*SDL_Window, opacity: f32) callconv(.c) bool;
pub const PFN_SDL_GetWindowOpacity = *const fn (window: ?*SDL_Window) callconv(.c) f32;
pub const PFN_SDL_SetWindowFocusable = *const fn (window: ?*SDL_Window, focusable: bool) callconv(.c) bool;
pub const PFN_SDL_ShowWindowSystemMenu = *const fn (window: ?*SDL_Window, x: c_int, y: c_int) callconv(.c) bool;
pub const PFN_SDL_SetWindowHitTest = *const fn (window: ?*SDL_Window, callback: SDL_HitTestCallback, callback_data: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_SetWindowShape = *const fn (window: ?*SDL_Window, shape: ?*SDL_Surface) callconv(.c) bool;
pub const PFN_SDL_SetWindowModal = *const fn (window: ?*SDL_Window, modal: bool) callconv(.c) bool;
pub const PFN_SDL_SetWindowProgressState = *const fn (window: ?*SDL_Window, state: SDL_ProgressState) callconv(.c) bool;
pub const PFN_SDL_GetWindowProgressState = *const fn (window: ?*SDL_Window) callconv(.c) SDL_ProgressState;
pub const PFN_SDL_SetWindowProgressValue = *const fn (window: ?*SDL_Window, value: f32) callconv(.c) bool;
pub const PFN_SDL_GetWindowProgressValue = *const fn (window: ?*SDL_Window) callconv(.c) f32;
pub const PFN_SDL_FlashWindow = *const fn (window: ?*SDL_Window, operation: SDL_FlashOperation) callconv(.c) bool;
pub const PFN_SDL_DisableScreenSaver = *const fn () callconv(.c) bool;
pub const PFN_SDL_EnableScreenSaver = *const fn () callconv(.c) bool;
pub const PFN_SDL_ScreenSaverEnabled = *const fn () callconv(.c) bool;
pub const PFN_SDL_GetWindowAspectRatio = *const fn (window: ?*SDL_Window, min_aspect: ?*f32, max_aspect: ?*f32) callconv(.c) bool;
pub const PFN_SDL_SetWindowAspectRatio = *const fn (window: ?*SDL_Window, min_aspect: f32, max_aspect: f32) callconv(.c) bool;
pub const PFN_SDL_CreatePopupWindow = *const fn (parent: ?*SDL_Window, offset_x: c_int, offset_y: c_int, w: c_int, h: c_int, flags: SDL_WindowFlags) callconv(.c) ?*SDL_Window;
pub const PFN_SDL_SetWindowParent = *const fn (window: ?*SDL_Window, parent: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_GetGrabbedWindow = *const fn () callconv(.c) ?*SDL_Window;
pub const PFN_SDL_GetWindowSafeArea = *const fn (window: ?*SDL_Window, rect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetWindowSurfaceVSync = *const fn (window: ?*SDL_Window, vsync: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_SetWindowSurfaceVSync = *const fn (window: ?*SDL_Window, vsync: c_int) callconv(.c) bool;
pub const PFN_SDL_SyncWindow = *const fn (window: ?*SDL_Window) callconv(.c) bool;

// GL/EGL functions
pub const PFN_SDL_GL_CreateContext = *const fn (window: ?*SDL_Window) callconv(.c) ?*SDL_GLContext;
pub const PFN_SDL_GL_DestroyContext = *const fn (context: ?*SDL_GLContext) callconv(.c) bool;
pub const PFN_SDL_GL_ExtensionSupported = *const fn (extension: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GL_GetAttribute = *const fn (attr: SDL_GLAttr, value: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_GL_GetCurrentContext = *const fn () callconv(.c) ?*SDL_GLContext;
pub const PFN_SDL_GL_GetCurrentWindow = *const fn () callconv(.c) ?*SDL_Window;
pub const PFN_SDL_GL_GetProcAddress = *const fn (proc: ?[*:0]const u8) callconv(.c) SDL_FunctionPointer;
pub const PFN_SDL_GL_GetSwapInterval = *const fn (interval: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_GL_LoadLibrary = *const fn (path: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GL_MakeCurrent = *const fn (window: ?*SDL_Window, context: ?*SDL_GLContext) callconv(.c) bool;
pub const PFN_SDL_GL_ResetAttributes = *const fn () callconv(.c) void;
pub const PFN_SDL_GL_SetAttribute = *const fn (attr: SDL_GLAttr, value: c_int) callconv(.c) bool;
pub const PFN_SDL_GL_SetSwapInterval = *const fn (interval: c_int) callconv(.c) bool;
pub const PFN_SDL_GL_SwapWindow = *const fn (window: ?*SDL_Window) callconv(.c) bool;
pub const PFN_SDL_GL_UnloadLibrary = *const fn () callconv(.c) void;
pub const PFN_SDL_EGL_GetCurrentConfig = *const fn () callconv(.c) SDL_EGLConfig;
pub const PFN_SDL_EGL_GetCurrentDisplay = *const fn () callconv(.c) SDL_EGLDisplay;
pub const PFN_SDL_EGL_GetProcAddress = *const fn (proc: ?[*:0]const u8) callconv(.c) SDL_FunctionPointer;
pub const PFN_SDL_EGL_GetWindowSurface = *const fn (window: ?*SDL_Window) callconv(.c) SDL_EGLSurface;
pub const PFN_SDL_EGL_SetAttributeCallbacks = *const fn (platform_attrib_callback: SDL_EGLAttribArrayCallback, surface_attrib_callback: SDL_EGLIntArrayCallback, context_attrib_callback: SDL_EGLAttribArrayCallback, userdata: ?*anyopaque) callconv(.c) void;

// Import types from pixels
pub const SDL_Point = pixels.SDL_Point;
pub const SDL_FPoint = pixels.SDL_FPoint;
pub const SDL_Rect = pixels.SDL_Rect;

pub const SDL_FRect = extern struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,
};

pub const SDL_Surface = opaque {};

pub const SDL_HitTestResult = enum(c_int) {
    SDL_HITTEST_NORMAL,
    SDL_HITTEST_DRAGGABLE,
    SDL_HITTEST_RESIZE_TOPLEFT,
    SDL_HITTEST_RESIZE_TOP,
    SDL_HITTEST_RESIZE_TOPRIGHT,
    SDL_HITTEST_RESIZE_RIGHT,
    SDL_HITTEST_RESIZE_BOTTOMRIGHT,
    SDL_HITTEST_RESIZE_BOTTOM,
    SDL_HITTEST_RESIZE_BOTTOMLEFT,
    SDL_HITTEST_RESIZE_LEFT,
};

pub const SDL_HitTestCallback = ?*const fn (?*SDL_Window, ?*const SDL_Point, ?*anyopaque) callconv(.c) SDL_HitTestResult;

pub const VideoFunctions = struct {
    getNumVideoDrivers: PFN_SDL_GetNumVideoDrivers,
    getVideoDriver: PFN_SDL_GetVideoDriver,
    getCurrentVideoDriver: PFN_SDL_GetCurrentVideoDriver,
    getSystemTheme: PFN_SDL_GetSystemTheme,
    getDisplays: PFN_SDL_GetDisplays,
    getPrimaryDisplay: PFN_SDL_GetPrimaryDisplay,
    getDisplayProperties: PFN_SDL_GetDisplayProperties,
    getDisplayName: PFN_SDL_GetDisplayName,
    getDisplayBounds: PFN_SDL_GetDisplayBounds,
    getDisplayUsableBounds: PFN_SDL_GetDisplayUsableBounds,
    getNaturalDisplayOrientation: PFN_SDL_GetNaturalDisplayOrientation,
    getCurrentDisplayOrientation: PFN_SDL_GetCurrentDisplayOrientation,
    getDisplayContentScale: PFN_SDL_GetDisplayContentScale,
    getDesktopDisplayMode: PFN_SDL_GetDesktopDisplayMode,
    getCurrentDisplayMode: PFN_SDL_GetCurrentDisplayMode,
    getFullscreenDisplayModes: PFN_SDL_GetFullscreenDisplayModes,
    getClosestFullscreenDisplayMode: PFN_SDL_GetClosestFullscreenDisplayMode,
    getDisplayForPoint: PFN_SDL_GetDisplayForPoint,
    getDisplayForRect: PFN_SDL_GetDisplayForRect,
    getDisplayForWindow: PFN_SDL_GetDisplayForWindow,
    getWindowPixelDensity: PFN_SDL_GetWindowPixelDensity,
    getWindowDisplayScale: PFN_SDL_GetWindowDisplayScale,
    setWindowFullscreenMode: PFN_SDL_SetWindowFullscreenMode,
    getWindowFullscreenMode: PFN_SDL_GetWindowFullscreenMode,
    getWindowPixelFormat: PFN_SDL_GetWindowPixelFormat,
    getWindows: PFN_SDL_GetWindows,
    createWindow: PFN_SDL_CreateWindow,
    destroyWindow: PFN_SDL_DestroyWindow,
    getWindowID: PFN_SDL_GetWindowID,
    getWindowFromID: PFN_SDL_GetWindowFromID,
    getWindowParent: PFN_SDL_GetWindowParent,
    getWindowProperties: PFN_SDL_GetWindowProperties,
    getWindowFlags: PFN_SDL_GetWindowFlags,
    setWindowTitle: PFN_SDL_SetWindowTitle,
    getWindowTitle: PFN_SDL_GetWindowTitle,
    setWindowIcon: PFN_SDL_SetWindowIcon,
    setWindowPosition: PFN_SDL_SetWindowPosition,
    getWindowPosition: PFN_SDL_GetWindowPosition,
    setWindowSize: PFN_SDL_SetWindowSize,
    getWindowSize: PFN_SDL_GetWindowSize,
    getWindowBordersSize: PFN_SDL_GetWindowBordersSize,
    getWindowSizeInPixels: PFN_SDL_GetWindowSizeInPixels,
    setWindowMinimumSize: PFN_SDL_SetWindowMinimumSize,
    getWindowMinimumSize: PFN_SDL_GetWindowMinimumSize,
    setWindowMaximumSize: PFN_SDL_SetWindowMaximumSize,
    getWindowMaximumSize: PFN_SDL_GetWindowMaximumSize,
    setWindowBordered: PFN_SDL_SetWindowBordered,
    setWindowResizable: PFN_SDL_SetWindowResizable,
    setWindowAlwaysOnTop: PFN_SDL_SetWindowAlwaysOnTop,
    showWindow: PFN_SDL_ShowWindow,
    hideWindow: PFN_SDL_HideWindow,
    raiseWindow: PFN_SDL_RaiseWindow,
    maximizeWindow: PFN_SDL_MaximizeWindow,
    minimizeWindow: PFN_SDL_MinimizeWindow,
    restoreWindow: PFN_SDL_RestoreWindow,
    setWindowFullscreen: PFN_SDL_SetWindowFullscreen,
    hasWindowSurface: PFN_SDL_WindowHasSurface,
    getWindowSurface: PFN_SDL_GetWindowSurface,
    updateWindowSurface: PFN_SDL_UpdateWindowSurface,
    updateWindowSurfaceRects: PFN_SDL_UpdateWindowSurfaceRects,
    destroyWindowSurface: PFN_SDL_DestroyWindowSurface,
    setWindowKeyboardGrab: PFN_SDL_SetWindowKeyboardGrab,
    setWindowMouseGrab: PFN_SDL_SetWindowMouseGrab,
    getWindowKeyboardGrab: PFN_SDL_GetWindowKeyboardGrab,
    getWindowMouseGrab: PFN_SDL_GetWindowMouseGrab,
    setWindowMouseRect: PFN_SDL_SetWindowMouseRect,
    getWindowMouseRect: PFN_SDL_GetWindowMouseRect,
    setWindowOpacity: PFN_SDL_SetWindowOpacity,
    getWindowOpacity: PFN_SDL_GetWindowOpacity,
    setWindowFocusable: PFN_SDL_SetWindowFocusable,
    showWindowSystemMenu: PFN_SDL_ShowWindowSystemMenu,
    setWindowHitTest: PFN_SDL_SetWindowHitTest,
    setWindowShape: PFN_SDL_SetWindowShape,
    setWindowModal: PFN_SDL_SetWindowModal,
    setWindowProgressState: PFN_SDL_SetWindowProgressState,
    getWindowProgressState: PFN_SDL_GetWindowProgressState,
    setWindowProgressValue: PFN_SDL_SetWindowProgressValue,
    getWindowProgressValue: PFN_SDL_GetWindowProgressValue,
    flashWindow: PFN_SDL_FlashWindow,
    disableScreenSaver: PFN_SDL_DisableScreenSaver,
    enableScreenSaver: PFN_SDL_EnableScreenSaver,
    isScreenSaverEnabled: PFN_SDL_ScreenSaverEnabled,
    getWindowAspectRatio: PFN_SDL_GetWindowAspectRatio,
    setWindowAspectRatio: PFN_SDL_SetWindowAspectRatio,
    createPopupWindow: PFN_SDL_CreatePopupWindow,
    setWindowParent: PFN_SDL_SetWindowParent,
    getGrabbedWindow: PFN_SDL_GetGrabbedWindow,
    getWindowSafeArea: PFN_SDL_GetWindowSafeArea,
    getWindowSurfaceVSync: PFN_SDL_GetWindowSurfaceVSync,
    setWindowSurfaceVSync: PFN_SDL_SetWindowSurfaceVSync,
    syncWindow: PFN_SDL_SyncWindow,
    glCreateContext: PFN_SDL_GL_CreateContext,
    glDestroyContext: PFN_SDL_GL_DestroyContext,
    glExtensionSupported: PFN_SDL_GL_ExtensionSupported,
    glGetAttribute: PFN_SDL_GL_GetAttribute,
    glGetCurrentContext: PFN_SDL_GL_GetCurrentContext,
    glGetCurrentWindow: PFN_SDL_GL_GetCurrentWindow,
    glGetProcAddress: PFN_SDL_GL_GetProcAddress,
    glGetSwapInterval: PFN_SDL_GL_GetSwapInterval,
    glLoadLibrary: PFN_SDL_GL_LoadLibrary,
    glMakeCurrent: PFN_SDL_GL_MakeCurrent,
    glResetAttributes: PFN_SDL_GL_ResetAttributes,
    glSetAttribute: PFN_SDL_GL_SetAttribute,
    glSetSwapInterval: PFN_SDL_GL_SetSwapInterval,
    glSwapWindow: PFN_SDL_GL_SwapWindow,
    glUnloadLibrary: PFN_SDL_GL_UnloadLibrary,
    eglGetCurrentConfig: PFN_SDL_EGL_GetCurrentConfig,
    eglGetCurrentDisplay: PFN_SDL_EGL_GetCurrentDisplay,
    eglGetProcAddress: PFN_SDL_EGL_GetProcAddress,
    eglGetWindowSurface: PFN_SDL_EGL_GetWindowSurface,
    eglSetAttributeCallbacks: PFN_SDL_EGL_SetAttributeCallbacks,

    pub fn load(handle: dynamic.LibraryHandle) !VideoFunctions {
        return dynamic.loadFunctions(VideoFunctions, handle, "SDL_", .{
            .{ "hasWindowSurface", "SDL_WindowHasSurface" },
            .{ "isScreenSaverEnabled", "SDL_ScreenSaverEnabled" },
            .{ "glCreateContext", "SDL_GL_CreateContext" },
            .{ "glDestroyContext", "SDL_GL_DestroyContext" },
            .{ "glExtensionSupported", "SDL_GL_ExtensionSupported" },
            .{ "glGetAttribute", "SDL_GL_GetAttribute" },
            .{ "glGetCurrentContext", "SDL_GL_GetCurrentContext" },
            .{ "glGetCurrentWindow", "SDL_GL_GetCurrentWindow" },
            .{ "glGetProcAddress", "SDL_GL_GetProcAddress" },
            .{ "glGetSwapInterval", "SDL_GL_GetSwapInterval" },
            .{ "glLoadLibrary", "SDL_GL_LoadLibrary" },
            .{ "glMakeCurrent", "SDL_GL_MakeCurrent" },
            .{ "glResetAttributes", "SDL_GL_ResetAttributes" },
            .{ "glSetAttribute", "SDL_GL_SetAttribute" },
            .{ "glSetSwapInterval", "SDL_GL_SetSwapInterval" },
            .{ "glSwapWindow", "SDL_GL_SwapWindow" },
            .{ "glUnloadLibrary", "SDL_GL_UnloadLibrary" },
            .{ "eglGetProcAddress", "SDL_EGL_GetProcAddress" },
            .{ "eglGetCurrentDisplay", "SDL_EGL_GetCurrentDisplay" },
            .{ "eglGetCurrentConfig", "SDL_EGL_GetCurrentConfig" },
            .{ "eglGetWindowSurface", "SDL_EGL_GetWindowSurface" },
            .{ "eglSetAttributeCallbacks", "SDL_EGL_SetAttributeCallbacks" },
        }, &.{});
    }
};
