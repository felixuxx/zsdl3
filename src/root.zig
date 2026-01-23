// SDL3 Zig Bindings
// This module provides Zig bindings for SDL3 without using @cImport

// Basic types
pub const Sint8 = i8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;

// Initialization flags
pub const SDL_InitFlags = Uint32;
pub const SDL_INIT_AUDIO: SDL_InitFlags = 0x00000010;
pub const SDL_INIT_VIDEO: SDL_InitFlags = 0x00000020;
pub const SDL_INIT_JOYSTICK: SDL_InitFlags = 0x00000200;
pub const SDL_INIT_HAPTIC: SDL_InitFlags = 0x00001000;
pub const SDL_INIT_GAMEPAD: SDL_InitFlags = 0x00002000;
pub const SDL_INIT_EVENTS: SDL_InitFlags = 0x00004000;
pub const SDL_INIT_SENSOR: SDL_InitFlags = 0x00008000;
pub const SDL_INIT_CAMERA: SDL_InitFlags = 0x00010000;

// App result enum
pub const SDL_AppResult = enum(c_int) {
    SDL_APP_CONTINUE = 0,
    SDL_APP_SUCCESS = 1,
    SDL_APP_FAILURE = 2,
};

// Function pointers for app callbacks
pub const SDL_AppInit_func = ?*const fn (?*anyopaque, c_int, ?[*]?[*:0]u8) callconv(.C) SDL_AppResult;
pub const SDL_AppIterate_func = ?*const fn (?*anyopaque) callconv(.C) SDL_AppResult;
pub const SDL_AppEvent_func = ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) SDL_AppResult;
pub const SDL_AppQuit_func = ?*const fn (?*anyopaque, SDL_AppResult) callconv(.C) void;

// Main thread callback
pub const SDL_MainThreadCallback = ?*const fn (?*anyopaque) callconv(.C) void;

// Extern functions
extern fn SDL_Init(flags: SDL_InitFlags) bool;
extern fn SDL_InitSubSystem(flags: SDL_InitFlags) bool;
extern fn SDL_QuitSubSystem(flags: SDL_InitFlags) void;
extern fn SDL_WasInit(flags: SDL_InitFlags) SDL_InitFlags;
extern fn SDL_Quit() void;
extern fn SDL_IsMainThread() bool;
extern fn SDL_RunOnMainThread(callback: SDL_MainThreadCallback, userdata: ?*anyopaque, wait_complete: bool) bool;
extern fn SDL_SetAppMetadata(appname: ?[*:0]const u8, appversion: ?[*:0]const u8, appidentifier: ?[*:0]const u8) bool;
extern fn SDL_SetAppMetadataProperty(name: [*:0]const u8, value: ?[*:0]const u8) bool;
extern fn SDL_GetAppMetadataProperty(name: [*:0]const u8) ?[*:0]const u8;
extern fn SDL_GetError() ?[*:0]const u8;
extern fn SDL_ClearError() void;
extern fn SDL_SetError(fmt: [*:0]const u8, ...) bool;

// Version
pub const SDL_Version = extern struct {
    major: Uint8,
    minor: Uint8,
    patch: Uint8,
};

extern fn SDL_GetVersion() SDL_Version;
extern fn SDL_GetRevision() ?[*:0]const u8;

// Public API
pub const init = SDL_Init;
pub const initSubSystem = SDL_InitSubSystem;
pub const quitSubSystem = SDL_QuitSubSystem;
pub const wasInit = SDL_WasInit;
pub const quit = SDL_Quit;
pub const isMainThread = SDL_IsMainThread;
pub const runOnMainThread = SDL_RunOnMainThread;
pub const setAppMetadata = SDL_SetAppMetadata;
pub const setAppMetadataProperty = SDL_SetAppMetadataProperty;
pub const getAppMetadataProperty = SDL_GetAppMetadataProperty;
pub const getError = SDL_GetError;
pub const clearError = SDL_ClearError;
pub const setError = SDL_SetError;
pub const getVersion = SDL_GetVersion;
pub const getRevision = SDL_GetRevision;

