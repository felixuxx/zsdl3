// SDL3 Events Bindings
// Complete event handling and polling

const core = @import("core.zig");
const video = @import("video.zig");
const input = @import("input.zig");
const touch = @import("touch.zig");

// Import types
pub const SDL_EventType = core.SDL_EventType;
pub const SDL_CommonEvent = core.SDL_CommonEvent;
pub const SDL_QuitEvent = core.SDL_QuitEvent;
pub const SDL_KeyboardEvent = core.SDL_KeyboardEvent;
pub const SDL_MouseMotionEvent = core.SDL_MouseMotionEvent;
pub const SDL_WindowID = core.SDL_WindowID;
pub const SDL_Event = core.SDL_Event;
pub const SDL_TouchID = core.SDL_TouchID;
pub const SDL_Finger = touch.SDL_Finger;

// === Complete SDL3 Event Type Constants ===
// Application events
pub const SDL_EVENT_FIRST = 0;
pub const SDL_EVENT_QUIT = 0x100;
pub const SDL_EVENT_TERMINATING = 0x101;
pub const SDL_EVENT_LOW_MEMORY = 0x102;
pub const SDL_EVENT_WILL_ENTER_BACKGROUND = 0x103;
pub const SDL_EVENT_DID_ENTER_BACKGROUND = 0x104;
pub const SDL_EVENT_WILL_ENTER_FOREGROUND = 0x105;
pub const SDL_EVENT_DID_ENTER_FOREGROUND = 0x106;

// Window events
pub const SDL_EVENT_WINDOW_SHOWN = 0x200;
pub const SDL_EVENT_WINDOW_HIDDEN = 0x201;
pub const SDL_EVENT_WINDOW_EXPOSED = 0x202;
pub const SDL_EVENT_WINDOW_MOVED = 0x203;
pub const SDL_EVENT_WINDOW_RESIZED = 0x204;
pub const SDL_EVENT_WINDOW_SIZE_CHANGED = 0x205;
pub const SDL_EVENT_WINDOW_MINIMIZED = 0x206;
pub const SDL_EVENT_WINDOW_MAXIMIZED = 0x207;
pub const SDL_EVENT_WINDOW_RESTORED = 0x208;
pub const SDL_EVENT_WINDOW_MOUSE_ENTER = 0x209;
pub const SDL_EVENT_WINDOW_MOUSE_LEAVE = 0x20A;
pub const SDL_EVENT_WINDOW_FOCUS_GAINED = 0x20B;
pub const SDL_EVENT_WINDOW_FOCUS_LOST = 0x20C;
pub const SDL_EVENT_WINDOW_CLOSE_REQUESTED = 0x20D;
pub const SDL_EVENT_WINDOW_TAKE_FOCUS = 0x20E;
pub const SDL_EVENT_WINDOW_HIT_TEST = 0x20F;
pub const SDL_EVENT_WINDOW_ICCPROF_CHANGED = 0x210;
pub const SDL_EVENT_WINDOW_DISPLAY_CHANGED = 0x211;
pub const SDL_EVENT_WINDOW_DISPLAY_STATE_CHANGED = 0x212;
pub const SDL_EVENT_WINDOW_OCCLUDED = 0x213;
pub const SDL_EVENT_WINDOW_ENTER_FULLSCREEN = 0x214;
pub const SDL_EVENT_WINDOW_LEAVE_FULLSCREEN = 0x215;
pub const SDL_EVENT_WINDOW_DESTROYED = 0x216;
pub const SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED = 0x217;

// Keyboard events
pub const SDL_EVENT_KEY_DOWN = 0x300;
pub const SDL_EVENT_KEY_UP = 0x301;
pub const SDL_EVENT_TEXT_EDITING = 0x302;
pub const SDL_EVENT_TEXT_INPUT = 0x303;
pub const SDL_EVENT_KEYMAP_CHANGED = 0x304;

// Mouse events
pub const SDL_EVENT_MOUSE_MOTION = 0x400;
pub const SDL_EVENT_MOUSE_BUTTON_DOWN = 0x401;
pub const SDL_EVENT_MOUSE_BUTTON_UP = 0x402;
pub const SDL_EVENT_MOUSE_WHEEL = 0x403;

