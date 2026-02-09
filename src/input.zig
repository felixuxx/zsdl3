// SDL3 Input Bindings
// Keyboard, mouse, joystick, gamepad, touch, pen, sensors, HIDAPI

const core = @import("core.zig");
pub const Uint8 = core.Uint8;
pub const Uint16 = core.Uint16;
pub const Uint32 = core.Uint32;
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
extern fn SDL_HasKeyboard() bool;
extern fn SDL_GetKeyboards(count: ?*c_int) ?[*]SDL_KeyboardID;
extern fn SDL_GetKeyboardNameForID(instance_id: SDL_KeyboardID) ?[*:0]const u8;
extern fn SDL_GetKeyboardFocus() ?*video.SDL_Window;
extern fn SDL_GetKeyboardState(numkeys: ?*c_int) ?[*]const bool;
extern fn SDL_ResetKeyboard() void;
extern fn SDL_GetModState() SDL_Keymod;
extern fn SDL_SetModState(modstate: SDL_Keymod) void;
extern fn SDL_GetKeyFromScancode(scancode: SDL_Scancode, modstate: SDL_Keymod, key_event: bool) SDL_Keycode;
extern fn SDL_GetScancodeFromKey(key: SDL_Keycode, modstate: ?*SDL_Keymod) SDL_Scancode;
extern fn SDL_SetScancodeName(scancode: SDL_Scancode, name: [*:0]const u8) bool;
extern fn SDL_GetScancodeName(scancode: SDL_Scancode) ?[*:0]const u8;
extern fn SDL_GetScancodeFromName(name: [*:0]const u8) SDL_Scancode;
extern fn SDL_GetKeyName(key: SDL_Keycode) ?[*:0]const u8;
extern fn SDL_GetKeyFromName(name: [*:0]const u8) SDL_Keycode;
extern fn SDL_StartTextInput(window: ?*video.SDL_Window) bool;
extern fn SDL_StartTextInputWithProperties(window: ?*video.SDL_Window, props: core.SDL_PropertiesID) bool;
extern fn SDL_StopTextInput(window: ?*video.SDL_Window) bool;
extern fn SDL_TextInputActive(window: ?*video.SDL_Window) bool;
extern fn SDL_ClearComposition(window: ?*video.SDL_Window) bool;
const pixels = @import("pixels.zig");
extern fn SDL_SetTextInputArea(window: ?*video.SDL_Window, rect: ?*const pixels.SDL_Rect, cursor: c_int) bool;
extern fn SDL_GetTextInputArea(window: ?*video.SDL_Window, rect: ?*pixels.SDL_Rect, cursor: ?*c_int) bool;
extern fn SDL_HasScreenKeyboardSupport() bool;
extern fn SDL_ScreenKeyboardShown(window: ?*video.SDL_Window) bool;

// Mouse functions
extern fn SDL_HasMouse() bool;
extern fn SDL_GetMice(count: ?*c_int) ?[*]SDL_MouseID;
extern fn SDL_GetMouseNameForID(instance_id: SDL_MouseID) ?[*:0]const u8;
extern fn SDL_GetMouseFocus() ?*video.SDL_Window;
extern fn SDL_GetMouseState(x: ?*f32, y: ?*f32) SDL_MouseButtonFlags;
extern fn SDL_GetGlobalMouseState(x: ?*f32, y: ?*f32) SDL_MouseButtonFlags;
extern fn SDL_GetRelativeMouseState(x: ?*f32, y: ?*f32) SDL_MouseButtonFlags;
extern fn SDL_WarpMouseInWindow(window: ?*video.SDL_Window, x: f32, y: f32) void;
extern fn SDL_WarpMouseGlobal(x: f32, y: f32) bool;
extern fn SDL_CaptureMouse(enabled: bool) bool;
extern fn SDL_GetMouseCapture() bool;
extern fn SDL_SetWindowRelativeMouseMode(window: ?*video.SDL_Window, enabled: bool) bool;
extern fn SDL_GetWindowRelativeMouseMode(window: ?*video.SDL_Window) bool;
extern fn SDL_SetRelativeMouseTransform(callback: ?*const fn (?*anyopaque, core.Uint64, ?*video.SDL_Window, SDL_MouseID, ?*f32, ?*f32) callconv(.C) void, userdata: ?*anyopaque) bool;
extern fn SDL_GetRelativeMouseTransform(callback: ?*?*const fn (?*anyopaque, core.Uint64, ?*video.SDL_Window, SDL_MouseID, ?*f32, ?*f32) callconv(.C) void, userdata: ?*?*anyopaque) bool;