// Event types
pub const SDL_EventType = c_uint;
pub const SDL_EVENT_FIRST = 0;
pub const SDL_EVENT_QUIT = 0x100;
pub const SDL_EVENT_KEY_DOWN = 0x300;
pub const SDL_EVENT_KEY_UP = 0x301;
pub const SDL_EVENT_MOUSE_MOTION = 0x400;
pub const SDL_EVENT_MOUSE_BUTTON_DOWN = 0x401;
pub const SDL_EVENT_MOUSE_BUTTON_UP = 0x402;
pub const SDL_EVENT_MOUSE_WHEEL = 0x403;

// Common event data
pub const SDL_CommonEvent = extern struct {
    type: SDL_EventType,
    reserved: Uint32,
    timestamp: Uint64,
};

// Quit event
pub const SDL_QuitEvent = extern struct {
    type: SDL_EventType,
    reserved: Uint32,
    timestamp: Uint64,
};

// Placeholder for keyboard, mouse events - full structs later
pub const SDL_KeyboardEvent = extern struct {
    type: SDL_EventType,
    reserved: Uint32,
    timestamp: Uint64,
    windowID: SDL_WindowID,
    // ... other fields
    down: bool,
};

pub const SDL_MouseMotionEvent = extern struct {
    type: SDL_EventType,
    reserved: Uint32,
    timestamp: Uint64,
    windowID: SDL_WindowID,
    // ... other fields
    x: f32,
    y: f32,
};

// SDL_Event union
pub const SDL_Event = extern union {
    type: SDL_EventType,
    common: SDL_CommonEvent,
    quit: SDL_QuitEvent,
    key: SDL_KeyboardEvent,
    motion: SDL_MouseMotionEvent,
    // padding for ABI
    padding: [128]Uint8,
};

// Video types
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const SDL_WindowFlags = Uint64;
pub const SDL_SystemTheme = enum(c_int) {
    SDL_SYSTEM_THEME_UNKNOWN,
    SDL_SYSTEM_THEME_LIGHT,
    SDL_SYSTEM_THEME_DARK,
};
pub const SDL_DisplayOrientation = enum(c_int) {
    SDL_ORIENTATION_UNKNOWN,
    SDL_ORIENTATION_LANDSCAPE,
    SDL_ORIENTATION_LANDSCAPE_FLIPPED,
    SDL_ORIENTATION_PORTRAIT,
    SDL_ORIENTATION_PORTRAIT_FLIPPED,
};
pub const SDL_FlashOperation = enum(c_int) {
    SDL_FLASH_CANCEL,
    SDL_FLASH_BRIEFLY,
    SDL_FLASH_UNTIL_FOCUSED,
};
pub const SDL_ProgressState = enum(c_int) {
    SDL_PROGRESS_STATE_INVALID = -1,
    SDL_PROGRESS_STATE_NONE,
    SDL_PROGRESS_STATE_INDETERMINATE,
    SDL_PROGRESS_STATE_NORMAL,
    SDL_PROGRESS_STATE_PAUSED,
    SDL_PROGRESS_STATE_ERROR,
};

// Window flags
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
pub const SDL_WINDOW_VULKAN: SDL_WindowFlags = 0x0000000010000000;
pub const SDL_WINDOW_METAL: SDL_WindowFlags = 0x0000000020000000;
pub const SDL_WINDOW_TRANSPARENT: SDL_WindowFlags = 0x0000000040000000;
pub const SDL_WINDOW_NOT_FOCUSABLE: SDL_WindowFlags = 0x0000000080000000;

// Window position macros (simplified)
pub const SDL_WINDOWPOS_UNDEFINED: c_int = 0x1FFF0000;
pub const SDL_WINDOWPOS_CENTERED: c_int = 0x2FFF0000;

// Opaque structs
pub const SDL_Window = opaque {};
pub const SDL_GLContext = opaque {};
pub const SDL_EGLDisplay = ?*anyopaque;
pub const SDL_EGLConfig = ?*anyopaque;
pub const SDL_EGLSurface = ?*anyopaque;

// Display mode struct
pub const SDL_DisplayMode = extern struct {
    displayID: SDL_DisplayID,
    format: SDL_PixelFormat,
    w: c_int,
    h: c_int,
    pixel_density: f32,
    refresh_rate: f32,
    refresh_rate_numerator: c_int,
    refresh_rate_denominator: c_int,
    internal: ?*anyopaque,
};

// Placeholder for SDL_Rect - will be defined in rect module
// Point and Rect
pub const SDL_Point = extern struct {
    x: c_int,
    y: c_int,
};

