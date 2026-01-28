// SDL3 Events Bindings
// Complete event handling and polling

const core = @import("core.zig");
const video = @import("video.zig");
const input = @import("input.zig");
const touch = @import("touch.zig");
const pen = @import("pen.zig");

// Import types
pub const SDL_EventType = core.SDL_EventType;
pub const SDL_CommonEvent = core.SDL_CommonEvent;
pub const SDL_QuitEvent = core.SDL_QuitEvent;
pub const SDL_KeyboardEvent = core.SDL_KeyboardEvent;
pub const SDL_MouseMotionEvent = core.SDL_MouseMotionEvent;
pub const SDL_WindowID = core.SDL_WindowID;
pub const SDL_Event = core.SDL_Event;
pub const SDL_TouchID = touch.SDL_TouchID;
pub const SDL_Finger = touch.SDL_Finger;
pub const SDL_FingerID = touch.SDL_FingerID;

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
pub const SDL_EVENT_LOCALE_CHANGED = 0x107;
pub const SDL_EVENT_SYSTEM_THEME_CHANGED = 0x108;

// Display events
pub const SDL_EVENT_DISPLAY_ORIENTATION = 0x151;
pub const SDL_EVENT_DISPLAY_ADDED = 0x152;
pub const SDL_EVENT_DISPLAY_REMOVED = 0x153;
pub const SDL_EVENT_DISPLAY_MOVED = 0x154;
pub const SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED = 0x155;
pub const SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED = 0x156;
pub const SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED = 0x157;
pub const SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED = 0x158;
pub const SDL_EVENT_DISPLAY_FIRST = SDL_EVENT_DISPLAY_ORIENTATION;
pub const SDL_EVENT_DISPLAY_LAST = SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED;

// Window events
pub const SDL_EVENT_WINDOW_SHOWN = 0x202;
pub const SDL_EVENT_WINDOW_HIDDEN = 0x203;
pub const SDL_EVENT_WINDOW_EXPOSED = 0x204;
pub const SDL_EVENT_WINDOW_MOVED = 0x205;
pub const SDL_EVENT_WINDOW_RESIZED = 0x206;
pub const SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED = 0x207;
pub const SDL_EVENT_WINDOW_METAL_VIEW_RESIZED = 0x208;
pub const SDL_EVENT_WINDOW_MINIMIZED = 0x209;
pub const SDL_EVENT_WINDOW_MAXIMIZED = 0x20A;
pub const SDL_EVENT_WINDOW_RESTORED = 0x20B;
pub const SDL_EVENT_WINDOW_MOUSE_ENTER = 0x20C;
pub const SDL_EVENT_WINDOW_MOUSE_LEAVE = 0x20D;
pub const SDL_EVENT_WINDOW_FOCUS_GAINED = 0x20E;
pub const SDL_EVENT_WINDOW_FOCUS_LOST = 0x20F;
pub const SDL_EVENT_WINDOW_CLOSE_REQUESTED = 0x210;
pub const SDL_EVENT_WINDOW_HIT_TEST = 0x211;
pub const SDL_EVENT_WINDOW_ICCPROF_CHANGED = 0x212;
pub const SDL_EVENT_WINDOW_DISPLAY_CHANGED = 0x213;
pub const SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED = 0x214;
pub const SDL_EVENT_WINDOW_SAFE_AREA_CHANGED = 0x215;
pub const SDL_EVENT_WINDOW_OCCLUDED = 0x216;
pub const SDL_EVENT_WINDOW_ENTER_FULLSCREEN = 0x217;
pub const SDL_EVENT_WINDOW_LEAVE_FULLSCREEN = 0x218;
pub const SDL_EVENT_WINDOW_DESTROYED = 0x219;
pub const SDL_EVENT_WINDOW_HDR_STATE_CHANGED = 0x21A;
pub const SDL_EVENT_WINDOW_FIRST = SDL_EVENT_WINDOW_SHOWN;
pub const SDL_EVENT_WINDOW_LAST = SDL_EVENT_WINDOW_HDR_STATE_CHANGED;

// Keyboard events
pub const SDL_EVENT_KEY_DOWN = 0x300;
pub const SDL_EVENT_KEY_UP = 0x301;
pub const SDL_EVENT_TEXT_EDITING = 0x302;
pub const SDL_EVENT_TEXT_INPUT = 0x303;
pub const SDL_EVENT_KEYMAP_CHANGED = 0x304;
pub const SDL_EVENT_KEYBOARD_ADDED = 0x305;
pub const SDL_EVENT_KEYBOARD_REMOVED = 0x306;
pub const SDL_EVENT_TEXT_EDITING_CANDIDATES = 0x307;
pub const SDL_EVENT_SCREEN_KEYBOARD_SHOWN = 0x308;
pub const SDL_EVENT_SCREEN_KEYBOARD_HIDDEN = 0x309;

