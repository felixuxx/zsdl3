// SDL3 Input Bindings
// Keyboard, mouse, joystick, gamepad, touch, pen, sensors, HIDAPI

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");
pub const Uint8 = core.Uint8;
pub const Uint16 = core.Uint16;
pub const Uint32 = core.Uint32;
pub const Uint64 = core.Uint64;
pub const Sint16 = core.Sint16;
pub const SDL_WindowID = core.SDL_WindowID;
pub const SDL_JoystickID = core.SDL_JoystickID;
pub const SDL_SensorID = core.SDL_SensorID;
pub const SDL_KeyboardID = Uint32;
pub const SDL_Keymod = core.SDL_Keymod;
pub const SDL_Keycode = core.SDL_Keycode;
pub const SDL_Scancode = core.SDL_Scancode;
pub const SDL_MouseID = Uint32;
pub const SDL_MouseButtonFlags = Uint32;
const guid = @import("guid.zig");
pub const SDL_GUID = guid.SDL_GUID;
const sensor = @import("sensor.zig");
pub const SDL_SensorType = sensor.SDL_SensorType;
pub const SDL_Sensor = sensor.SDL_Sensor;
const power = @import("power.zig");
const surface = @import("surface.zig");
const touch = @import("touch.zig");
pub const SDL_TouchID = touch.SDL_TouchID;
pub const SDL_TouchDeviceType = touch.SDL_TouchDeviceType;
pub const SDL_FingerID = touch.SDL_FingerID;
pub const SDL_Finger = touch.SDL_Finger;
const video = @import("video.zig");
pub const SDL_Cursor = video.SDL_Cursor;

// Import types
// Joystick type
pub const SDL_JoystickType = enum(c_int) {
    SDL_JOYSTICK_TYPE_UNKNOWN,
    SDL_JOYSTICK_TYPE_GAMEPAD,
    SDL_JOYSTICK_TYPE_WHEEL,
    SDL_JOYSTICK_TYPE_ARCADE_STICK,
    SDL_JOYSTICK_TYPE_FLIGHT_STICK,
    SDL_JOYSTICK_TYPE_DANCE_PAD,
    SDL_JOYSTICK_TYPE_GUITAR,
    SDL_JOYSTICK_TYPE_DRUM_KIT,
    SDL_JOYSTICK_TYPE_ARCADE_PAD,
    SDL_JOYSTICK_TYPE_THROTTLE,
};

// Gamepad type
pub const SDL_GamepadType = enum(c_int) {
    SDL_GAMEPAD_TYPE_UNKNOWN = 0,
    SDL_GAMEPAD_TYPE_STANDARD,
    SDL_GAMEPAD_TYPE_XBOX360,
    SDL_GAMEPAD_TYPE_XBOXONE,
    SDL_GAMEPAD_TYPE_PS3,
    SDL_GAMEPAD_TYPE_PS4,
    SDL_GAMEPAD_TYPE_PS5,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR,
    SDL_GAMEPAD_TYPE_GAMECUBE,
    SDL_GAMEPAD_TYPE_COUNT,
};

// Gamepad axis
pub const SDL_GamepadAxis = enum(c_int) {
    SDL_GAMEPAD_AXIS_INVALID = -1,
    SDL_GAMEPAD_AXIS_LEFTX,
    SDL_GAMEPAD_AXIS_LEFTY,
    SDL_GAMEPAD_AXIS_RIGHTX,
    SDL_GAMEPAD_AXIS_RIGHTY,
    SDL_GAMEPAD_AXIS_LEFT_TRIGGER,
    SDL_GAMEPAD_AXIS_RIGHT_TRIGGER,
    SDL_GAMEPAD_AXIS_COUNT,
};

// Gamepad button
pub const SDL_GamepadButton = enum(c_int) {
    SDL_GAMEPAD_BUTTON_INVALID = -1,
    SDL_GAMEPAD_BUTTON_SOUTH,
    SDL_GAMEPAD_BUTTON_EAST,
    SDL_GAMEPAD_BUTTON_WEST,
    SDL_GAMEPAD_BUTTON_NORTH,
    SDL_GAMEPAD_BUTTON_BACK,
    SDL_GAMEPAD_BUTTON_GUIDE,
    SDL_GAMEPAD_BUTTON_START,
    SDL_GAMEPAD_BUTTON_LEFT_STICK,
    SDL_GAMEPAD_BUTTON_RIGHT_STICK,
    SDL_GAMEPAD_BUTTON_LEFT_SHOULDER,
    SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER,
    SDL_GAMEPAD_BUTTON_DPAD_UP,
    SDL_GAMEPAD_BUTTON_DPAD_DOWN,
    SDL_GAMEPAD_BUTTON_DPAD_LEFT,
    SDL_GAMEPAD_BUTTON_DPAD_RIGHT,
    SDL_GAMEPAD_BUTTON_MISC1,
    SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1,
    SDL_GAMEPAD_BUTTON_LEFT_PADDLE1,
    SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2,
    SDL_GAMEPAD_BUTTON_LEFT_PADDLE2,
    SDL_GAMEPAD_BUTTON_TOUCHPAD,
    SDL_GAMEPAD_BUTTON_MISC2,
    SDL_GAMEPAD_BUTTON_MISC3,
    SDL_GAMEPAD_BUTTON_MISC4,
    SDL_GAMEPAD_BUTTON_MISC5,
    SDL_GAMEPAD_BUTTON_MISC6,
    SDL_GAMEPAD_BUTTON_COUNT,
};

// Gamepad button label
pub const SDL_GamepadButtonLabel = enum(c_int) {
    SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN,
    SDL_GAMEPAD_BUTTON_LABEL_A,
    SDL_GAMEPAD_BUTTON_LABEL_B,
    SDL_GAMEPAD_BUTTON_LABEL_X,
    SDL_GAMEPAD_BUTTON_LABEL_Y,
    SDL_GAMEPAD_BUTTON_LABEL_CROSS,
    SDL_GAMEPAD_BUTTON_LABEL_CIRCLE,
    SDL_GAMEPAD_BUTTON_LABEL_SQUARE,
    SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE,
};