// Cursor functions
pub const SDL_CursorFrameInfo = extern struct {
    surface: ?*surface.SDL_Surface,
    duration: Uint32,
};
extern fn SDL_CreateCursor(data: ?[*]const Uint8, mask: ?[*]const Uint8, w: c_int, h: c_int, hot_x: c_int, hot_y: c_int) ?*SDL_Cursor;
extern fn SDL_CreateColorCursor(surface: ?*surface.SDL_Surface, hot_x: c_int, hot_y: c_int) ?*SDL_Cursor;
extern fn SDL_CreateAnimatedCursor(frames: ?[*]SDL_CursorFrameInfo, frame_count: c_int, hot_x: c_int, hot_y: c_int) ?*SDL_Cursor;
extern fn SDL_CreateSystemCursor(id: SDL_SystemCursor) ?*SDL_Cursor;
extern fn SDL_SetCursor(cursor: ?*SDL_Cursor) bool;
extern fn SDL_GetCursor() ?*SDL_Cursor;
extern fn SDL_GetDefaultCursor() ?*SDL_Cursor;
extern fn SDL_DestroyCursor(cursor: ?*SDL_Cursor) void;
extern fn SDL_ShowCursor() bool;
extern fn SDL_HideCursor() bool;
extern fn SDL_CursorVisible() bool;

// Joystick functions
extern fn SDL_NumJoysticks() c_int;
extern fn SDL_JoystickOpen(instance_id: c_int) ?*SDL_Joystick;
extern fn SDL_JoystickClose(joystick: ?*SDL_Joystick) void;
extern fn SDL_JoystickName(joystick: ?*SDL_Joystick) ?[*:0]const u8;
extern fn SDL_JoystickPath(joystick: ?*SDL_Joystick) ?[*:0]const u8;
extern fn SDL_JoystickGetType(joystick: ?*SDL_Joystick) SDL_JoystickType;
extern fn SDL_JoystickGetGUID(joystick: ?*SDL_Joystick) SDL_GUID;
extern fn SDL_JoystickGetVendor(joystick: ?*SDL_Joystick) Uint16;
extern fn SDL_JoystickGetProduct(joystick: ?*SDL_Joystick) Uint16;
extern fn SDL_JoystickGetProductVersion(joystick: ?*SDL_Joystick) Uint16;
extern fn SDL_JoystickGetFirmwareVersion(joystick: ?*SDL_Joystick) Uint16;
extern fn SDL_JoystickGetSerial(joystick: ?*SDL_Joystick) ?[*:0]const u8;
extern fn SDL_JoystickGetAxis(joystick: ?*SDL_Joystick, axis: c_int) Sint16;
extern fn SDL_JoystickGetHat(joystick: ?*SDL_Joystick, hat: c_int) Uint8;
extern fn SDL_JoystickGetBall(joystick: ?*SDL_Joystick, ball: c_int, dx: ?*c_int, dy: ?*c_int) bool;
extern fn SDL_JoystickGetButton(joystick: ?*SDL_Joystick, button: c_int) Uint8;
extern fn SDL_JoystickRumble(joystick: ?*SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16, duration_ms: Uint32) bool;
extern fn SDL_JoystickRumbleTriggers(joystick: ?*SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16, duration_ms: Uint32) bool;
extern fn SDL_JoystickHasLED(joystick: ?*SDL_Joystick) bool;
extern fn SDL_JoystickSetLED(joystick: ?*SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) bool;
extern fn SDL_JoystickSendEffect(joystick: ?*SDL_Joystick, data: ?*anyopaque, size: c_int) bool;

