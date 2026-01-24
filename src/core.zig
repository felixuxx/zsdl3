// SDL3 Core Bindings
// Basic types, initialization, error handling, app metadata, version

// Basic types
pub const Sint8 = i8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;

// Window and display IDs
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const SDL_KeyboardID = Uint32;
pub const SDL_SensorID = Uint32;
pub const SDL_PenID = Uint32;
pub const SDL_JoystickID = Uint32;
pub const SDL_GamepadID = Uint32;
pub const SDL_Keymod = c_int;
pub const SDL_Keycode = c_int;
pub const SDL_Scancode = c_int;

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
    SDL_APP_CONTINUE,
    SDL_APP_SUCCESS,
    SDL_APP_FAILURE,
};

// Function pointers for app callbacks
pub const SDL_AppInit_func = ?*const fn (?*anyopaque, c_int, ?[*]?[*:0]u8) callconv(.C) SDL_AppResult;
pub const SDL_AppIterate_func = ?*const fn (?*anyopaque) callconv(.C) SDL_AppResult;
pub const SDL_AppEvent_func = ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) SDL_AppResult;
pub const SDL_AppQuit_func = ?*const fn (?*anyopaque, SDL_AppResult) callconv(.C) void;

// Main thread callback
pub const SDL_MainThreadCallback = ?*const fn (?*anyopaque) callconv(.C) void;

// SDL_Event - called in events.zig
pub const SDL_Event = extern union {
    type: SDL_EventType,
    common: SDL_CommonEvent,
    quit: SDL_QuitEvent,
    key: SDL_KeyboardEvent,
    motion: SDL_MouseMotionEvent,
    // padding for ABI
    padding: [128]Uint8,
};

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

// Event types (basic)
pub const SDL_EventType = c_uint;
pub const SDL_EVENT_FIRST = 0;
pub const SDL_EVENT_QUIT = 0x100;
pub const SDL_EVENT_KEY_DOWN = 0x300;
pub const SDL_EVENT_KEY_UP = 0x301;
pub const SDL_EVENT_MOUSE_MOTION = 0x400;
pub const SDL_EVENT_MOUSE_BUTTON_DOWN = 0x401;
pub const SDL_EVENT_MOUSE_BUTTON_UP = 0x402;
pub const SDL_EVENT_MOUSE_WHEEL = 0x403;

// SDL_Event - called in events.zig
pub const SDL_KeyboardEvent = extern struct {
    type: SDL_EventType,
    reserved: Uint32,
    timestamp: Uint64,
    windowID: SDL_WindowID,
    which: SDL_KeyboardID,
    scancode: SDL_Scancode,
    key: SDL_Keycode,
    mod: SDL_Keymod,
    raw: Uint16,
    down: bool,
    repeat: bool,
};

pub const SDL_MouseMotionEvent = extern struct {
    type: SDL_EventType,
    reserved: Uint32,
    timestamp: Uint64,
    windowID: SDL_WindowID,
    which: Uint32, // SDL_MouseID
    state: Uint32, // SDL_MouseButtonFlags
    x: f32,
    y: f32,
    xrel: f32,
    yrel: f32,
};

// SDL_PropertiesID
pub const SDL_PropertiesID = Uint32;

// Property constants
pub const SDL_PROP_APP_METADATA_NAME_STRING = "SDL.app.metadata.name";
pub const SDL_PROP_APP_METADATA_VERSION_STRING = "SDL.app.metadata.version";
pub const SDL_PROP_APP_METADATA_IDENTIFIER_STRING = "SDL.app.metadata.identifier";
pub const SDL_PROP_APP_METADATA_CREATOR_STRING = "SDL.app.metadata.creator";
pub const SDL_PROP_APP_METADATA_COPYRIGHT_STRING = "SDL.app.metadata.copyright";
pub const SDL_PROP_APP_METADATA_URL_STRING = "SDL.app.metadata.url";
pub const SDL_PROP_APP_METADATA_TYPE_STRING = "SDL.app.metadata.type";

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