pub const SDL_FPoint = extern struct {
    x: f32,
    y: f32,
};

pub const SDL_Rect = extern struct {
    x: c_int,
    y: c_int,
    w: c_int,
    h: c_int,
};

pub const SDL_FRect = extern struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,
};

// Pixel format
pub const SDL_PixelFormat = c_uint;

// Key pixel formats
pub const SDL_PIXELFORMAT_UNKNOWN = 0;
pub const SDL_PIXELFORMAT_RGBA8888 = 0x16462004;
pub const SDL_PIXELFORMAT_ARGB8888 = 0x16362004;
pub const SDL_PIXELFORMAT_ABGR8888 = 0x16762004;
pub const SDL_PIXELFORMAT_BGRA8888 = 0x16862004;
pub const SDL_PIXELFORMAT_RGB565 = 0x15151002;

// Color
pub const SDL_Color = extern struct {
    r: Uint8,
    g: Uint8,
    b: Uint8,
    a: Uint8,
};

// Palette
pub const SDL_Palette = extern struct {
    ncolors: c_int,
    colors: ?[*]SDL_Color,
    version: Uint32,
    refcount: c_int,
};

// Blend modes
pub const SDL_BlendMode = Uint32;
pub const SDL_BLENDMODE_NONE = 0x00000000;
pub const SDL_BLENDMODE_BLEND = 0x00000001;
pub const SDL_BLENDMODE_BLEND_PREMULTIPLIED = 0x00000010;
pub const SDL_BLENDMODE_ADD = 0x00000002;
pub const SDL_BLENDMODE_ADD_PREMULTIPLIED = 0x00000020;
pub const SDL_BLENDMODE_MOD = 0x00000004;
pub const SDL_BLENDMODE_MUL = 0x00000008;
pub const SDL_BLENDMODE_INVALID = 0x7FFFFFFF;

pub const SDL_BlendOperation = enum(c_int) {
    SDL_BLENDOPERATION_ADD = 0x1,
    SDL_BLENDOPERATION_SUBTRACT = 0x2,
    SDL_BLENDOPERATION_REV_SUBTRACT = 0x3,
    SDL_BLENDOPERATION_MINIMUM = 0x4,
    SDL_BLENDOPERATION_MAXIMUM = 0x5,
};

pub const SDL_BlendFactor = enum(c_int) {
    SDL_BLENDFACTOR_ZERO = 0x1,
    SDL_BLENDFACTOR_ONE = 0x2,
    SDL_BLENDFACTOR_SRC_COLOR = 0x3,
    SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR = 0x4,
    SDL_BLENDFACTOR_SRC_ALPHA = 0x5,
    SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 0x6,
    SDL_BLENDFACTOR_DST_COLOR = 0x7,
    SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR = 0x8,
    SDL_BLENDFACTOR_DST_ALPHA = 0x9,
    SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA = 0xA,
};

// Rect functions (inline in C, implemented in Zig)
pub fn SDL_PointInRect(p: ?*const SDL_Point, r: ?*const SDL_Rect) bool {
    return if (p != null and r != null and p.?.x >= r.?.x and p.?.x < r.?.x + r.?.w and p.?.y >= r.?.y and p.?.y < r.?.y + r.?.h) true else false;
}

pub fn SDL_RectEmpty(r: ?*const SDL_Rect) bool {
    return (r == null or r.?.w <= 0 or r.?.h <= 0);
}

// Pixel functions
extern fn SDL_GetPixelFormatName(format: SDL_PixelFormat) ?[*:0]const u8;
extern fn SDL_GetMasksForPixelFormat(format: SDL_PixelFormat, bpp: ?*c_int, Rmask: ?*Uint32, Gmask: ?*Uint32, Bmask: ?*Uint32, Amask: ?*Uint32) bool;
pub const getPixelFormatName = SDL_GetPixelFormatName;
pub const getMasksForPixelFormat = SDL_GetMasksForPixelFormat;