// Mouse events
pub const SDL_EVENT_MOUSE_MOTION = 0x400;
pub const SDL_EVENT_MOUSE_BUTTON_DOWN = 0x401;
pub const SDL_EVENT_MOUSE_BUTTON_UP = 0x402;
pub const SDL_EVENT_MOUSE_WHEEL = 0x403;
pub const SDL_EVENT_MOUSE_ADDED = 0x404;
pub const SDL_EVENT_MOUSE_REMOVED = 0x405;

// Joystick events
pub const SDL_EVENT_JOYSTICK_AXIS_MOTION = 0x600;
pub const SDL_EVENT_JOYSTICK_BALL_MOTION = 0x601;
pub const SDL_EVENT_JOYSTICK_HAT_MOTION = 0x602;
pub const SDL_EVENT_JOYSTICK_BUTTON_DOWN = 0x603;
pub const SDL_EVENT_JOYSTICK_BUTTON_UP = 0x604;
pub const SDL_EVENT_JOYSTICK_ADDED = 0x605;
pub const SDL_EVENT_JOYSTICK_REMOVED = 0x606;
pub const SDL_EVENT_JOYSTICK_BATTERY_UPDATED = 0x607;
pub const SDL_EVENT_JOYSTICK_UPDATE_COMPLETE = 0x608;

// Gamepad events
pub const SDL_EVENT_GAMEPAD_AXIS_MOTION = 0x650;
pub const SDL_EVENT_GAMEPAD_BUTTON_DOWN = 0x651;
pub const SDL_EVENT_GAMEPAD_BUTTON_UP = 0x652;
pub const SDL_EVENT_GAMEPAD_ADDED = 0x653;
pub const SDL_EVENT_GAMEPAD_REMOVED = 0x654;
pub const SDL_EVENT_GAMEPAD_REMAPPED = 0x655;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN = 0x656;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION = 0x657;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_UP = 0x658;
pub const SDL_EVENT_GAMEPAD_SENSOR_UPDATE = 0x659;
pub const SDL_EVENT_GAMEPAD_UPDATE_COMPLETE = 0x65A;
pub const SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED = 0x65B;

// Touch events
pub const SDL_EVENT_FINGER_DOWN = 0x700;
pub const SDL_EVENT_FINGER_UP = 0x701;
pub const SDL_EVENT_FINGER_MOTION = 0x702;
pub const SDL_EVENT_FINGER_CANCELED = 0x703;

// Pinch events
pub const SDL_EVENT_PINCH_BEGIN = 0x710;
pub const SDL_EVENT_PINCH_UPDATE = 0x711;
pub const SDL_EVENT_PINCH_END = 0x712;

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

// Pen events
pub const SDL_EVENT_PEN_PROXIMITY_IN = 0x1300;
pub const SDL_EVENT_PEN_PROXIMITY_OUT = 0x1301;
pub const SDL_EVENT_PEN_DOWN = 0x1302;
pub const SDL_EVENT_PEN_UP = 0x1303;
pub const SDL_EVENT_PEN_BUTTON_DOWN = 0x1304;
pub const SDL_EVENT_PEN_BUTTON_UP = 0x1305;
pub const SDL_EVENT_PEN_MOTION = 0x1306;
pub const SDL_EVENT_PEN_AXIS = 0x1307;

// Camera events
pub const SDL_EVENT_CAMERA_DEVICE_ADDED = 0x1400;
pub const SDL_EVENT_CAMERA_DEVICE_REMOVED = 0x1401;
pub const SDL_EVENT_CAMERA_DEVICE_APPROVED = 0x1402;
pub const SDL_EVENT_CAMERA_DEVICE_DENIED = 0x1403;

// Render events
pub const SDL_EVENT_RENDER_TARGETS_RESET = 0x2000;
pub const SDL_EVENT_RENDER_DEVICE_RESET = 0x2001;
pub const SDL_EVENT_RENDER_DEVICE_LOST = 0x2002;

// Private events
pub const SDL_EVENT_PRIVATE0 = 0x4000;
pub const SDL_EVENT_PRIVATE1 = 0x4001;
pub const SDL_EVENT_PRIVATE2 = 0x4002;
pub const SDL_EVENT_PRIVATE3 = 0x4003;

// Internal events
pub const SDL_EVENT_POLL_SENTINEL = 0x7F00;

// User events
pub const SDL_EVENT_USER = 0x8000;
pub const SDL_EVENT_LAST = 0xFFFF;

// === Event Structures ===
// Window event structure
pub const SDL_WindowEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    data1: core.Sint32,
    data2: core.Sint32,
};

