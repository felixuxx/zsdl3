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

// Text input event structures (also defined in events.zig for re-export)
// These are defined here so they can be used in the SDL_Event union
pub const SDL_TextEditingEvent = extern struct {
    type: SDL_EventType,
    reserved: Uint32,
    timestamp: Uint64,
    windowID: SDL_WindowID,
    text: [*c]const u8,
    start: Sint32,
    length: Sint32,
};

pub const SDL_TextEditingCandidatesEvent = extern struct {
    type: SDL_EventType,
    reserved: Uint32,
    timestamp: Uint64,
    windowID: SDL_WindowID,
    candidates: [*c]const [*c]const u8,
    num_candidates: Sint32,
    selected_candidate: Sint32,
    horizontal: bool,
    padding1: Uint8,
    padding2: Uint8,
    padding3: Uint8,
};

pub const SDL_TextInputEvent = extern struct {
    type: SDL_EventType,
    reserved: Uint32,
    timestamp: Uint64,
    windowID: SDL_WindowID,
    text: [*c]const u8,
};

// SDL_Event - called in events.zig
// Note: This union uses padding for ABI compatibility
// Individual event structs are defined in events.zig
// The union must include all event types for proper ABI compatibility
pub const SDL_Event = extern union {
    type: SDL_EventType,
    common: SDL_CommonEvent,
    display: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        displayID: SDL_DisplayID,
        data1: Sint32,
        data2: Sint32,
    },
    window: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        windowID: SDL_WindowID,
        data1: Sint32,
        data2: Sint32,
    },
    kdevice: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_KeyboardID,
    },
    key: SDL_KeyboardEvent,
    edit: SDL_TextEditingEvent,
    edit_candidates: SDL_TextEditingCandidatesEvent,
    text: SDL_TextInputEvent,
    mdevice: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: Uint32, // SDL_MouseID
    },
    motion: SDL_MouseMotionEvent,
    button: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        windowID: SDL_WindowID,
        which: Uint32, // SDL_MouseID
        button: Uint8,
        down: bool,
        clicks: Uint8,
        padding: Uint8,
        x: f32,
        y: f32,
    },
    wheel: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        windowID: SDL_WindowID,
        which: Uint32, // SDL_MouseID
        x: f32,
        y: f32,
        direction: Uint32, // SDL_MouseWheelDirection
        mouse_x: f32,
        mouse_y: f32,
        integer_x: Sint32,
        integer_y: Sint32,
    },
    jdevice: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_JoystickID,
    },
    jaxis: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_JoystickID,
        axis: Uint8,
        padding1: Uint8,
        padding2: Uint8,
        padding3: Uint8,
        value: Sint16,
        padding4: Uint16,
    },
    jball: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_JoystickID,
        ball: Uint8,
        padding1: Uint8,
        padding2: Uint8,
        padding3: Uint8,
        xrel: Sint16,
        yrel: Sint16,
    },
    jhat: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_JoystickID,
        hat: Uint8,
        value: Uint8,
        padding1: Uint8,
        padding2: Uint8,
    },
    jbutton: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_JoystickID,
        button: Uint8,
        down: bool,
        padding1: Uint8,
        padding2: Uint8,
    },
    jbattery: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_JoystickID,
        state: Uint32, // SDL_PowerState
        percent: c_int,
    },
    gdevice: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_JoystickID,
    },
    gaxis: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_JoystickID,
        axis: Uint8,
        padding1: Uint8,
        padding2: Uint8,
        padding3: Uint8,
        value: Sint16,
        padding4: Uint16,
    },
    gbutton: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_JoystickID,
        button: Uint8,
        down: bool,
        padding1: Uint8,
        padding2: Uint8,
    },
    gtouchpad: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_JoystickID,
        touchpad: Sint32,
        finger: Sint32,
        x: f32,
        y: f32,
        pressure: f32,
    },
    gsensor: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_JoystickID,
        sensor: Sint32,
        data: [3]f32,
        sensor_timestamp: Uint64,
    },
    adevice: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: Uint32, // SDL_AudioDeviceID
        recording: bool,
        padding1: Uint8,
        padding2: Uint8,
        padding3: Uint8,
    },
    cdevice: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: Uint32, // SDL_CameraID
    },
    sensor: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        which: SDL_SensorID,
        data: [6]f32,
        sensor_timestamp: Uint64,
    },
    quit: SDL_QuitEvent,
    user: extern struct {
        type: Uint32, // Uint32 because user events are not in SDL_EventType enum
        reserved: Uint32,
        timestamp: Uint64,
        windowID: SDL_WindowID,
        code: Sint32,
        data1: ?*anyopaque,
        data2: ?*anyopaque,
    },
    tfinger: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        touchID: Uint64, // SDL_TouchID
        fingerID: Sint64, // SDL_FingerID
        x: f32,
        y: f32,
        dx: f32,
        dy: f32,
        pressure: f32,
        windowID: SDL_WindowID,
    },
    pinch: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        scale: f32,
        windowID: SDL_WindowID,
    },
    pproximity: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        windowID: SDL_WindowID,
        which: SDL_PenID,
    },
    ptouch: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        windowID: SDL_WindowID,
        which: SDL_PenID,
        pen_state: Uint32,
        x: f32,
        y: f32,
        eraser: bool,
        down: bool,
    },
    pmotion: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        windowID: SDL_WindowID,
        which: SDL_PenID,
        pen_state: Uint32,
        x: f32,
        y: f32,
    },
    pbutton: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        windowID: SDL_WindowID,
        which: SDL_PenID,
        pen_state: Uint32,
        x: f32,
        y: f32,
        button: Uint8,
        down: bool,
    },
    paxis: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        windowID: SDL_WindowID,
        which: SDL_PenID,
        pen_state: Uint32,
        x: f32,
        y: f32,
        axis: Uint32, // SDL_PenAxis
        value: f32,
    },
    render: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        windowID: SDL_WindowID,
    },
    drop: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        windowID: SDL_WindowID,
        x: f32,
        y: f32,
        source: [*c]const u8,
        data: [*c]const u8,
    },
    clipboard: extern struct {
        type: SDL_EventType,
        reserved: Uint32,
        timestamp: Uint64,
        owner: bool,
        padding1: Uint8,
        padding2: Uint8,
        padding3: Uint8,
        num_mime_types: Sint32,
        mime_types: [*c]const [*c]const u8,
    },
    // padding for ABI - all event types can be accessed via casting
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
extern fn SDL_ClearError() bool;
extern fn SDL_SetError(fmt: [*:0]const u8, ...) bool;
extern fn SDL_SetErrorV(fmt: [*:0]const u8, ap: [*c]u8) bool; // va_list is platform-specific, using [*c]u8 as approximation
extern fn SDL_OutOfMemory() bool;

// Version
pub const SDL_Version = extern struct {
    major: Uint8,
    minor: Uint8,
    patch: Uint8,
};

extern fn SDL_GetVersion() c_int; // Returns version number as int (e.g., 3005000 for 3.5.0)
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
pub const setErrorV = SDL_SetErrorV;
pub const outOfMemory = SDL_OutOfMemory;
pub const getVersion = SDL_GetVersion;
pub const getRevision = SDL_GetRevision;