// Blend mode function
extern fn SDL_ComposeCustomBlendMode(srcColorFactor: SDL_BlendFactor, dstColorFactor: SDL_BlendFactor, colorOperation: SDL_BlendOperation, srcAlphaFactor: SDL_BlendFactor, dstAlphaFactor: SDL_BlendFactor, alphaOperation: SDL_BlendOperation) SDL_BlendMode;
pub const composeCustomBlendMode = SDL_ComposeCustomBlendMode;

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
extern fn SDL_GetDisplayForPoint(point: ?*const SDL_Point) SDL_DisplayID;
extern fn SDL_GetDisplayForRect(rect: ?*const SDL_Rect) SDL_DisplayID;
extern fn SDL_GetDisplayForWindow(window: ?*SDL_Window) SDL_DisplayID;
extern fn SDL_GetWindowPixelDensity(window: ?*SDL_Window) f32;
extern fn SDL_GetWindowDisplayScale(window: ?*SDL_Window) f32;
extern fn SDL_SetWindowFullscreenMode(window: ?*SDL_Window, mode: ?*const SDL_DisplayMode) bool;
extern fn SDL_GetWindowFullscreenMode(window: ?*SDL_Window) ?*const SDL_DisplayMode;
extern fn SDL_GetWindowPixelFormat(window: ?*SDL_Window) SDL_PixelFormat;
extern fn SDL_GetWindows(count: ?*c_int) ?[*]?*SDL_Window;
extern fn SDL_CreateWindow(title: ?[*:0]const u8, w: c_int, h: c_int, flags: SDL_WindowFlags) ?*SDL_Window;
extern fn SDL_DestroyWindow(window: ?*SDL_Window) void;
extern fn SDL_GetWindowID(window: ?*SDL_Window) SDL_WindowID;
extern fn SDL_GetWindowFromID(id: SDL_WindowID) ?*SDL_Window;
extern fn SDL_GetWindowParent(window: ?*SDL_Window) ?*SDL_Window;
extern fn SDL_GetWindowProperties(window: ?*SDL_Window) SDL_PropertiesID;
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
extern fn SDL_SetWindowMouseRect(window: ?*SDL_Window, rect: ?*const SDL_Rect) bool;
extern fn SDL_GetWindowMouseRect(window: ?*SDL_Window) ?*const SDL_Rect;
extern fn SDL_SetWindowOpacity(window: ?*SDL_Window, opacity: f32) bool;
extern fn SDL_GetWindowOpacity(window: ?*SDL_Window) f32;
extern fn SDL_SetWindowModalFor(window: ?*SDL_Window, parent_window: ?*SDL_Window) bool;
extern fn SDL_SetWindowFocusable(window: ?*SDL_Window, focusable: bool) bool;
extern fn SDL_ShowWindowSystemMenu(window: ?*SDL_Window, x: c_int, y: c_int) bool;
extern fn SDL_SetWindowHitTest(window: ?*SDL_Window, callback: ?*anyopaque, callback_data: ?*anyopaque) bool;
extern fn SDL_SetWindowShape(window: ?*SDL_Window, shape: ?*SDL_Surface) bool;
extern fn SDL_FlashWindow(window: ?*SDL_Window, operation: SDL_FlashOperation) bool;

// Placeholder for SDL_Surface
pub const SDL_Surface = opaque {};

// Placeholder for SDL_PropertiesID
pub const SDL_PropertiesID = Uint32;

// Keyboard
pub const SDL_KeyboardID = Uint32;

// Placeholder for keymod, keycode, scancode
pub const SDL_Keymod = c_int;
pub const SDL_Keycode = c_int;
pub const SDL_Scancode = c_int;

// Keyboard functions
extern fn SDL_HasKeyboard() bool;
extern fn SDL_GetKeyboardState(numkeys: ?*c_int) ?[*]const bool;
extern fn SDL_GetModState() SDL_Keymod;
extern fn SDL_SetModState(modstate: SDL_Keymod) void;
pub const hasKeyboard = SDL_HasKeyboard;
pub const getKeyboardState = SDL_GetKeyboardState;
pub const getModState = SDL_GetModState;
pub const setModState = SDL_SetModState;