// Display event structure
pub const SDL_DisplayEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    displayID: core.SDL_DisplayID,
    data1: core.Sint32,
    data2: core.Sint32,
};

// Keyboard device event structure
pub const SDL_KeyboardDeviceEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_KeyboardID,
};

// Text editing event structure
pub const SDL_TextEditingEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    text: [*c]const u8,
    start: core.Sint32,
    length: core.Sint32,
};

// Text editing candidates event structure
pub const SDL_TextEditingCandidatesEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    candidates: [*c]const [*c]const u8,
    num_candidates: core.Sint32,
    selected_candidate: core.Sint32,
    horizontal: bool,
    padding1: core.Uint8,
    padding2: core.Uint8,
    padding3: core.Uint8,
};

// Text input event structure
pub const SDL_TextInputEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    text: [*c]const u8,
};

// Mouse device event structure
pub const SDL_MouseDeviceEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: input.SDL_MouseID,
};

// Mouse button event structure
pub const SDL_MouseButtonEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    which: input.SDL_MouseID,
    button: core.Uint8,
    down: bool,
    clicks: core.Uint8,
    padding: core.Uint8,
    x: f32,
    y: f32,
};

// Mouse wheel event structure
pub const SDL_MouseWheelEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    which: input.SDL_MouseID,
    x: f32,
    y: f32,
    direction: c_int, // SDL_MouseWheelDirection
    mouse_x: f32,
    mouse_y: f32,
    integer_x: core.Sint32,
    integer_y: core.Sint32,
};

// Joystick device event structure
pub const SDL_JoyDeviceEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
};

// Joystick axis event structure
pub const SDL_JoyAxisEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    axis: core.Uint8,
    padding1: core.Uint8,
    padding2: core.Uint8,
    padding3: core.Uint8,
    value: core.Sint16,
    padding4: core.Uint16,
};

// Joystick ball event structure
pub const SDL_JoyBallEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    ball: core.Uint8,
    padding1: core.Uint8,
    padding2: core.Uint8,
    padding3: core.Uint8,
    xrel: core.Sint16,
    yrel: core.Sint16,
};

// Joystick hat event structure
pub const SDL_JoyHatEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    hat: core.Uint8,
    value: core.Uint8,
    padding1: core.Uint8,
    padding2: core.Uint8,
};

// Joystick button event structure
pub const SDL_JoyButtonEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    button: core.Uint8,
    down: bool,
    padding1: core.Uint8,
    padding2: core.Uint8,
};

// Joystick battery event structure
pub const SDL_JoyBatteryEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    state: c_int, // SDL_PowerState
    percent: c_int,
};

// Gamepad device event structure
pub const SDL_GamepadDeviceEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
};

// Gamepad axis event structure
pub const SDL_GamepadAxisEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    axis: core.Uint8, // SDL_GamepadAxis
    padding1: core.Uint8,
    padding2: core.Uint8,
    padding3: core.Uint8,
    value: core.Sint16,
    padding4: core.Uint16,
};

// Gamepad button event structure
pub const SDL_GamepadButtonEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    button: core.Uint8, // SDL_GamepadButton
    down: bool,
    padding1: core.Uint8,
    padding2: core.Uint8,
};

// Gamepad touchpad event structure
pub const SDL_GamepadTouchpadEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    touchpad: core.Sint32,
    finger: core.Sint32,
    x: f32,
    y: f32,
    pressure: f32,
};

// Gamepad sensor event structure
pub const SDL_GamepadSensorEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_JoystickID,
    sensor: core.Sint32, // SDL_SensorType
    data: [3]f32,
    sensor_timestamp: core.Uint64,
};

// Audio device event structure
pub const SDL_AudioDeviceEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.Uint32, // SDL_AudioDeviceID
    recording: bool,
    padding1: core.Uint8,
    padding2: core.Uint8,
    padding3: core.Uint8,
};

// Camera device event structure
pub const SDL_CameraDeviceEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_CameraID,
};

// Sensor event structure
pub const SDL_SensorEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    which: core.SDL_SensorID,
    data: [6]f32,
    sensor_timestamp: core.Uint64,
};

// Touch finger event structure
pub const SDL_TouchFingerEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    touchID: SDL_TouchID,
    fingerID: SDL_FingerID,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    pressure: f32,
    windowID: SDL_WindowID,
};

// Pinch finger event structure
pub const SDL_PinchFingerEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    scale: f32,
    windowID: SDL_WindowID,
};

// Pen proximity event structure
pub const SDL_PenProximityEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    which: core.SDL_PenID,
};

// Pen motion event structure
pub const SDL_PenMotionEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    which: core.SDL_PenID,
    pen_state: core.Uint32, // SDL_PenInputFlags
    x: f32,
    y: f32,
};