// Gamepad functions
extern fn SDL_NumGamepads() c_int;
extern fn SDL_IsGamepad(instance_id: c_int) bool;
extern fn SDL_OpenGamepad(instance_id: c_int) ?*SDL_Gamepad;
extern fn SDL_CloseGamepad(gamepad: ?*SDL_Gamepad) void;
extern fn SDL_GetGamepadName(gamepad: ?*SDL_Gamepad) ?[*:0]const u8;
extern fn SDL_GetGamepadPath(gamepad: ?*SDL_Gamepad) ?[*:0]const u8;
extern fn SDL_GetGamepadType(gamepad: ?*SDL_Gamepad) SDL_GamepadType;
extern fn SDL_GetGamepadGUID(gamepad: ?*SDL_Gamepad) SDL_GUID;
extern fn SDL_GetGamepadVendor(gamepad: ?*SDL_Gamepad) Uint16;
extern fn SDL_GetGamepadProduct(gamepad: ?*SDL_Gamepad) Uint16;
extern fn SDL_GetGamepadProductVersion(gamepad: ?*SDL_Gamepad) Uint16;
extern fn SDL_GetGamepadFirmwareVersion(gamepad: ?*SDL_Gamepad) Uint16;
extern fn SDL_GetGamepadSerial(gamepad: ?*SDL_Gamepad) ?[*:0]const u8;
extern fn SDL_GamepadHasAxis(gamepad: ?*SDL_Gamepad, axis: SDL_GamepadAxis) bool;
extern fn SDL_GetGamepadAxis(gamepad: ?*SDL_Gamepad, axis: SDL_GamepadAxis) Sint16;
extern fn SDL_GamepadHasButton(gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) bool;
extern fn SDL_GetGamepadButton(gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) bool;
extern fn SDL_GetGamepadButtonLabel(gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) SDL_GamepadButtonLabel;
extern fn SDL_SetGamepadEventsEnabled(enabled: bool) void;
extern fn SDL_GamepadEventsEnabled() bool;
extern fn SDL_GetGamepadBindings(gamepad: ?*SDL_Gamepad, count: ?*c_int) ?[*]?*SDL_GamepadBinding;
extern fn SDL_ReloadGamepadMappings() bool;
extern fn SDL_GetGamepadMapping(gamepad: ?*SDL_Gamepad) ?[*:0]const u8;
extern fn SDL_AddGamepadMapping(mapping: ?[*:0]const u8) c_int;
const filesystem = @import("filesystem.zig");
extern fn SDL_AddGamepadMappingsFromFile(file: [*:0]const u8) c_int;
extern fn SDL_AddGamepadMappingsFromIO(src: ?*filesystem.SDL_IOStream, closeio: bool) c_int;
extern fn SDL_GetGamepadMappings(count: ?*c_int) ?[*]?[*:0]u8;
extern fn SDL_GetGamepadMappingForGUID(guid: SDL_GUID) ?[*:0]const u8;
extern fn SDL_GetGamepadMappingForID(instance_id: SDL_JoystickID) ?[*:0]const u8;
extern fn SDL_SetGamepadMapping(instance_id: SDL_JoystickID, mapping: ?[*:0]const u8) bool;
extern fn SDL_GetGamepadPlayerIndexForID(instance_id: SDL_JoystickID) c_int;
extern fn SDL_GetRealGamepadTypeForID(instance_id: SDL_JoystickID) SDL_GamepadType;
extern fn SDL_GetRealGamepadType(gamepad: ?*SDL_Gamepad) SDL_GamepadType;
extern fn SDL_GetNumGamepadTouchpads(gamepad: ?*SDL_Gamepad) c_int;
extern fn SDL_GetGamepadTouchpadFinger(gamepad: ?*SDL_Gamepad, touchpad: c_int, finger: c_int, state: ?*Uint8, x: ?*f32, y: ?*f32, pressure: ?*f32) bool;
extern fn SDL_GetGamepadAppleSFSymbolsNameForAxis(gamepad: ?*SDL_Gamepad, axis: SDL_GamepadAxis) ?[*:0]const u8;
extern fn SDL_GetGamepadAppleSFSymbolsNameForButton(gamepad: ?*SDL_Gamepad, button: SDL_GamepadButton) ?[*:0]const u8;
extern fn SDL_HasGamepad() bool;
extern fn SDL_GetGamepads(count: ?*c_int) ?[*]SDL_JoystickID;
extern fn SDL_GetGamepadNameForID(instance_id: SDL_JoystickID) ?[*:0]const u8;
extern fn SDL_GetGamepadPathForID(instance_id: SDL_JoystickID) ?[*:0]const u8;
extern fn SDL_GetGamepadTypeForID(instance_id: SDL_JoystickID) SDL_GamepadType;
extern fn SDL_GetGamepadGUIDForID(instance_id: SDL_JoystickID) SDL_GUID;
extern fn SDL_GetGamepadVendorForID(instance_id: SDL_JoystickID) Uint16;
extern fn SDL_GetGamepadProductForID(instance_id: SDL_JoystickID) Uint16;
extern fn SDL_GetGamepadProductVersionForID(instance_id: SDL_JoystickID) Uint16;
extern fn SDL_GetGamepadFirmwareVersionForID(instance_id: SDL_JoystickID) Uint16;
extern fn SDL_GetGamepadSerialForID(instance_id: SDL_JoystickID) ?[*:0]const u8;
extern fn SDL_GamepadConnected(gamepad: ?*SDL_Gamepad) bool;
extern fn SDL_GetGamepadID(gamepad: ?*SDL_Gamepad) SDL_JoystickID;
extern fn SDL_GetGamepadFromID(instance_id: SDL_JoystickID) ?*SDL_Gamepad;
extern fn SDL_GetGamepadFromPlayerIndex(player_index: c_int) ?*SDL_Gamepad;
extern fn SDL_GetGamepadPlayerIndex(gamepad: ?*SDL_Gamepad) c_int;
extern fn SDL_SetGamepadPlayerIndex(gamepad: ?*SDL_Gamepad, player_index: c_int) bool;
extern fn SDL_RumbleGamepad(gamepad: ?*SDL_Gamepad, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16, duration_ms: Uint32) bool;
extern fn SDL_RumbleGamepadTriggers(gamepad: ?*SDL_Gamepad, left_rumble: Uint16, right_rumble: Uint16, duration_ms: Uint32) bool;
extern fn SDL_SetGamepadLED(gamepad: ?*SDL_Gamepad, red: Uint8, green: Uint8, blue: Uint8) bool;
extern fn SDL_SendGamepadEffect(gamepad: ?*SDL_Gamepad, data: ?*anyopaque, size: c_int) bool;
extern fn SDL_GetGamepadSensorData(gamepad: ?*SDL_Gamepad, sensor: SDL_SensorType, data: ?[*]f32, num_values: c_int) bool;
extern fn SDL_SetGamepadSensorEnabled(gamepad: ?*SDL_Gamepad, sensor: SDL_SensorType, enabled: bool) bool;
extern fn SDL_GamepadSensorEnabled(gamepad: ?*SDL_Gamepad, sensor: SDL_SensorType) bool;
extern fn SDL_GetGamepadProperties(gamepad: ?*SDL_Gamepad) core.SDL_PropertiesID;
extern fn SDL_GetGamepadIDMap() ?*anyopaque;