// Mouse
pub const SDL_MouseID = Uint32;
pub const SDL_Cursor = opaque {};
pub const SDL_SystemCursor = enum(c_int) {
    SDL_SYSTEM_CURSOR_DEFAULT,
    SDL_SYSTEM_CURSOR_TEXT,
    SDL_SYSTEM_CURSOR_WAIT,
    SDL_SYSTEM_CURSOR_CROSSHAIR,
    SDL_SYSTEM_CURSOR_PROGRESS,
    SDL_SYSTEM_CURSOR_NWSE_RESIZE,
    SDL_SYSTEM_CURSOR_NESW_RESIZE,
    SDL_SYSTEM_CURSOR_EW_RESIZE,
    SDL_SYSTEM_CURSOR_NS_RESIZE,
    SDL_SYSTEM_CURSOR_MOVE,
    SDL_SYSTEM_CURSOR_NOT_ALLOWED,
    SDL_SYSTEM_CURSOR_POINTER,
    SDL_SYSTEM_CURSOR_NW_RESIZE,
    SDL_SYSTEM_CURSOR_N_RESIZE,
    SDL_SYSTEM_CURSOR_NE_RESIZE,
    SDL_SYSTEM_CURSOR_E_RESIZE,
    SDL_SYSTEM_CURSOR_SE_RESIZE,
    SDL_SYSTEM_CURSOR_S_RESIZE,
    SDL_SYSTEM_CURSOR_SW_RESIZE,
    SDL_SYSTEM_CURSOR_W_RESIZE,
    SDL_SYSTEM_CURSOR_COUNT,
};
pub const SDL_MouseButtonFlags = Uint32;

// Mouse functions
extern fn SDL_HasMouse() bool;
extern fn SDL_GetMouseState(x: ?*f32, y: ?*f32) SDL_MouseButtonFlags;
extern fn SDL_WarpMouseInWindow(window: ?*SDL_Window, x: f32, y: f32) void;
pub const hasMouse = SDL_HasMouse;
pub const getMouseState = SDL_GetMouseState;
pub const warpMouseInWindow = SDL_WarpMouseInWindow;

// Joystick/Gamepad
pub const SDL_JoystickID = Uint32;
pub const SDL_Joystick = opaque {};
pub const SDL_Gamepad = opaque {};

// Basic joystick functions
extern fn SDL_NumJoysticks() c_int;
extern fn SDL_JoystickOpen(instance_id: c_int) ?*SDL_Joystick;
extern fn SDL_JoystickClose(joystick: ?*SDL_Joystick) void;
pub const numJoysticks = SDL_NumJoysticks;
pub const joystickOpen = SDL_JoystickOpen;
pub const joystickClose = SDL_JoystickClose;

// Basic gamepad functions
extern fn SDL_NumGamepads() c_int;
extern fn SDL_IsGamepad(instance_id: c_int) bool;
extern fn SDL_OpenGamepad(instance_id: c_int) ?*SDL_Gamepad;
extern fn SDL_CloseGamepad(gamepad: ?*SDL_Gamepad) void;
pub const numGamepads = SDL_NumGamepads;
pub const isGamepad = SDL_IsGamepad;
pub const openGamepad = SDL_OpenGamepad;
pub const closeGamepad = SDL_CloseGamepad;

// Render
pub const SDL_Renderer = opaque {};
pub const SDL_Texture = opaque {};

// Render functions
extern fn SDL_CreateRenderer(window: ?*SDL_Window, name: ?[*:0]const u8, flags: Uint32) ?*SDL_Renderer;
extern fn SDL_DestroyRenderer(renderer: ?*SDL_Renderer) void;
extern fn SDL_RenderClear(renderer: ?*SDL_Renderer) bool;
extern fn SDL_RenderPresent(renderer: ?*SDL_Renderer) void;
extern fn SDL_SetRenderDrawColor(renderer: ?*SDL_Renderer, r: Uint8, g: Uint8, b: Uint8, a: Uint8) bool;
extern fn SDL_RenderDrawLine(renderer: ?*SDL_Renderer, x1: f32, y1: f32, x2: f32, y2: f32) bool;
extern fn SDL_RenderFillRect(renderer: ?*SDL_Renderer, rect: ?*const SDL_FRect) bool;
pub const createRenderer = SDL_CreateRenderer;
pub const destroyRenderer = SDL_DestroyRenderer;
pub const renderClear = SDL_RenderClear;
pub const renderPresent = SDL_RenderPresent;
pub const setRenderDrawColor = SDL_SetRenderDrawColor;
pub const renderDrawLine = SDL_RenderDrawLine;
pub const renderFillRect = SDL_RenderFillRect;