// Joystick events
pub const SDL_EVENT_JOYSTICK_ADDED = 0x500;
pub const SDL_EVENT_JOYSTICK_REMOVED = 0x501;
pub const SDL_EVENT_JOYSTICK_BATTERY_UPDATED = 0x502;
pub const SDL_EVENT_JOYSTICK_BUTTON_DOWN = 0x503;
pub const SDL_EVENT_JOYSTICK_BUTTON_UP = 0x504;
pub const SDL_EVENT_JOYSTICK_HAT_MOTION = 0x505;
pub const SDL_EVENT_JOYSTICK_AXIS_MOTION = 0x506;

// Gamepad events
pub const SDL_EVENT_GAMEPAD_ADDED = 0x600;
pub const SDL_EVENT_GAMEPAD_REMOVED = 0x601;
pub const SDL_EVENT_GAMEPAD_BUTTON_DOWN = 0x602;
pub const SDL_EVENT_GAMEPAD_BUTTON_UP = 0x603;
pub const SDL_EVENT_GAMEPAD_AXIS_MOTION = 0x604;
pub const SDL_EVENT_GAMEPAD_REMAPPED = 0x605;
pub const SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED = 0x606;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN = 0x607;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION = 0x608;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_UP = 0x609;
pub const SDL_EVENT_GAMEPAD_SENSOR_UPDATE = 0x60A;
pub const SDL_EVENT_GAMEPAD_STEAM_HANDLE_CHANGED = 0x60B;

// Touch events
pub const SDL_EVENT_FINGER_DOWN = 0x700;
pub const SDL_EVENT_FINGER_UP = 0x701;
pub const SDL_EVENT_FINGER_MOTION = 0x702;

// Gesture events
pub const SDL_EVENT_GESTURE_SWIPE = 0x800;
pub const SDL_EVENT_GESTURE_MULTIGESTURE = 0x801;

// Clipboard events
pub const SDL_EVENT_CLIPBOARD_UPDATE = 0x900;

// Drag and drop events
pub const SDL_EVENT_DROP_FILE = 0x1000;
pub const SDL_EVENT_DROP_TEXT = 0x1001;
pub const SDL_EVENT_DROP_BEGIN = 0x1002;
pub const SDL_EVENT_DROP_COMPLETE = 0x1003;
pub const SDL_EVENT_DROP_POSITION = 0x1004;

// Audio hotplug events
pub const SDL_EVENT_AUDIO_DEVICE_ADDED = 0x1100;
pub const SDL_EVENT_AUDIO_DEVICE_REMOVED = 0x1101;
pub const SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED = 0x1102;

// Sensor events
pub const SDL_EVENT_SENSOR_UPDATE = 0x1200;

// Display events
pub const SDL_EVENT_DISPLAY_ORIENTATION = 0x1300;
pub const SDL_EVENT_DISPLAY_CONNECTED = 0x1301;
pub const SDL_EVENT_DISPLAY_DISCONNECTED = 0x1302;

// Power events
pub const SDL_EVENT_POWER_STATE_CHANGED = 0x1400;

// Pen events
pub const SDL_EVENT_PEN_DOWN = 0x1500;
pub const SDL_EVENT_PEN_UP = 0x1501;
pub const SDL_EVENT_PEN_MOTION = 0x1502;
pub const SDL_EVENT_PEN_BUTTON_DOWN = 0x1503;
pub const SDL_EVENT_PEN_BUTTON_UP = 0x1504;
pub const SDL_EVENT_PEN_ERASER_DOWN = 0x1505;
pub const SDL_EVENT_PEN_ERASER_UP = 0x1506;
pub const SDL_EVENT_PEN_AXIS = 0x1507;

// Camera events
pub const SDL_EVENT_CAMERA_DEVICE_ADDED = 0x1600;
pub const SDL_EVENT_CAMERA_DEVICE_REMOVED = 0x1601;
pub const SDL_EVENT_CAMERA_DEVICE_APPROVED = 0x1602;
pub const SDL_EVENT_CAMERA_DEVICE_DENIED = 0x1603;

// User events
pub const SDL_EVENT_USER = 0x8000;

// === Missing Event Structures ===
// Window event structure
pub const SDL_WindowEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    event: c_int,
    data1: core.Sint32,
    data2: core.Sint32,
};

// Display event structure
pub const SDL_DisplayEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    displayID: core.SDL_DisplayID,
    event: c_int,
    data1: core.Sint32,
    data2: core.Sint32,
};

