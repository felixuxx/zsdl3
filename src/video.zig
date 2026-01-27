// SDL3 Video Bindings
// Window management, display handling

const core = @import("core.zig");
const pixels = @import("pixels.zig");

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
pub const SDL_GLContext = opaque {};
pub const SDL_EGLDisplay = ?*anyopaque;
pub const SDL_EGLConfig = ?*anyopaque;
pub const SDL_EGLSurface = ?*anyopaque;

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

// Video extern functions
extern fn SDL_GetNumVideoDrivers() c_int;
extern fn SDL_GetVideoDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetCurrentVideoDriver() ?[*:0]const u8;
extern fn SDL_GetSystemTheme() SDL_SystemTheme;
extern fn SDL_GetDisplays(count: ?*c_int) ?[*]SDL_DisplayID;
extern fn SDL_GetPrimaryDisplay() SDL_DisplayID;
extern fn SDL_GetDisplayName(displayID: SDL_DisplayID) ?[*:0]const u8;
extern fn SDL_GetDisplayBounds(displayID: SDL_DisplayID, rect: ?*SDL_Rect) bool;
extern fn SDL_GetDisplayUsableBounds(displayID: SDL_DisplayID, rect: ?*SDL_Rect) bool;
extern fn SDL_GetNaturalDisplayOrientation(displayID: SDL_DisplayID) SDL_DisplayOrientation;
extern fn SDL_GetCurrentDisplayOrientation(displayID: SDL_DisplayID) SDL_DisplayOrientation;
extern fn SDL_GetDisplayContentScale(displayID: SDL_DisplayID) f32;
extern fn SDL_GetDesktopDisplayMode(displayID: SDL_DisplayID) ?*const SDL_DisplayMode;
extern fn SDL_GetCurrentDisplayMode(displayID: SDL_DisplayID) ?*const SDL_DisplayMode;
extern fn SDL_GetFullscreenDisplayModes(displayID: SDL_DisplayID, count: ?*c_int) ?[*]?*SDL_DisplayMode;
extern fn SDL_GetClosestFullscreenDisplayMode(displayID: SDL_DisplayID, w: c_int, h: c_int, refresh_rate: f32, include_high_density_modes: bool, closest: ?*SDL_DisplayMode) bool;
extern fn SDL_GetDisplayForPoint(point: ?*const SDL_Point) SDL_DisplayID;
extern fn SDL_GetDisplayForRect(rect: ?*const SDL_Rect) SDL_DisplayID;
extern fn SDL_GetDisplayForWindow(window: ?*SDL_Window) SDL_DisplayID;
extern fn SDL_GetWindowPixelDensity(window: ?*SDL_Window) f32;
extern fn SDL_GetWindowDisplayScale(window: ?*SDL_Window) f32;
extern fn SDL_SetWindowFullscreenMode(window: ?*SDL_Window, mode: ?*const SDL_DisplayMode) bool;
extern fn SDL_GetWindowFullscreenMode(window: ?*SDL_Window) ?*const SDL_DisplayMode;
extern fn SDL_GetWindowPixelFormat(window: ?*SDL_Window) c_uint;
extern fn SDL_GetWindows(count: ?*c_int) ?[*]?*SDL_Window;
extern fn SDL_CreateWindow(title: ?[*:0]const u8, w: c_int, h: c_int, flags: SDL_WindowFlags) ?*SDL_Window;
extern fn SDL_DestroyWindow(window: ?*SDL_Window) void;
extern fn SDL_GetWindowID(window: ?*SDL_Window) SDL_WindowID;
extern fn SDL_GetWindowFromID(id: SDL_WindowID) ?*SDL_Window;
extern fn SDL_GetWindowParent(window: ?*SDL_Window) ?*SDL_Window;
extern fn SDL_GetWindowProperties(window: ?*SDL_Window) core.SDL_PropertiesID;
extern fn SDL_GetWindowFlags(window: ?*SDL_Window) SDL_WindowFlags;
extern fn SDL_SetWindowTitle(window: ?*SDL_Window, title: ?[*:0]const u8) bool;
extern fn SDL_GetWindowTitle(window: ?*SDL_Window) ?[*:0]const u8;
extern fn SDL_SetWindowIcon(window: ?*SDL_Window, icon: ?*SDL_Surface) void;
extern fn SDL_SetWindowPosition(window: ?*SDL_Window, x: c_int, y: c_int) bool;
extern fn SDL_GetWindowPosition(window: ?*SDL_Window, x: ?*c_int, y: ?*c_int) bool;
extern fn SDL_SetWindowSize(window: ?*SDL_Window, w: c_int, h: c_int) bool;
extern fn SDL_GetWindowSize(window: ?*SDL_Window, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_GetWindowBordersSize(window: ?*SDL_Window, top: ?*c_int, left: ?*c_int, bottom: ?*c_int, right: ?*c_int) bool;
extern fn SDL_GetWindowSizeInPixels(window: ?*SDL_Window, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_SetWindowMinimumSize(window: ?*SDL_Window, min_w: c_int, min_h: c_int) bool;
extern fn SDL_GetWindowMinimumSize(window: ?*SDL_Window, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_SetWindowMaximumSize(window: ?*SDL_Window, max_w: c_int, max_h: c_int) bool;
extern fn SDL_GetWindowMaximumSize(window: ?*SDL_Window, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_SetWindowBordered(window: ?*SDL_Window, bordered: bool) bool;
extern fn SDL_SetWindowResizable(window: ?*SDL_Window, resizable: bool) bool;
extern fn SDL_SetWindowAlwaysOnTop(window: ?*SDL_Window, on_top: bool) bool;
extern fn SDL_ShowWindow(window: ?*SDL_Window) bool;
extern fn SDL_HideWindow(window: ?*SDL_Window) bool;
extern fn SDL_RaiseWindow(window: ?*SDL_Window) bool;
extern fn SDL_MaximizeWindow(window: ?*SDL_Window) bool;
extern fn SDL_MinimizeWindow(window: ?*SDL_Window) bool;
extern fn SDL_RestoreWindow(window: ?*SDL_Window) bool;
extern fn SDL_SetWindowFullscreen(window: ?*SDL_Window, fullscreen: bool) bool;
extern fn SDL_HasWindowSurface(window: ?*SDL_Window) bool;
extern fn SDL_GetWindowSurface(window: ?*SDL_Window) ?*SDL_Surface;
extern fn SDL_UpdateWindowSurface(window: ?*SDL_Window) bool;
extern fn SDL_UpdateWindowSurfaceRects(window: ?*SDL_Window, rects: ?[*]const SDL_Rect, numrects: c_int) bool;
extern fn SDL_DestroyWindowSurface(window: ?*SDL_Window) bool;
extern fn SDL_SetWindowGrab(window: ?*SDL_Window, grabbed: bool) bool;
extern fn SDL_SetWindowKeyboardGrab(window: ?*SDL_Window, grabbed: bool) bool;
extern fn SDL_SetWindowMouseGrab(window: ?*SDL_Window, grabbed: bool) bool;
extern fn SDL_GetWindowGrab(window: ?*SDL_Window) bool;
extern fn SDL_GetWindowKeyboardGrab(window: ?*SDL_Window) bool;
extern fn SDL_GetWindowMouseGrab(window: ?*SDL_Window) bool;
extern fn SDL_SetWindowMouseRect(window: ?*SDL_Window, rect: ?*const SDL_FRect) bool;
extern fn SDL_GetWindowMouseRect(window: ?*SDL_Window) ?*const SDL_FRect;
extern fn SDL_SetWindowOpacity(window: ?*SDL_Window, opacity: f32) bool;
extern fn SDL_GetWindowOpacity(window: ?*SDL_Window) f32;
extern fn SDL_SetWindowModalFor(window: ?*SDL_Window, parent_window: ?*SDL_Window) bool;
extern fn SDL_SetWindowFocusable(window: ?*SDL_Window, focusable: bool) bool;
extern fn SDL_ShowWindowSystemMenu(window: ?*SDL_Window, x: c_int, y: c_int) bool;
extern fn SDL_SetWindowHitTest(window: ?*SDL_Window, callback: SDL_HitTestCallback, callback_data: ?*anyopaque) bool;
extern fn SDL_SetWindowShape(window: ?*SDL_Window, shape: ?*SDL_Surface) bool;
extern fn SDL_FlashWindow(window: ?*SDL_Window, operation: SDL_FlashOperation) bool;
extern fn SDL_SetWindowGammaRamp(window: ?*SDL_Window, red: ?[*]const u16, green: ?[*]const u16, blue: ?[*]const u16) bool;
extern fn SDL_GetWindowGammaRamp(window: ?*SDL_Window, red: ?[*]u16, green: ?[*]u16, blue: ?[*]u16) bool;
extern fn SDL_DisableScreenSaver() bool;
extern fn SDL_EnableScreenSaver() bool;
extern fn SDL_IsScreenSaverEnabled() bool;
extern fn SDL_GetWindowWMInfo(window: ?*SDL_Window, info: ?*SDL_SysWMinfo, version: SDL_Version) bool;

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

pub const SDL_Version = extern struct {
    major: u8,
    minor: u8,
    patch: u8,
};

pub const SDL_SysWMinfo = extern struct {
    version: SDL_Version,
    subsystem: SDL_SysWMType,
    info: extern union {
        win: struct {
            window: ?*anyopaque,
            hdc: ?*anyopaque,
            hinstance: ?*anyopaque,
        },
        x11: struct {
            display: ?*anyopaque,
            window: c_ulong,
        },
        // Add other platforms as needed
        dummy: [64]u8, // Fallback
    },
};

pub const SDL_SysWMType = enum(c_int) {
    SDL_SYSWM_UNKNOWN,
    SDL_SYSWM_WINDOWS,
    SDL_SYSWM_X11,
    SDL_SYSWM_DIRECTFB,
    SDL_SYSWM_COCOA,
    SDL_SYSWM_UIKIT,
    SDL_SYSWM_WAYLAND,
    SDL_SYSWM_MIR,
    SDL_SYSWM_WINRT,
    SDL_SYSWM_ANDROID,
    SDL_SYSWM_VIVANTE,
    SDL_SYSWM_OS2,
    SDL_SYSWM_HAIKU,
    SDL_SYSWM_KMSDRM,
    SDL_SYSWM_RISCOS,
};

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

pub const SDL_HitTestCallback = ?*const fn (?*anyopaque, ?*SDL_Window, ?*SDL_Point, ?*anyopaque) callconv(.C) SDL_HitTestResult;

// Public video API
pub const getNumVideoDrivers = SDL_GetNumVideoDrivers;
pub const getVideoDriver = SDL_GetVideoDriver;
pub const getCurrentVideoDriver = SDL_GetCurrentVideoDriver;
pub const getSystemTheme = SDL_GetSystemTheme;
pub const getDisplays = SDL_GetDisplays;
pub const getPrimaryDisplay = SDL_GetPrimaryDisplay;
pub const getDisplayName = SDL_GetDisplayName;
pub const getDisplayBounds = SDL_GetDisplayBounds;
pub const getDisplayUsableBounds = SDL_GetDisplayUsableBounds;
pub const getNaturalDisplayOrientation = SDL_GetNaturalDisplayOrientation;
pub const getCurrentDisplayOrientation = SDL_GetCurrentDisplayOrientation;
pub const getDisplayContentScale = SDL_GetDisplayContentScale;
pub const getDesktopDisplayMode = SDL_GetDesktopDisplayMode;
pub const getCurrentDisplayMode = SDL_GetCurrentDisplayMode;
pub const getFullscreenDisplayModes = SDL_GetFullscreenDisplayModes;
pub const getClosestFullscreenDisplayMode = SDL_GetClosestFullscreenDisplayMode;
pub const getDisplayForPoint = SDL_GetDisplayForPoint;
pub const getDisplayForRect = SDL_GetDisplayForRect;
pub const getDisplayForWindow = SDL_GetDisplayForWindow;
pub const getWindowPixelDensity = SDL_GetWindowPixelDensity;
pub const getWindowDisplayScale = SDL_GetWindowDisplayScale;
pub const setWindowFullscreenMode = SDL_SetWindowFullscreenMode;
pub const getWindowFullscreenMode = SDL_GetWindowFullscreenMode;
pub const getWindowPixelFormat = SDL_GetWindowPixelFormat;
pub const getWindows = SDL_GetWindows;
pub const createWindow = SDL_CreateWindow;
pub const destroyWindow = SDL_DestroyWindow;
pub const getWindowID = SDL_GetWindowID;
pub const getWindowFromID = SDL_GetWindowFromID;
pub const getWindowParent = SDL_GetWindowParent;
pub const getWindowProperties = SDL_GetWindowProperties;
pub const getWindowFlags = SDL_GetWindowFlags;
pub const setWindowTitle = SDL_SetWindowTitle;
pub const getWindowTitle = SDL_GetWindowTitle;
pub const setWindowIcon = SDL_SetWindowIcon;
pub const setWindowPosition = SDL_SetWindowPosition;
pub const getWindowPosition = SDL_GetWindowPosition;
pub const setWindowSize = SDL_SetWindowSize;
pub const getWindowSize = SDL_GetWindowSize;
pub const getWindowBordersSize = SDL_GetWindowBordersSize;
pub const getWindowSizeInPixels = SDL_GetWindowSizeInPixels;
pub const setWindowMinimumSize = SDL_SetWindowMinimumSize;
pub const getWindowMinimumSize = SDL_GetWindowMinimumSize;
pub const setWindowMaximumSize = SDL_SetWindowMaximumSize;
pub const getWindowMaximumSize = SDL_GetWindowMaximumSize;
pub const setWindowBordered = SDL_SetWindowBordered;
pub const setWindowResizable = SDL_SetWindowResizable;
pub const setWindowAlwaysOnTop = SDL_SetWindowAlwaysOnTop;
pub const showWindow = SDL_ShowWindow;
pub const hideWindow = SDL_HideWindow;
pub const raiseWindow = SDL_RaiseWindow;
pub const maximizeWindow = SDL_MaximizeWindow;
pub const minimizeWindow = SDL_MinimizeWindow;
pub const restoreWindow = SDL_RestoreWindow;
pub const setWindowFullscreen = SDL_SetWindowFullscreen;
pub const hasWindowSurface = SDL_HasWindowSurface;
pub const getWindowSurface = SDL_GetWindowSurface;
pub const updateWindowSurface = SDL_UpdateWindowSurface;
pub const updateWindowSurfaceRects = SDL_UpdateWindowSurfaceRects;
pub const destroyWindowSurface = SDL_DestroyWindowSurface;
pub const setWindowGrab = SDL_SetWindowGrab;
pub const setWindowKeyboardGrab = SDL_SetWindowKeyboardGrab;
pub const setWindowMouseGrab = SDL_SetWindowMouseGrab;
pub const getWindowGrab = SDL_GetWindowGrab;
pub const getWindowKeyboardGrab = SDL_GetWindowKeyboardGrab;
pub const getWindowMouseGrab = SDL_GetWindowMouseGrab;
pub const setWindowMouseRect = SDL_SetWindowMouseRect;
pub const getWindowMouseRect = SDL_GetWindowMouseRect;
pub const setWindowOpacity = SDL_SetWindowOpacity;
pub const getWindowOpacity = SDL_GetWindowOpacity;
pub const setWindowModalFor = SDL_SetWindowModalFor;
pub const setWindowFocusable = SDL_SetWindowFocusable;
pub const showWindowSystemMenu = SDL_ShowWindowSystemMenu;
pub const setWindowHitTest = SDL_SetWindowHitTest;
pub const setWindowShape = SDL_SetWindowShape;
pub const flashWindow = SDL_FlashWindow;
pub const setWindowGammaRamp = SDL_SetWindowGammaRamp;
pub const getWindowGammaRamp = SDL_GetWindowGammaRamp;
pub const disableScreenSaver = SDL_DisableScreenSaver;
pub const enableScreenSaver = SDL_EnableScreenSaver;
pub const isScreenSaverEnabled = SDL_IsScreenSaverEnabled;
pub const getWindowWMInfo = SDL_GetWindowWMInfo;