// Pen touch event structure
pub const SDL_PenTouchEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    which: core.SDL_PenID,
    pen_state: core.Uint32, // SDL_PenInputFlags
    x: f32,
    y: f32,
    eraser: bool,
    down: bool,
};

// Pen button event structure
pub const SDL_PenButtonEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    which: core.SDL_PenID,
    pen_state: core.Uint32, // SDL_PenInputFlags
    x: f32,
    y: f32,
    button: core.Uint8,
    down: bool,
};

// Pen axis event structure
pub const SDL_PenAxisEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    which: core.SDL_PenID,
    pen_state: core.Uint32, // SDL_PenInputFlags
    x: f32,
    y: f32,
    axis: pen.SDL_PenAxis,
    value: f32,
};

// Drop event structure
pub const SDL_DropEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    x: f32,
    y: f32,
    source: [*c]const u8,
    data: [*c]const u8,
};

// Clipboard event structure
pub const SDL_ClipboardEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    owner: bool,
    num_mime_types: core.Sint32,
    mime_types: [*c]const [*c]const u8,
};

// User event structure
pub const SDL_UserEvent = extern struct {
    type: core.Uint32, // Uint32 because user events are not in SDL_EventType enum
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
    code: core.Sint32,
    data1: ?*anyopaque,
    data2: ?*anyopaque,
};

// Render event structure
pub const SDL_RenderEvent = extern struct {
    type: SDL_EventType,
    reserved: core.Uint32,
    timestamp: core.Uint64,
    windowID: SDL_WindowID,
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
extern fn SDL_WaitEventTimeout(event: ?*SDL_Event, timeoutMS: core.Sint32) bool;
extern fn SDL_PushEvent(event: ?*const SDL_Event) bool;
extern fn SDL_FilterEvents(callback: ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) bool, userdata: ?*anyopaque) void;
extern fn SDL_AddEventWatch(callback: ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) void, userdata: ?*anyopaque) bool;
extern fn SDL_RemoveEventWatch(callback: ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) void, userdata: ?*anyopaque) void;
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

// Event description function
extern fn SDL_GetEventDescription(event: ?*const SDL_Event, buf: [*]u8, buflen: c_int) c_int;

// Window from event function
extern fn SDL_GetWindowFromEvent(event: ?*const SDL_Event) ?*video.SDL_Window;

// Touch functions
extern fn SDL_GetNumTouchFingers(touchID: touch.SDL_TouchID) c_int;
extern fn SDL_GetTouchFinger(touchID: touch.SDL_TouchID, index: c_int) ?*SDL_Finger;

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
pub const removeEventWatch = SDL_RemoveEventWatch;
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
pub const getEventDescription = SDL_GetEventDescription;
pub const getWindowFromEvent = SDL_GetWindowFromEvent;

// Touch utilities
pub const getNumTouchFingers = SDL_GetNumTouchFingers;
pub const getTouchFinger = SDL_GetTouchFinger;

// === Utility Functions ===
/// Check if an event is a window event
pub fn isWindowEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_WINDOW_FIRST and eventType <= SDL_EVENT_WINDOW_LAST;
}

/// Check if an event is a keyboard event
pub fn isKeyboardEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_KEY_DOWN and eventType <= SDL_EVENT_SCREEN_KEYBOARD_HIDDEN;
}

/// Check if an event is a mouse event
pub fn isMouseEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_MOUSE_MOTION and eventType <= SDL_EVENT_MOUSE_REMOVED;
}

/// Check if an event is a gamepad event
pub fn isGamepadEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_GAMEPAD_AXIS_MOTION and eventType <= SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED;
}

/// Check if an event is a joystick event
pub fn isJoystickEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_JOYSTICK_AXIS_MOTION and eventType <= SDL_EVENT_JOYSTICK_UPDATE_COMPLETE;
}

/// Check if an event is a touch event
pub fn isTouchEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_FINGER_DOWN and eventType <= SDL_EVENT_FINGER_CANCELED;
}

/// Check if an event is a pinch event
pub fn isPinchEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_PINCH_BEGIN and eventType <= SDL_EVENT_PINCH_END;
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
    return eventType >= SDL_EVENT_PEN_PROXIMITY_IN and eventType <= SDL_EVENT_PEN_AXIS;
}

/// Check if an event is a display event
pub fn isDisplayEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_DISPLAY_FIRST and eventType <= SDL_EVENT_DISPLAY_LAST;
}

/// Check if an event is a render event
pub fn isRenderEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_RENDER_TARGETS_RESET and eventType <= SDL_EVENT_RENDER_DEVICE_LOST;
}

/// Check if an event is a user event
pub fn isUserEvent(eventType: SDL_EventType) bool {
    return eventType >= SDL_EVENT_USER;
}