// Keyboard device event structure
pub const SDL_KeyboardDeviceEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    which: core.SDL_KeyboardID,
    event: c_int,
};

// Mouse button event structure
pub const SDL_MouseButtonEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    which: core.Uint32, // SDL_MouseID
    button: u8,
    clicks: u8,
    x: f32,
    y: f32,
};

// Mouse wheel event structure
pub const SDL_MouseWheelEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    which: core.Uint32, // SDL_MouseID
    x: f32,
    y: f32,
    direction: core.Sint32,
};

// Joystick device event structure
pub const SDL_JoystickDeviceEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    event: c_int,
};

// Joystick button event structure
pub const SDL_JoystickButtonEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    button: u8,
    state: u8,
};

// Joystick hat event structure
pub const SDL_JoystickHatEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    hat: u8,
    value: u8,
};

// Joystick axis event structure
pub const SDL_JoystickAxisEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    axis: u8,
    value: core.Sint16,
    value64: core.Sint64,
};

// Gamepad device event structure
pub const SDL_GamepadDeviceEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    which: core.SDL_GamepadID,
    event: c_int,
};

// Gamepad button event structure
pub const SDL_GamepadButtonEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    which: core.SDL_GamepadID,
    button: input.SDL_GamepadButton,
    state: u8,
};

// Gamepad axis event structure
pub const SDL_GamepadAxisEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    which: core.SDL_GamepadID,
    axis: input.SDL_GamepadAxis,
    value: core.Sint16,
    value64: core.Sint64,
};

// Text editing event structure
pub const SDL_TextEditingEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    text: [*:0]const u8,
    start: core.Sint32,
    length: core.Sint32,
};

// Text input event structure
pub const SDL_TextInputEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    text: [*:0]const u8,
};

// Drop event structure
pub const SDL_DropEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    source: core.Sint32,
    file: [*:0]const u8,
};

// Audio device event structure
pub const SDL_AudioDeviceEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    which: core.Uint32,
    event: c_int,
    recording: bool,
};

// Camera device event structure
pub const SDL_CameraDeviceEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    which: core.SDL_CameraID,
    event: c_int,
};

// Sensor event structure
pub const SDL_SensorEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    which: core.SDL_SensorID,
    data: [6]f32,
    data_user: [64]f32,
};

// Pen event structures
pub const SDL_PenEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    which: core.SDL_PenID,
    pen_state: u32,
    x: f32,
    y: f32,
    axes: core.Sint16,
    num_axes: core.Sint16,
    buttons: u32,
    num_buttons: u32,
};

pub const SDL_PenAxisEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    which: core.SDL_PenID,
    axis: core.SDL_PenAxis,
    value: f32,
};

// Gesture event structures
pub const SDL_GestureEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    touchID: SDL_TouchID,
    x: f32,
    y: f32,
    dTheta: f32,
    dDist: f32,
    numFingers: u32,
};

// Touch finger event structures
pub const SDL_TouchFingerEvent = extern struct {
    type: SDL_EventType,
    timestamp: core.Uint64,
    touchID: SDL_TouchID,
    fingerID: core.SDL_FingerID,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    pressure: f32,
};

// Event action enum
pub const SDL_EventAction = enum(c_int) {
    SDL_ADDEVENT,
    SDL_PEEKEVENT,
    SDL_GETEVENT,
};

// === Event Functions ===
extern fn SDL_PumpEvents() void;
extern fn SDL_PollEvent(event: ?*SDL_Event) bool;
extern fn SDL_WaitEvent(event: ?*SDL_Event) bool;
extern fn SDL_WaitEventTimeout(event: ?*SDL_Event, timeout: c_int) bool;
extern fn SDL_PushEvent(event: ?*const SDL_Event) bool;
extern fn SDL_FilterEvents(callback: ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) bool, userdata: ?*anyopaque) void;
extern fn SDL_AddEventWatch(callback: ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) void, userdata: ?*anyopaque) bool;
extern fn SDL_DelEventWatch(callback: ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) void, userdata: ?*anyopaque) void;
extern fn SDL_PeepEvents(events: ?[*]SDL_Event, numevents: c_int, action: SDL_EventAction, minType: SDL_EventType, maxType: SDL_EventType) c_int;
extern fn SDL_HasEvent(type: SDL_EventType) bool;
extern fn SDL_HasEvents(minType: SDL_EventType, maxType: SDL_EventType) bool;
extern fn SDL_FlushEvent(type: SDL_EventType) void;
extern fn SDL_FlushEvents(minType: SDL_EventType, maxType: SDL_EventType) void;
extern fn SDL_SetEventEnabled(type: SDL_EventType, enabled: bool) void;
extern fn SDL_EventEnabled(type: SDL_EventType) bool;
extern fn SDL_RegisterEvents(numevents: c_int) SDL_EventType;