// Gamepad binding
pub const SDL_GamepadBindingType = enum(c_int) {
    SDL_GAMEPAD_BINDTYPE_NONE = 0,
    SDL_GAMEPAD_BINDTYPE_BUTTON,
    SDL_GAMEPAD_BINDTYPE_AXIS,
    SDL_GAMEPAD_BINDTYPE_HAT,
};

pub const SDL_GamepadBinding = extern struct {
    input_type: SDL_GamepadBindingType,
    input: extern union {
        button: c_int,
        axis: extern struct {
            axis: c_int,
            axis_min: c_int,
            axis_max: c_int,
        },
        hat: extern struct {
            hat: c_int,
            hat_mask: c_int,
        },
    },
    output_type: SDL_GamepadBindingType,
    output: extern union {
        button: SDL_GamepadButton,
        axis: extern struct {
            axis: SDL_GamepadAxis,
            axis_min: c_int,
            axis_max: c_int,
        },
    },
};

// Johystick connection state
pub const SDL_JoystickConnectionState = enum(c_int) {
    SDL_JOYSTICK_CONNECTION_INVALID = -1,
    SDL_JOYSTICK_CONNECTION_UNKNOWN,
    SDL_JOYSTICK_CONNECTION_WIRED,
    SDL_JOYSTICK_CONNECTION_WIRELESS,
};

// Virtual joystick types
pub const SDL_VirtualJoystickTouchpadDesc = extern struct {
    nfingers: Uint16,
    padding: [3]Uint16,
};

pub const SDL_VirtualJoystickSensorDesc = extern struct {
    sensor_type: SDL_SensorType,
    rate: f32,
};