//Touch functions
extern fn SDL_GetTouchDeviceType(device_id: SDL_TouchID) SDL_TouchDeviceType;
extern fn SDL_GetTouchFinger(device_id: SDL_TouchID, finger_id: SDL_FingerID) ?*SDL_Finger;

//Sensor functions
extern fn SDL_GetSensorFromID(instance_id: SDL_SensorID) ?*SDL_Sensor;
extern fn SDL_GetSensorName(sensor: ?*SDL_Sensor) ?[*:0]const u8;
extern fn SDL_GetSensorType(sensor: ?*SDL_Sensor) SDL_SensorType;
extern fn SDL_GetSensorNonPortableType(sensor: ?*SDL_Sensor) c_int;
extern fn SDL_GetSensorInstanceID(sensor: ?*SDL_Sensor) SDL_SensorID;

// Public API
pub const hasKeyboard = SDL_HasKeyboard;
pub const getKeyboards = SDL_GetKeyboards;
pub const getKeyboardNameForID = SDL_GetKeyboardNameForID;
pub const getKeyboardFocus = SDL_GetKeyboardFocus;
pub const resetKeyboard = SDL_ResetKeyboard;
pub const getKeyboardState = SDL_GetKeyboardState;
pub const getModState = SDL_GetModState;
pub const setModState = SDL_SetModState;
pub const getKeyFromScancode = SDL_GetKeyFromScancode;
pub const getScancodeFromKey = SDL_GetScancodeFromKey;
pub const setScancodeName = SDL_SetScancodeName;
pub const getScancodeName = SDL_GetScancodeName;
pub const getScancodeFromName = SDL_GetScancodeFromName;
pub const getKeyName = SDL_GetKeyName;
pub const getKeyFromName = SDL_GetKeyFromName;
pub const startTextInput = SDL_StartTextInput;
pub const startTextInputWithProperties = SDL_StartTextInputWithProperties;
pub const stopTextInput = SDL_StopTextInput;
pub const textInputActive = SDL_TextInputActive;
pub const clearComposition = SDL_ClearComposition;
pub const setTextInputArea = SDL_SetTextInputArea;
pub const getTextInputArea = SDL_GetTextInputArea;
pub const hasScreenKeyboardSupport = SDL_HasScreenKeyboardSupport;
pub const screenKeyboardShown = SDL_ScreenKeyboardShown;
pub const hasMouse = SDL_HasMouse;
pub const getMice = SDL_GetMice;
pub const getMouseNameForID = SDL_GetMouseNameForID;
pub const getMouseFocus = SDL_GetMouseFocus;
pub const getMouseState = SDL_GetMouseState;
pub const getGlobalMouseState = SDL_GetGlobalMouseState;
pub const getRelativeMouseState = SDL_GetRelativeMouseState;
pub const warpMouseInWindow = SDL_WarpMouseInWindow;
pub const warpMouseGlobal = SDL_WarpMouseGlobal;
pub const captureMouse = SDL_CaptureMouse;
pub const getMouseCapture = SDL_GetMouseCapture;
pub const setWindowRelativeMouseMode = SDL_SetWindowRelativeMouseMode;
pub const getWindowRelativeMouseMode = SDL_GetWindowRelativeMouseMode;
pub const setRelativeMouseTransform = SDL_SetRelativeMouseTransform;
pub const getRelativeMouseTransform = SDL_GetRelativeMouseTransform;
pub const createCursor = SDL_CreateCursor;
pub const createColorCursor = SDL_CreateColorCursor;
pub const createAnimatedCursor = SDL_CreateAnimatedCursor;
pub const createSystemCursor = SDL_CreateSystemCursor;
pub const setCursor = SDL_SetCursor;
pub const getCursor = SDL_GetCursor;
pub const getDefaultCursor = SDL_GetDefaultCursor;
pub const destroyCursor = SDL_DestroyCursor;
pub const showCursor = SDL_ShowCursor;
pub const hideCursor = SDL_HideCursor;
pub const cursorVisible = SDL_CursorVisible;