// Time
extern fn SDL_GetTicks() Uint64;
extern fn SDL_GetTicksNS() Uint64;
extern fn SDL_Delay(ms: Uint32) void;
pub const getTicks = SDL_GetTicks;
pub const getTicksNS = SDL_GetTicksNS;
pub const delay = SDL_Delay;

// Audio
pub const SDL_AudioDeviceID = Uint32;
pub const SDL_AudioSpec = extern struct {
    format: SDL_PixelFormat,
    channels: c_int,
    freq: c_int,
};

// Audio functions
extern fn SDL_OpenAudioDevice(device: ?[*:0]const u8, recording: bool, spec: ?*const SDL_AudioSpec, obtained: ?*SDL_AudioSpec, allowed_changes: c_int) SDL_AudioDeviceID;
extern fn SDL_CloseAudioDevice(dev: SDL_AudioDeviceID) void;
extern fn SDL_PauseAudioDevice(dev: SDL_AudioDeviceID, pause_on: bool) bool;
pub const openAudioDevice = SDL_OpenAudioDevice;
pub const closeAudioDevice = SDL_CloseAudioDevice;
pub const pauseAudioDevice = SDL_PauseAudioDevice;

// Threads
pub const SDL_Thread = opaque {};
pub const SDL_Mutex = opaque {};

// Thread functions
extern fn SDL_CreateThread(func: ?*const fn (?*anyopaque) callconv(.C) c_int, name: ?[*:0]const u8, data: ?*anyopaque) ?*SDL_Thread;
extern fn SDL_WaitThread(thread: ?*SDL_Thread, status: ?*c_int) void;
extern fn SDL_CreateMutex() ?*SDL_Mutex;
extern fn SDL_DestroyMutex(mutex: ?*SDL_Mutex) void;
extern fn SDL_LockMutex(mutex: ?*SDL_Mutex) bool;
extern fn SDL_UnlockMutex(mutex: ?*SDL_Mutex) bool;
pub const createThread = SDL_CreateThread;
pub const waitThread = SDL_WaitThread;
pub const createMutex = SDL_CreateMutex;
pub const destroyMutex = SDL_DestroyMutex;
pub const lockMutex = SDL_LockMutex;
pub const unlockMutex = SDL_UnlockMutex;

// Filesystem
pub const SDL_IOStream = opaque {};

// Filesystem functions
extern fn SDL_GetBasePath() ?[*:0]const u8;
extern fn SDL_IOFromFile(file: ?[*:0]const u8, mode: ?[*:0]const u8) ?*SDL_IOStream;
extern fn SDL_CloseIO(stream: ?*SDL_IOStream) bool;
extern fn SDL_ReadIO(stream: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
extern fn SDL_WriteIO(stream: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize;
pub const getBasePath = SDL_GetBasePath;
pub const ioFromFile = SDL_IOFromFile;
pub const closeIO = SDL_CloseIO;
pub const readIO = SDL_ReadIO;
pub const writeIO = SDL_WriteIO;

// Event functions
extern fn SDL_PumpEvents() void;
extern fn SDL_PollEvent(event: ?*SDL_Event) bool;
extern fn SDL_WaitEvent(event: ?*SDL_Event) bool;
extern fn SDL_WaitEventTimeout(event: ?*SDL_Event, timeout: c_int) bool;
extern fn SDL_PushEvent(event: ?*const SDL_Event) bool;
pub const pumpEvents = SDL_PumpEvents;
pub const pollEvent = SDL_PollEvent;
pub const waitEvent = SDL_WaitEvent;
pub const waitEventTimeout = SDL_WaitEventTimeout;
pub const pushEvent = SDL_PushEvent;

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

// Property constants
pub const SDL_PROP_APP_METADATA_NAME_STRING = "SDL.app.metadata.name";
pub const SDL_PROP_APP_METADATA_VERSION_STRING = "SDL.app.metadata.version";
pub const SDL_PROP_APP_METADATA_IDENTIFIER_STRING = "SDL.app.metadata.identifier";
pub const SDL_PROP_APP_METADATA_CREATOR_STRING = "SDL.app.metadata.creator";
pub const SDL_PROP_APP_METADATA_COPYRIGHT_STRING = "SDL.app.metadata.copyright";
pub const SDL_PROP_APP_METADATA_URL_STRING = "SDL.app.metadata.url";
pub const SDL_PROP_APP_METADATA_TYPE_STRING = "SDL.app.metadata.type";