pub const SDL_VirtualJoystickDesc = extern struct {
    version: Uint32,
    type: Uint16,
    padding: Uint16,
    vendor_id: Uint16,
    product_id: Uint16,
    naxes: Uint16,
    nbuttons: Uint16,
    nballs: Uint16,
    nhats: Uint16,
    ntouchpads: Uint16,
    nsensors: Uint16,
    padding2: [2]Uint16,
    button_mask: Uint32,
    axis_mask: Uint32,
    name: ?[*:0]const u8,
    touchpads: ?*const SDL_VirtualJoystickTouchpadDesc,
    sensors: ?*const SDL_VirtualJoystickSensorDesc,
    userdata: ?*anyopaque,
    update: ?*const fn (userdata: ?*anyopaque) callconv(.c) void,
    setPlayerIndex: ?*const fn (userdata: ?*anyopaque, player_index: c_int) callconv(.c) void,
    rumble: ?*const fn (userdata: ?*anyopaque, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool,
    rumbleTriggers: ?*const fn (userdata: ?*anyopaque, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool,
    setLED: ?*const fn (userdata: ?*anyopaque, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool,
    sendEffect: ?*const fn (userdata: ?*anyopaque, data: ?*const anyopaque, size: c_int) callconv(.c) bool,
    setSensorsEnabled: ?*const fn (userdata: ?*anyopaque, enabled: bool) callconv(.c) bool,
    cleanup: ?*const fn (userdata: ?*anyopaque) callconv(.c) void,
};

// Keyboard
// Mouse
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
pub const SDL_MouseWheelDirection = enum(c_int) {
    SDL_MOUSEWHEEL_NORMAL,
    SDL_MOUSEWHEEL_FLIPPED,
};

// Special mouse IDs for touch/pen virtual mouse
pub const SDL_TOUCH_MOUSEID: SDL_MouseID = 0xFFFFFFFF;
pub const SDL_PEN_MOUSEID: SDL_MouseID = 0xFFFFFFFE;

// Joystick/Gamepad
pub const SDL_Joystick = opaque {};
pub const SDL_Gamepad = opaque {};

// Keyboard functions
pub const PFN_SDL_HasKeyboard = *const fn () callconv(.c) bool;
pub const PFN_SDL_GetKeyboards = *const fn (count: ?*c_int) callconv(.c) ?[*]SDL_KeyboardID;
pub const PFN_SDL_GetKeyboardNameForID = *const fn (instance_id: SDL_KeyboardID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetKeyboardFocus = *const fn () callconv(.c) ?*video.SDL_Window;
pub const PFN_SDL_GetKeyboardState = *const fn (numkeys: ?*c_int) callconv(.c) ?[*]const bool;
pub const PFN_SDL_ResetKeyboard = *const fn () callconv(.c) void;
pub const PFN_SDL_GetModState = *const fn () callconv(.c) SDL_Keymod;
pub const PFN_SDL_SetModState = *const fn (modstate: SDL_Keymod) callconv(.c) void;
pub const PFN_SDL_GetKeyFromScancode = *const fn (scancode: SDL_Scancode, modstate: SDL_Keymod, key_event: bool) callconv(.c) SDL_Keycode;
pub const PFN_SDL_GetScancodeFromKey = *const fn (key: SDL_Keycode, modstate: ?*SDL_Keymod) callconv(.c) SDL_Scancode;
pub const PFN_SDL_SetScancodeName = *const fn (scancode: SDL_Scancode, name: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GetScancodeName = *const fn (scancode: SDL_Scancode) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetScancodeFromName = *const fn (name: [*:0]const u8) callconv(.c) SDL_Scancode;
pub const PFN_SDL_GetKeyName = *const fn (key: SDL_Keycode) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetKeyFromName = *const fn (name: [*:0]const u8) callconv(.c) SDL_Keycode;
pub const PFN_SDL_StartTextInput = *const fn (window: ?*video.SDL_Window) callconv(.c) bool;
pub const PFN_SDL_StartTextInputWithProperties = *const fn (window: ?*video.SDL_Window, props: core.SDL_PropertiesID) callconv(.c) bool;
pub const PFN_SDL_StopTextInput = *const fn (window: ?*video.SDL_Window) callconv(.c) bool;
pub const PFN_SDL_TextInputActive = *const fn (window: ?*video.SDL_Window) callconv(.c) bool;
pub const PFN_SDL_ClearComposition = *const fn (window: ?*video.SDL_Window) callconv(.c) bool;
const pixels = @import("pixels.zig");
pub const PFN_SDL_SetTextInputArea = *const fn (window: ?*video.SDL_Window, rect: ?*const pixels.SDL_Rect, cursor: c_int) callconv(.c) bool;
pub const PFN_SDL_GetTextInputArea = *const fn (window: ?*video.SDL_Window, rect: ?*pixels.SDL_Rect, cursor: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_HasScreenKeyboardSupport = *const fn () callconv(.c) bool;
pub const PFN_SDL_ScreenKeyboardShown = *const fn (window: ?*video.SDL_Window) callconv(.c) bool;

// Mouse functions
pub const PFN_SDL_HasMouse = *const fn () callconv(.c) bool;
pub const PFN_SDL_GetMice = *const fn (count: ?*c_int) callconv(.c) ?[*]SDL_MouseID;
pub const PFN_SDL_GetMouseNameForID = *const fn (instance_id: SDL_MouseID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetMouseFocus = *const fn () callconv(.c) ?*video.SDL_Window;
pub const PFN_SDL_GetMouseState = *const fn (x: ?*f32, y: ?*f32) callconv(.c) SDL_MouseButtonFlags;
pub const PFN_SDL_GetGlobalMouseState = *const fn (x: ?*f32, y: ?*f32) callconv(.c) SDL_MouseButtonFlags;
pub const PFN_SDL_GetRelativeMouseState = *const fn (x: ?*f32, y: ?*f32) callconv(.c) SDL_MouseButtonFlags;
pub const PFN_SDL_WarpMouseInWindow = *const fn (window: ?*video.SDL_Window, x: f32, y: f32) callconv(.c) void;
pub const PFN_SDL_WarpMouseGlobal = *const fn (x: f32, y: f32) callconv(.c) bool;
pub const PFN_SDL_CaptureMouse = *const fn (enabled: bool) callconv(.c) bool;

pub const PFN_SDL_SetWindowRelativeMouseMode = *const fn (window: ?*video.SDL_Window, enabled: bool) callconv(.c) bool;
pub const PFN_SDL_GetWindowRelativeMouseMode = *const fn (window: ?*video.SDL_Window) callconv(.c) bool;
pub const PFN_SDL_SetRelativeMouseTransform = *const fn (callback: ?*const fn (?*anyopaque, core.Uint64, ?*video.SDL_Window, SDL_MouseID, ?*f32, ?*f32) callconv(.c) void, userdata: ?*anyopaque) callconv(.c) bool;


// Cursor functions
pub const SDL_CursorFrameInfo = extern struct {
    surface: ?*surface.SDL_Surface,
    duration: Uint32,
};
pub const PFN_SDL_CreateCursor = *const fn (data: ?[*]const Uint8, mask: ?[*]const Uint8, w: c_int, h: c_int, hot_x: c_int, hot_y: c_int) callconv(.c) ?*SDL_Cursor;
pub const PFN_SDL_CreateColorCursor = *const fn (surface: ?*surface.SDL_Surface, hot_x: c_int, hot_y: c_int) callconv(.c) ?*SDL_Cursor;
pub const PFN_SDL_CreateAnimatedCursor = *const fn (frames: ?[*]SDL_CursorFrameInfo, frame_count: c_int, hot_x: c_int, hot_y: c_int) callconv(.c) ?*SDL_Cursor;
pub const PFN_SDL_CreateSystemCursor = *const fn (id: SDL_SystemCursor) callconv(.c) ?*SDL_Cursor;
pub const PFN_SDL_SetCursor = *const fn (cursor: ?*SDL_Cursor) callconv(.c) bool;
pub const PFN_SDL_GetCursor = *const fn () callconv(.c) ?*SDL_Cursor;
pub const PFN_SDL_GetDefaultCursor = *const fn () callconv(.c) ?*SDL_Cursor;
pub const PFN_SDL_DestroyCursor = *const fn (cursor: ?*SDL_Cursor) callconv(.c) void;
pub const PFN_SDL_ShowCursor = *const fn () callconv(.c) bool;
pub const PFN_SDL_HideCursor = *const fn () callconv(.c) bool;
pub const PFN_SDL_CursorVisible = *const fn () callconv(.c) bool;

// Joystick functions
pub const PFN_SDL_GetJoysticks = *const fn (count: ?*c_int) callconv(.c) ?[*]SDL_JoystickID;
pub const PFN_SDL_OpenJoystick = *const fn (instance_id: c_int) callconv(.c) ?*SDL_Joystick;
pub const PFN_SDL_CloseJoystick = *const fn (joystick: ?*SDL_Joystick) callconv(.c) void;
pub const PFN_SDL_GetJoystickName = *const fn (joystick: ?*SDL_Joystick) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetJoystickPath = *const fn (joystick: ?*SDL_Joystick) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetJoystickType = *const fn (joystick: ?*SDL_Joystick) callconv(.c) SDL_JoystickType;
pub const PFN_SDL_GetJoystickGUID = *const fn (joystick: ?*SDL_Joystick) callconv(.c) SDL_GUID;
pub const PFN_SDL_GetJoystickVendor = *const fn (joystick: ?*SDL_Joystick) callconv(.c) Uint16;
pub const PFN_SDL_GetJoystickProduct = *const fn (joystick: ?*SDL_Joystick) callconv(.c) Uint16;
pub const PFN_SDL_GetJoystickProductVersion = *const fn (joystick: ?*SDL_Joystick) callconv(.c) Uint16;
pub const PFN_SDL_GetJoystickFirmwareVersion = *const fn (joystick: ?*SDL_Joystick) callconv(.c) Uint16;
pub const PFN_SDL_GetJoystickSerial = *const fn (joystick: ?*SDL_Joystick) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetJoystickAxis = *const fn (joystick: ?*SDL_Joystick, axis: c_int) callconv(.c) Sint16;
pub const PFN_SDL_GetJoystickHat = *const fn (joystick: ?*SDL_Joystick, hat: c_int) callconv(.c) Uint8;
pub const PFN_SDL_GetJoystickBall = *const fn (joystick: ?*SDL_Joystick, ball: c_int, dx: ?*c_int, dy: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_GetJoystickButton = *const fn (joystick: ?*SDL_Joystick, button: c_int) callconv(.c) bool;
pub const PFN_SDL_RumbleJoystick = *const fn (joystick: ?*SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16, duration_ms: Uint32) callconv(.c) bool;
pub const PFN_SDL_RumbleJoystickTriggers = *const fn (joystick: ?*SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16, duration_ms: Uint32) callconv(.c) bool;
pub const PFN_SDL_SetJoystickLED = *const fn (joystick: ?*SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool;
pub const PFN_SDL_SendJoystickEffect = *const fn (joystick: ?*SDL_Joystick, data: ?*anyopaque, size: c_int) callconv(.c) bool;
pub const PFN_SDL_GetJoystickFromID = *const fn (instance_id: SDL_JoystickID) callconv(.c) ?*SDL_Joystick;
pub const PFN_SDL_GetJoystickFromPlayerIndex = *const fn (player_index: c_int) callconv(.c) ?*SDL_Joystick;
pub const PFN_SDL_GetJoystickID = *const fn (joystick: ?*SDL_Joystick) callconv(.c) SDL_JoystickID;
pub const PFN_SDL_GetNumJoystickAxes = *const fn (joystick: ?*SDL_Joystick) callconv(.c) c_int;
pub const PFN_SDL_GetNumJoystickBalls = *const fn (joystick: ?*SDL_Joystick) callconv(.c) c_int;
pub const PFN_SDL_GetNumJoystickButtons = *const fn (joystick: ?*SDL_Joystick) callconv(.c) c_int;
pub const PFN_SDL_GetNumJoystickHats = *const fn (joystick: ?*SDL_Joystick) callconv(.c) c_int;
pub const PFN_SDL_GetJoystickAxisInitialState = *const fn (joystick: ?*SDL_Joystick, axis: c_int, state: ?*Sint16) callconv(.c) bool;
pub const PFN_SDL_GetJoystickPlayerIndex = *const fn (joystick: ?*SDL_Joystick) callconv(.c) c_int;
pub const PFN_SDL_SetJoystickPlayerIndex = *const fn (joystick: ?*SDL_Joystick, player_index: c_int) callconv(.c) bool;
pub const PFN_SDL_GetJoystickConnectionState = *const fn (joystick: ?*SDL_Joystick) callconv(.c) SDL_JoystickConnectionState;
pub const PFN_SDL_GetJoystickPowerInfo = *const fn (joystick: ?*SDL_Joystick, percent: ?*c_int) callconv(.c) power.SDL_PowerState;
pub const PFN_SDL_JoystickConnected = *const fn (joystick: ?*SDL_Joystick) callconv(.c) bool;
pub const PFN_SDL_JoystickEventsEnabled = *const fn () callconv(.c) bool;
pub const PFN_SDL_SetJoystickEventsEnabled = *const fn (enabled: bool) callconv(.c) void;
pub const PFN_SDL_GetJoystickProperties = *const fn (joystick: ?*SDL_Joystick) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_HasJoystick = *const fn () callconv(.c) bool;
pub const PFN_SDL_UpdateJoysticks = *const fn () callconv(.c) void;
pub const PFN_SDL_LockJoysticks = *const fn () callconv(.c) void;
pub const PFN_SDL_UnlockJoysticks = *const fn () callconv(.c) void;
pub const PFN_SDL_GetJoystickGUIDForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) SDL_GUID;
pub const PFN_SDL_GetJoystickGUIDInfo = *const fn (guid: SDL_GUID, vendor: ?*Uint16, product: ?*Uint16, version: ?*Uint16, crc16: ?*Uint16) callconv(.c) void;
pub const PFN_SDL_GetJoystickNameForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetJoystickPathForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetJoystickPlayerIndexForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) c_int;
pub const PFN_SDL_GetJoystickProductForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) Uint16;
pub const PFN_SDL_GetJoystickProductVersionForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) Uint16;
pub const PFN_SDL_GetJoystickVendorForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) Uint16;
pub const PFN_SDL_GetJoystickTypeForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) SDL_JoystickType;
pub const PFN_SDL_IsJoystickVirtual = *const fn (instance_id: SDL_JoystickID) callconv(.c) bool;
pub const PFN_SDL_AttachVirtualJoystick = *const fn (desc: ?*const SDL_VirtualJoystickDesc) callconv(.c) SDL_JoystickID;
pub const PFN_SDL_DetachVirtualJoystick = *const fn (instance_id: SDL_JoystickID) callconv(.c) bool;
pub const PFN_SDL_SetJoystickVirtualAxis = *const fn (joystick: ?*SDL_Joystick, axis: c_int, value: Sint16) callconv(.c) bool;
pub const PFN_SDL_SetJoystickVirtualBall = *const fn (joystick: ?*SDL_Joystick, ball: c_int, xrel: Sint16, yrel: Sint16) callconv(.c) bool;
pub const PFN_SDL_SetJoystickVirtualButton = *const fn (joystick: ?*SDL_Joystick, button: c_int, down: bool) callconv(.c) bool;
pub const PFN_SDL_SetJoystickVirtualHat = *const fn (joystick: ?*SDL_Joystick, hat: c_int, value: Uint8) callconv(.c) bool;
pub const PFN_SDL_SetJoystickVirtualTouchpad = *const fn (joystick: ?*SDL_Joystick, touchpad: c_int, finger: c_int, down: bool, x: f32, y: f32, pressure: f32) callconv(.c) bool;
pub const PFN_SDL_SendJoystickVirtualSensorData = *const fn (joystick: ?*SDL_Joystick, sensor_type: SDL_SensorType, sensor_timestamp: Uint64, data: ?[*]const f32, num_values: c_int) callconv(.c) bool;

// Gamepad functions

pub const PFN_SDL_IsGamepad = *const fn (instance_id: c_int) callconv(.c) bool;
pub const PFN_SDL_OpenGamepad = *const fn (instance_id: c_int) callconv(.c) ?*SDL_Gamepad;
pub const PFN_SDL_CloseGamepad = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) void;
pub const PFN_SDL_GetGamepadName = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetGamepadPath = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetGamepadType = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) SDL_GamepadType;

pub const PFN_SDL_GetGamepadVendor = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) Uint16;
pub const PFN_SDL_GetGamepadProduct = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) Uint16;
pub const PFN_SDL_GetGamepadProductVersion = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) Uint16;
pub const PFN_SDL_GetGamepadFirmwareVersion = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) Uint16;
pub const PFN_SDL_GetGamepadSerial = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GamepadHasAxis = *const fn (gamepad: ?*SDL_Gamepad, axis: SDL_GamepadAxis) callconv(.c) bool;
pub const PFN_SDL_GetGamepadAxis = *const fn (gamepad: ?*SDL_Gamepad, axis: SDL_GamepadAxis) callconv(.c) Sint16;
pub const PFN_SDL_GamepadHasButton = *const fn (gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) callconv(.c) bool;
pub const PFN_SDL_GetGamepadButton = *const fn (gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) callconv(.c) bool;
pub const PFN_SDL_GetGamepadButtonLabel = *const fn (gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) callconv(.c) SDL_GamepadButtonLabel;
pub const PFN_SDL_SetGamepadEventsEnabled = *const fn (enabled: bool) callconv(.c) void;
pub const PFN_SDL_GamepadEventsEnabled = *const fn () callconv(.c) bool;
pub const PFN_SDL_GetGamepadBindings = *const fn (gamepad: ?*SDL_Gamepad, count: ?*c_int) callconv(.c) ?[*]?*SDL_GamepadBinding;
pub const PFN_SDL_ReloadGamepadMappings = *const fn () callconv(.c) bool;
pub const PFN_SDL_GetGamepadMapping = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_AddGamepadMapping = *const fn (mapping: ?[*:0]const u8) callconv(.c) c_int;
const filesystem = @import("filesystem.zig");
pub const PFN_SDL_AddGamepadMappingsFromFile = *const fn (file: [*:0]const u8) callconv(.c) c_int;
pub const PFN_SDL_AddGamepadMappingsFromIO = *const fn (src: ?*filesystem.SDL_IOStream, closeio: bool) callconv(.c) c_int;
pub const PFN_SDL_GetGamepadMappings = *const fn (count: ?*c_int) callconv(.c) ?[*]?[*:0]u8;
pub const PFN_SDL_GetGamepadMappingForGUID = *const fn (guid: SDL_GUID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetGamepadMappingForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_SetGamepadMapping = *const fn (instance_id: SDL_JoystickID, mapping: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GetGamepadPlayerIndexForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) c_int;
pub const PFN_SDL_GetRealGamepadTypeForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) SDL_GamepadType;
pub const PFN_SDL_GetRealGamepadType = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) SDL_GamepadType;
pub const PFN_SDL_GetNumGamepadTouchpads = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) c_int;
pub const PFN_SDL_GetNumGamepadTouchpadFingers = *const fn (gamepad: ?*SDL_Gamepad, touchpad: c_int) callconv(.c) c_int;
pub const PFN_SDL_GetGamepadTouchpadFinger = *const fn (gamepad: ?*SDL_Gamepad, touchpad: c_int, finger: c_int, down: ?*bool, x: ?*f32, y: ?*f32, pressure: ?*f32) callconv(.c) bool;
pub const PFN_SDL_GetGamepadAppleSFSymbolsNameForAxis = *const fn (gamepad: ?*SDL_Gamepad, axis: SDL_GamepadAxis) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetGamepadAppleSFSymbolsNameForButton = *const fn (gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_HasGamepad = *const fn () callconv(.c) bool;
pub const PFN_SDL_GetGamepads = *const fn (count: ?*c_int) callconv(.c) ?[*]SDL_JoystickID;
pub const PFN_SDL_GetGamepadNameForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetGamepadPathForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetGamepadTypeForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) SDL_GamepadType;
pub const PFN_SDL_GetGamepadGUIDForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) SDL_GUID;
pub const PFN_SDL_GetGamepadVendorForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) Uint16;
pub const PFN_SDL_GetGamepadProductForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) Uint16;
pub const PFN_SDL_GetGamepadProductVersionForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) Uint16;
pub const PFN_SDL_GetGamepadFirmwareVersionForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) Uint16;
pub const PFN_SDL_GetGamepadSerialForID = *const fn (instance_id: SDL_JoystickID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GamepadConnected = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) bool;
pub const PFN_SDL_GetGamepadID = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) SDL_JoystickID;
pub const PFN_SDL_GetGamepadFromID = *const fn (instance_id: SDL_JoystickID) callconv(.c) ?*SDL_Gamepad;
pub const PFN_SDL_GetGamepadFromPlayerIndex = *const fn (player_index: c_int) callconv(.c) ?*SDL_Gamepad;
pub const PFN_SDL_GetGamepadPlayerIndex = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) c_int;
pub const PFN_SDL_SetGamepadPlayerIndex = *const fn (gamepad: ?*SDL_Gamepad, player_index: c_int) callconv(.c) bool;
pub const PFN_SDL_RumbleGamepad = *const fn (gamepad: ?*SDL_Gamepad, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16, duration_ms: Uint32) callconv(.c) bool;
pub const PFN_SDL_RumbleGamepadTriggers = *const fn (gamepad: ?*SDL_Gamepad, left_rumble: Uint16, right_rumble: Uint16, duration_ms: Uint32) callconv(.c) bool;
pub const PFN_SDL_SetGamepadLED = *const fn (gamepad: ?*SDL_Gamepad, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool;
pub const PFN_SDL_SendGamepadEffect = *const fn (gamepad: ?*SDL_Gamepad, data: ?*anyopaque, size: c_int) callconv(.c) bool;
pub const PFN_SDL_GetGamepadSensorData = *const fn (gamepad: ?*SDL_Gamepad, sensor: SDL_SensorType, data: ?[*]f32, num_values: c_int) callconv(.c) bool;
pub const PFN_SDL_SetGamepadSensorEnabled = *const fn (gamepad: ?*SDL_Gamepad, sensor: SDL_SensorType, enabled: bool) callconv(.c) bool;
pub const PFN_SDL_GamepadSensorEnabled = *const fn (gamepad: ?*SDL_Gamepad, sensor: SDL_SensorType) callconv(.c) bool;
pub const PFN_SDL_GetGamepadProperties = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_GamepadHasSensor = *const fn (gamepad: ?*SDL_Gamepad, sensor: SDL_SensorType) callconv(.c) bool;
pub const PFN_SDL_GetGamepadAxisFromString = *const fn (str: ?[*:0]const u8) callconv(.c) SDL_GamepadAxis;
pub const PFN_SDL_GetGamepadButtonFromString = *const fn (str: ?[*:0]const u8) callconv(.c) SDL_GamepadButton;
pub const PFN_SDL_GetGamepadButtonLabelForType = *const fn (gamepad_type: SDL_GamepadType, button: SDL_GamepadButton) callconv(.c) SDL_GamepadButtonLabel;
pub const PFN_SDL_GetGamepadConnectionState = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) SDL_JoystickConnectionState;
pub const PFN_SDL_GetGamepadJoystick = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) ?*SDL_Joystick;
pub const PFN_SDL_GetGamepadPowerInfo = *const fn (gamepad: ?*SDL_Gamepad, percent: ?*c_int) callconv(.c) power.SDL_PowerState;
pub const PFN_SDL_GetGamepadSensorDataRate = *const fn (gamepad: ?*SDL_Gamepad, sensor: SDL_SensorType) callconv(.c) f32;
pub const PFN_SDL_GetGamepadSteamHandle = *const fn (gamepad: ?*SDL_Gamepad) callconv(.c) Uint64;
pub const PFN_SDL_GetGamepadStringForAxis = *const fn (axis: SDL_GamepadAxis) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetGamepadStringForButton = *const fn (button: SDL_GamepadButton) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetGamepadStringForType = *const fn (gamepad_type: SDL_GamepadType) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetGamepadTypeFromString = *const fn (str: ?[*:0]const u8) callconv(.c) SDL_GamepadType;
pub const PFN_SDL_UpdateGamepads = *const fn () callconv(.c) void;