pub const numJoysticks = SDL_NumJoysticks;
pub const joystickOpen = SDL_JoystickOpen;
pub const joystickClose = SDL_JoystickClose;
pub const joystickName = SDL_JoystickName;
pub const joystickPath = SDL_JoystickPath;
pub const joystickGetType = SDL_JoystickGetType;
pub const joystickGetGUID = SDL_JoystickGetGUID;
pub const joystickGetVendor = SDL_JoystickGetVendor;
pub const joystickGetProduct = SDL_JoystickGetProduct;
pub const joystickGetProductVersion = SDL_JoystickGetProductVersion;
pub const joystickGetFirmwareVersion = SDL_JoystickGetFirmwareVersion;
pub const joystickGetSerial = SDL_JoystickGetSerial;
pub const joystickGetAxis = SDL_JoystickGetAxis;
pub const joystickGetHat = SDL_JoystickGetHat;
pub const joystickGetBall = SDL_JoystickGetBall;
pub const joystickGetButton = SDL_JoystickGetButton;
pub const joystickRumble = SDL_JoystickRumble;
pub const joystickRumbleTriggers = SDL_JoystickRumbleTriggers;
pub const joystickHasLED = SDL_JoystickHasLED;
pub const joystickSetLED = SDL_JoystickSetLED;
pub const joystickSendEffect = SDL_JoystickSendEffect;