// Event filter functions
extern fn SDL_GetEventFilter(filter: ?*?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) bool, userdata: ?*?*anyopaque) bool;
extern fn SDL_SetEventFilter(filter: ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) bool, userdata: ?*anyopaque) void;

// Event name function
extern fn SDL_GetEventName(type: SDL_EventType) ?[*:0]const u8;

// Touch functions
extern fn SDL_GetNumTouchFingers(touchID: core.SDL_TouchID) c_int;
extern fn SDL_GetTouchFinger(touchID: core.SDL_TouchID, index: c_int) ?*SDL_Finger;

// === Public API ===
// Basic event handling
pub const pumpEvents = SDL_PumpEvents;
pub const pollEvent = SDL_PollEvent;
pub const waitEvent = SDL_WaitEvent;
pub const waitEventTimeout = SDL_WaitEventTimeout;
pub const pushEvent = SDL_PushEvent;

// Event filtering and watching
pub const filterEvents = SDL_FilterEvents;
pub const addEventWatch = SDL_AddEventWatch;
pub const delEventWatch = SDL_DelEventWatch;
pub const peepEvents = SDL_PeepEvents;
pub const hasEvent = SDL_HasEvent;
pub const hasEvents = SDL_HasEvents;
pub const flushEvent = SDL_FlushEvent;
pub const flushEvents = SDL_FlushEvents;
pub const setEventEnabled = SDL_SetEventEnabled;
pub const eventEnabled = SDL_EventEnabled;
pub const registerEvents = SDL_RegisterEvents;

// Event utilities
pub const getEventFilter = SDL_GetEventFilter;
pub const setEventFilter = SDL_SetEventFilter;
pub const getEventName = SDL_GetEventName;

// Touch utilities
pub const getNumTouchFingers = SDL_GetNumTouchFingers;
pub const getTouchFinger = SDL_GetTouchFinger;

// === Utility Functions ===
/// Check if an event is a window event
pub fn isWindowEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_WINDOW_SHOWN and eventType <= SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED;
}

/// Check if an event is a keyboard event
pub fn isKeyboardEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_KEY_DOWN and eventType <= SDL_EVENT_KEYMAP_CHANGED;
}

/// Check if an event is a mouse event
pub fn isMouseEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_MOUSE_MOTION and eventType <= SDL_EVENT_MOUSE_WHEEL;
}

/// Check if an event is a gamepad event
pub fn isGamepadEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_GAMEPAD_ADDED and eventType <= SDL_EVENT_GAMEPAD_STEAM_HANDLE_CHANGED;
}

/// Check if an event is a joystick event
pub fn isJoystickEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_JOYSTICK_ADDED and eventType <= SDL_EVENT_JOYSTICK_AXIS_MOTION;
}

/// Check if an event is a touch event
pub fn isTouchEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_FINGER_DOWN and eventType <= SDL_EVENT_FINGER_MOTION;
}

/// Check if an event is a gesture event
pub fn isGestureEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_GESTURE_SWIPE and eventType <= SDL_EVENT_GESTURE_MULTIGESTURE;
}

/// Check if an event is a drop event
pub fn isDropEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_DROP_FILE and eventType <= SDL_EVENT_DROP_POSITION;
}

/// Check if an event is an audio device event
pub fn isAudioDeviceEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_AUDIO_DEVICE_ADDED and eventType <= SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED;
}

/// Check if an event is a camera event
pub fn isCameraEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_CAMERA_DEVICE_ADDED and eventType <= SDL_EVENT_CAMERA_DEVICE_DENIED;
}

/// Check if an event is a pen event
pub fn isPenEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_PEN_DOWN and eventType <= SDL_EVENT_PEN_AXIS;
}

/// Check if an event is a user event
pub fn isUserEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_USER;
}