//Touch functions
pub const PFN_SDL_GetTouchDeviceType = *const fn (device_id: SDL_TouchID) callconv(.c) SDL_TouchDeviceType;


//Sensor functions
pub const PFN_SDL_GetSensorFromID = *const fn (instance_id: SDL_SensorID) callconv(.c) ?*SDL_Sensor;
pub const PFN_SDL_GetSensorName = *const fn (sensor: ?*SDL_Sensor) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetSensorType = *const fn (sensor: ?*SDL_Sensor) callconv(.c) SDL_SensorType;
pub const PFN_SDL_GetSensorNonPortableType = *const fn (sensor: ?*SDL_Sensor) callconv(.c) c_int;
pub const PFN_SDL_GetSensorInstanceID = *const fn (sensor: ?*SDL_Sensor) callconv(.c) SDL_SensorID;

pub const InputFunctions = extern struct {
    hasKeyboard: PFN_SDL_HasKeyboard,
    getKeyboards: PFN_SDL_GetKeyboards,
    getKeyboardNameForID: PFN_SDL_GetKeyboardNameForID,
    getKeyboardFocus: PFN_SDL_GetKeyboardFocus,
    getKeyboardState: PFN_SDL_GetKeyboardState,
    resetKeyboard: PFN_SDL_ResetKeyboard,
    getModState: PFN_SDL_GetModState,
    setModState: PFN_SDL_SetModState,
    getKeyFromScancode: PFN_SDL_GetKeyFromScancode,
    getScancodeFromKey: PFN_SDL_GetScancodeFromKey,
    setScancodeName: PFN_SDL_SetScancodeName,
    getScancodeName: PFN_SDL_GetScancodeName,
    getScancodeFromName: PFN_SDL_GetScancodeFromName,
    getKeyName: PFN_SDL_GetKeyName,
    getKeyFromName: PFN_SDL_GetKeyFromName,
    startTextInput: PFN_SDL_StartTextInput,
    startTextInputWithProperties: PFN_SDL_StartTextInputWithProperties,
    stopTextInput: PFN_SDL_StopTextInput,
    textInputActive: PFN_SDL_TextInputActive,
    clearComposition: PFN_SDL_ClearComposition,
    setTextInputArea: PFN_SDL_SetTextInputArea,
    getTextInputArea: PFN_SDL_GetTextInputArea,
    hasScreenKeyboardSupport: PFN_SDL_HasScreenKeyboardSupport,
    screenKeyboardShown: PFN_SDL_ScreenKeyboardShown,
    hasMouse: PFN_SDL_HasMouse,
    getMice: PFN_SDL_GetMice,
    getMouseNameForID: PFN_SDL_GetMouseNameForID,
    getMouseFocus: PFN_SDL_GetMouseFocus,
    getMouseState: PFN_SDL_GetMouseState,
    getGlobalMouseState: PFN_SDL_GetGlobalMouseState,
    getRelativeMouseState: PFN_SDL_GetRelativeMouseState,
    warpMouseInWindow: PFN_SDL_WarpMouseInWindow,
    warpMouseGlobal: PFN_SDL_WarpMouseGlobal,
    captureMouse: PFN_SDL_CaptureMouse,
    setWindowRelativeMouseMode: PFN_SDL_SetWindowRelativeMouseMode,
    getWindowRelativeMouseMode: PFN_SDL_GetWindowRelativeMouseMode,
    setRelativeMouseTransform: PFN_SDL_SetRelativeMouseTransform,
    createCursor: PFN_SDL_CreateCursor,
    createColorCursor: PFN_SDL_CreateColorCursor,
    createAnimatedCursor: PFN_SDL_CreateAnimatedCursor,
    createSystemCursor: PFN_SDL_CreateSystemCursor,
    setCursor: PFN_SDL_SetCursor,
    getCursor: PFN_SDL_GetCursor,
    getDefaultCursor: PFN_SDL_GetDefaultCursor,
    destroyCursor: PFN_SDL_DestroyCursor,
    showCursor: PFN_SDL_ShowCursor,
    hideCursor: PFN_SDL_HideCursor,
    cursorVisible: PFN_SDL_CursorVisible,
    getJoysticks: PFN_SDL_GetJoysticks,
    openJoystick: PFN_SDL_OpenJoystick,
    closeJoystick: PFN_SDL_CloseJoystick,
    getJoystickName: PFN_SDL_GetJoystickName,
    getJoystickPath: PFN_SDL_GetJoystickPath,
    getJoystickType: PFN_SDL_GetJoystickType,
    getJoystickGUID: PFN_SDL_GetJoystickGUID,
    getJoystickVendor: PFN_SDL_GetJoystickVendor,
    getJoystickProduct: PFN_SDL_GetJoystickProduct,
    getJoystickProductVersion: PFN_SDL_GetJoystickProductVersion,
    getJoystickFirmwareVersion: PFN_SDL_GetJoystickFirmwareVersion,
    getJoystickSerial: PFN_SDL_GetJoystickSerial,
    getJoystickAxis: PFN_SDL_GetJoystickAxis,
    getJoystickHat: PFN_SDL_GetJoystickHat,
    getJoystickBall: PFN_SDL_GetJoystickBall,
    getJoystickButton: PFN_SDL_GetJoystickButton,
    rumbleJoystick: PFN_SDL_RumbleJoystick,
    rumbleJoystickTriggers: PFN_SDL_RumbleJoystickTriggers,
    setJoystickLED: PFN_SDL_SetJoystickLED,
    sendJoystickEffect: PFN_SDL_SendJoystickEffect,
    getJoystickFromID: PFN_SDL_GetJoystickFromID,
    getJoystickFromPlayerIndex: PFN_SDL_GetJoystickFromPlayerIndex,
    getJoystickID: PFN_SDL_GetJoystickID,
    getNumJoystickAxes: PFN_SDL_GetNumJoystickAxes,
    getNumJoystickBalls: PFN_SDL_GetNumJoystickBalls,
    getNumJoystickButtons: PFN_SDL_GetNumJoystickButtons,
    getNumJoystickHats: PFN_SDL_GetNumJoystickHats,
    getJoystickAxisInitialState: PFN_SDL_GetJoystickAxisInitialState,
    getJoystickPlayerIndex: PFN_SDL_GetJoystickPlayerIndex,
    setJoystickPlayerIndex: PFN_SDL_SetJoystickPlayerIndex,
    getJoystickConnectionState: PFN_SDL_GetJoystickConnectionState,
    getJoystickPowerInfo: PFN_SDL_GetJoystickPowerInfo,
    joystickConnected: PFN_SDL_JoystickConnected,
    joystickEventsEnabled: PFN_SDL_JoystickEventsEnabled,
    setJoystickEventsEnabled: PFN_SDL_SetJoystickEventsEnabled,
    getJoystickProperties: PFN_SDL_GetJoystickProperties,
    hasJoystick: PFN_SDL_HasJoystick,
    updateJoysticks: PFN_SDL_UpdateJoysticks,
    lockJoysticks: PFN_SDL_LockJoysticks,
    unlockJoysticks: PFN_SDL_UnlockJoysticks,
    getJoystickGUIDForID: PFN_SDL_GetJoystickGUIDForID,
    getJoystickGUIDInfo: PFN_SDL_GetJoystickGUIDInfo,
    getJoystickNameForID: PFN_SDL_GetJoystickNameForID,
    getJoystickPathForID: PFN_SDL_GetJoystickPathForID,
    getJoystickPlayerIndexForID: PFN_SDL_GetJoystickPlayerIndexForID,
    getJoystickProductForID: PFN_SDL_GetJoystickProductForID,
    getJoystickProductVersionForID: PFN_SDL_GetJoystickProductVersionForID,
    getJoystickVendorForID: PFN_SDL_GetJoystickVendorForID,
    getJoystickTypeForID: PFN_SDL_GetJoystickTypeForID,
    isJoystickVirtual: PFN_SDL_IsJoystickVirtual,
    attachVirtualJoystick: PFN_SDL_AttachVirtualJoystick,
    detachVirtualJoystick: PFN_SDL_DetachVirtualJoystick,
    setJoystickVirtualAxis: PFN_SDL_SetJoystickVirtualAxis,
    setJoystickVirtualBall: PFN_SDL_SetJoystickVirtualBall,
    setJoystickVirtualButton: PFN_SDL_SetJoystickVirtualButton,
    setJoystickVirtualHat: PFN_SDL_SetJoystickVirtualHat,
    setJoystickVirtualTouchpad: PFN_SDL_SetJoystickVirtualTouchpad,
    sendJoystickVirtualSensorData: PFN_SDL_SendJoystickVirtualSensorData,
    isGamepad: PFN_SDL_IsGamepad,
    openGamepad: PFN_SDL_OpenGamepad,
    closeGamepad: PFN_SDL_CloseGamepad,
    getGamepadName: PFN_SDL_GetGamepadName,
    getGamepadPath: PFN_SDL_GetGamepadPath,
    getGamepadType: PFN_SDL_GetGamepadType,
    getGamepadVendor: PFN_SDL_GetGamepadVendor,
    getGamepadProduct: PFN_SDL_GetGamepadProduct,
    getGamepadProductVersion: PFN_SDL_GetGamepadProductVersion,
    getGamepadFirmwareVersion: PFN_SDL_GetGamepadFirmwareVersion,
    getGamepadSerial: PFN_SDL_GetGamepadSerial,
    gamepadHasAxis: PFN_SDL_GamepadHasAxis,
    getGamepadAxis: PFN_SDL_GetGamepadAxis,
    gamepadHasButton: PFN_SDL_GamepadHasButton,
    getGamepadButton: PFN_SDL_GetGamepadButton,
    getGamepadButtonLabel: PFN_SDL_GetGamepadButtonLabel,
    setGamepadEventsEnabled: PFN_SDL_SetGamepadEventsEnabled,
    gamepadEventsEnabled: PFN_SDL_GamepadEventsEnabled,
    getGamepadBindings: PFN_SDL_GetGamepadBindings,
    reloadGamepadMappings: PFN_SDL_ReloadGamepadMappings,
    getGamepadMapping: PFN_SDL_GetGamepadMapping,
    addGamepadMapping: PFN_SDL_AddGamepadMapping,
    addGamepadMappingsFromFile: PFN_SDL_AddGamepadMappingsFromFile,
    addGamepadMappingsFromIO: PFN_SDL_AddGamepadMappingsFromIO,
    getGamepadMappings: PFN_SDL_GetGamepadMappings,
    getGamepadMappingForGUID: PFN_SDL_GetGamepadMappingForGUID,
    getGamepadMappingForID: PFN_SDL_GetGamepadMappingForID,
    setGamepadMapping: PFN_SDL_SetGamepadMapping,
    getGamepadPlayerIndexForID: PFN_SDL_GetGamepadPlayerIndexForID,
    getRealGamepadTypeForID: PFN_SDL_GetRealGamepadTypeForID,
    getRealGamepadType: PFN_SDL_GetRealGamepadType,
    getNumGamepadTouchpads: PFN_SDL_GetNumGamepadTouchpads,
    getNumGamepadTouchpadFingers: PFN_SDL_GetNumGamepadTouchpadFingers,
    getGamepadTouchpadFinger: PFN_SDL_GetGamepadTouchpadFinger,
    getGamepadAppleSFSymbolsNameForAxis: PFN_SDL_GetGamepadAppleSFSymbolsNameForAxis,
    getGamepadAppleSFSymbolsNameForButton: PFN_SDL_GetGamepadAppleSFSymbolsNameForButton,
    hasGamepad: PFN_SDL_HasGamepad,
    getGamepads: PFN_SDL_GetGamepads,
    getGamepadNameForID: PFN_SDL_GetGamepadNameForID,
    getGamepadPathForID: PFN_SDL_GetGamepadPathForID,
    getGamepadTypeForID: PFN_SDL_GetGamepadTypeForID,
    getGamepadGUIDForID: PFN_SDL_GetGamepadGUIDForID,
    getGamepadVendorForID: PFN_SDL_GetGamepadVendorForID,
    getGamepadProductForID: PFN_SDL_GetGamepadProductForID,
    getGamepadProductVersionForID: PFN_SDL_GetGamepadProductVersionForID,
    getGamepadFirmwareVersionForID: ?PFN_SDL_GetGamepadFirmwareVersionForID,
    getGamepadSerialForID: ?PFN_SDL_GetGamepadSerialForID,
    gamepadConnected: PFN_SDL_GamepadConnected,
    getGamepadID: PFN_SDL_GetGamepadID,
    getGamepadFromID: PFN_SDL_GetGamepadFromID,
    getGamepadFromPlayerIndex: PFN_SDL_GetGamepadFromPlayerIndex,
    getGamepadPlayerIndex: PFN_SDL_GetGamepadPlayerIndex,
    setGamepadPlayerIndex: PFN_SDL_SetGamepadPlayerIndex,
    rumbleGamepad: PFN_SDL_RumbleGamepad,
    rumbleGamepadTriggers: PFN_SDL_RumbleGamepadTriggers,
    setGamepadLED: PFN_SDL_SetGamepadLED,
    sendGamepadEffect: PFN_SDL_SendGamepadEffect,
    getGamepadSensorData: PFN_SDL_GetGamepadSensorData,
    setGamepadSensorEnabled: PFN_SDL_SetGamepadSensorEnabled,
    gamepadSensorEnabled: PFN_SDL_GamepadSensorEnabled,
    getGamepadProperties: PFN_SDL_GetGamepadProperties,
    gamepadHasSensor: PFN_SDL_GamepadHasSensor,
    getGamepadAxisFromString: PFN_SDL_GetGamepadAxisFromString,
    getGamepadButtonFromString: PFN_SDL_GetGamepadButtonFromString,
    getGamepadButtonLabelForType: PFN_SDL_GetGamepadButtonLabelForType,
    getGamepadConnectionState: PFN_SDL_GetGamepadConnectionState,
    getGamepadJoystick: PFN_SDL_GetGamepadJoystick,
    getGamepadPowerInfo: PFN_SDL_GetGamepadPowerInfo,
    getGamepadSensorDataRate: PFN_SDL_GetGamepadSensorDataRate,
    getGamepadSteamHandle: PFN_SDL_GetGamepadSteamHandle,
    getGamepadStringForAxis: PFN_SDL_GetGamepadStringForAxis,
    getGamepadStringForButton: PFN_SDL_GetGamepadStringForButton,
    getGamepadStringForType: PFN_SDL_GetGamepadStringForType,
    getGamepadTypeFromString: PFN_SDL_GetGamepadTypeFromString,
    updateGamepads: PFN_SDL_UpdateGamepads,
    getTouchDeviceType: PFN_SDL_GetTouchDeviceType,
    getSensorFromID: PFN_SDL_GetSensorFromID,
    getSensorName: PFN_SDL_GetSensorName,
    getSensorType: PFN_SDL_GetSensorType,
    getSensorNonPortableType: PFN_SDL_GetSensorNonPortableType,
    getSensorInstanceID: ?PFN_SDL_GetSensorInstanceID,

    pub fn load(handle: dynamic.LibraryHandle) !InputFunctions {
        return dynamic.loadFunctions(InputFunctions, handle, "SDL_", .{}, &.{ "getGamepadFirmwareVersionForID", "getGamepadSerialForID", "getSensorInstanceID" });
    }
};