pub const numGamepads = SDL_NumGamepads;
pub const isGamepad = SDL_IsGamepad;
pub const openGamepad = SDL_OpenGamepad;
pub const closeGamepad = SDL_CloseGamepad;
pub const getGamepadName = SDL_GetGamepadName;
pub const getGamepadPath = SDL_GetGamepadPath;
pub const getGamepadType = SDL_GetGamepadType;
pub const getGamepadGUID = SDL_GetGamepadGUID;
pub const getGamepadVendor = SDL_GetGamepadVendor;
pub const getGamepadProduct = SDL_GetGamepadProduct;
pub const getGamepadProductVersion = SDL_GetGamepadProductVersion;
pub const getGamepadFirmwareVersion = SDL_GetGamepadFirmwareVersion;
pub const getGamepadSerial = SDL_GetGamepadSerial;
pub const gamepadHasAxis = SDL_GamepadHasAxis;
pub const getGamepadAxis = SDL_GetGamepadAxis;
pub const gamepadHasButton = SDL_GamepadHasButton;
pub const getGamepadButton = SDL_GetGamepadButton;
pub const getGamepadButtonLabel = SDL_GetGamepadButtonLabel;
pub const setGamepadEventsEnabled = SDL_SetGamepadEventsEnabled;
pub const gamepadEventsEnabled = SDL_GamepadEventsEnabled;
pub const getGamepadBindings = SDL_GetGamepadBindings;
pub const reloadGamepadMappings = SDL_ReloadGamepadMappings;
pub const getGamepadMapping = SDL_GetGamepadMapping;
pub const addGamepadMapping = SDL_AddGamepadMapping;
pub const addGamepadMappingsFromFile = SDL_AddGamepadMappingsFromFile;
pub const addGamepadMappingsFromIO = SDL_AddGamepadMappingsFromIO;
pub const getGamepadMappings = SDL_GetGamepadMappings;
pub const getGamepadMappingForGUID = SDL_GetGamepadMappingForGUID;
pub const getGamepadMappingForID = SDL_GetGamepadMappingForID;
pub const setGamepadMapping = SDL_SetGamepadMapping;
pub const getGamepadPlayerIndexForID = SDL_GetGamepadPlayerIndexForID;
pub const getRealGamepadTypeForID = SDL_GetRealGamepadTypeForID;
pub const getRealGamepadType = SDL_GetRealGamepadType;
pub const getNumGamepadTouchpads = SDL_GetNumGamepadTouchpads;
pub const getGamepadTouchpadFinger = SDL_GetGamepadTouchpadFinger;
pub const getGamepadAppleSFSymbolsNameForAxis = SDL_GetGamepadAppleSFSymbolsNameForAxis;
pub const getGamepadAppleSFSymbolsNameForButton = SDL_GetGamepadAppleSFSymbolsNameForButton;
pub const hasGamepad = SDL_HasGamepad;
pub const getGamepads = SDL_GetGamepads;
pub const getGamepadNameForID = SDL_GetGamepadNameForID;
pub const getGamepadPathForID = SDL_GetGamepadPathForID;
pub const getGamepadTypeForID = SDL_GetGamepadTypeForID;
pub const getGamepadGUIDForID = SDL_GetGamepadGUIDForID;
pub const getGamepadVendorForID = SDL_GetGamepadVendorForID;
pub const getGamepadProductForID = SDL_GetGamepadProductForID;
pub const getGamepadProductVersionForID = SDL_GetGamepadProductVersionForID;
pub const getGamepadFirmwareVersionForID = SDL_GetGamepadFirmwareVersionForID;
pub const getGamepadSerialForID = SDL_GetGamepadSerialForID;
pub const gamepadConnected = SDL_GamepadConnected;
pub const getGamepadID = SDL_GetGamepadID;
pub const getGamepadFromID = SDL_GetGamepadFromID;
pub const getGamepadFromPlayerIndex = SDL_GetGamepadFromPlayerIndex;
pub const getGamepadPlayerIndex = SDL_GetGamepadPlayerIndex;
pub const setGamepadPlayerIndex = SDL_SetGamepadPlayerIndex;
pub const rumbleGamepad = SDL_RumbleGamepad;
pub const rumbleGamepadTriggers = SDL_RumbleGamepadTriggers;
pub const setGamepadLED = SDL_SetGamepadLED;
pub const sendGamepadEffect = SDL_SendGamepadEffect;
pub const getGamepadSensorData = SDL_GetGamepadSensorData;
pub const setGamepadSensorEnabled = SDL_SetGamepadSensorEnabled;
pub const gamepadSensorEnabled = SDL_GamepadSensorEnabled;
pub const getGamepadProperties = SDL_GetGamepadProperties;
pub const getGamepadIDMap = SDL_GetGamepadIDMap;
