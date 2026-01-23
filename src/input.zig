// SDL3 Input Bindings
// Keyboard, mouse, joystick, gamepad, touch, pen, sensors, HIDAPI

const core = @import("core.zig");
const video = @import("video.zig");

// Import types
pub const Uint8 = core.Uint8;
pub const Uint32 = core.Uint32;
pub const SDL_WindowID = core.SDL_WindowID;

// Keyboard
pub const SDL_KeyboardID = Uint32;

// Placeholder for keymod, keycode, scancode
pub const SDL_Keymod = c_int;
pub const SDL_Keycode = c_int;
pub const SDL_Scancode = c_int;

// Mouse
pub const SDL_MouseID = Uint32;
pub const SDL_Cursor = video.SDL_Cursor;
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

// Joystick/Gamepad
pub const SDL_JoystickID = Uint32;
pub const SDL_Joystick = opaque {};
pub const SDL_Gamepad = opaque {};

// Keyboard functions
extern fn SDL_HasKeyboard() bool;
extern fn SDL_GetKeyboardState(numkeys: ?*c_int) ?[*]const bool;
extern fn SDL_GetModState() SDL_Keymod;
extern fn SDL_SetModState(modstate: SDL_Keymod) void;
extern fn SDL_GetKeyFromScancode(scancode: SDL_Scancode, modstate: SDL_Keymod, key_event: bool) SDL_Keycode;
extern fn SDL_GetScancodeFromKey(key: SDL_Keycode, modstate: ?*SDL_Keymod) SDL_Scancode;

// Mouse functions
extern fn SDL_HasMouse() bool;
extern fn SDL_GetMouseState(x: ?*f32, y: ?*f32) SDL_MouseButtonFlags;
extern fn SDL_GetGlobalMouseState(x: ?*f32, y: ?*f32) SDL_MouseButtonFlags;
extern fn SDL_GetRelativeMouseState(x: ?*f32, y: ?*f32) SDL_MouseButtonFlags;
extern fn SDL_WarpMouseInWindow(window: ?*video.SDL_Window, x: f32, y: f32) void;
extern fn SDL_WarpMouseGlobal(x: f32, y: f32) bool;

// Joystick functions
extern fn SDL_NumJoysticks() c_int;
extern fn SDL_JoystickOpen(instance_id: c_int) ?*SDL_Joystick;
extern fn SDL_JoystickClose(joystick: ?*SDL_Joystick) void;

// Gamepad functions
extern fn SDL_NumGamepads() c_int;
extern fn SDL_IsGamepad(instance_id: c_int) bool;
extern fn SDL_OpenGamepad(instance_id: c_int) ?*SDL_Gamepad;
extern fn SDL_CloseGamepad(gamepad: ?*SDL_Gamepad) void;

// Public API
pub const hasKeyboard = SDL_HasKeyboard;
pub const getKeyboardState = SDL_GetKeyboardState;
pub const getModState = SDL_GetModState;
pub const setModState = SDL_SetModState;
pub const getKeyFromScancode = SDL_GetKeyFromScancode;
pub const getScancodeFromKey = SDL_GetScancodeFromKey;
pub const hasMouse = SDL_HasMouse;
pub const getMouseState = SDL_GetMouseState;
pub const getGlobalMouseState = SDL_GetGlobalMouseState;
pub const getRelativeMouseState = SDL_GetRelativeMouseState;
pub const warpMouseInWindow = SDL_WarpMouseInWindow;
pub const warpMouseGlobal = SDL_WarpMouseGlobal;

pub const numJoysticks = SDL_NumJoysticks;
pub const joystickOpen = SDL_JoystickOpen;
pub const joystickClose = SDL_JoystickClose;

pub const numGamepads = SDL_NumGamepads;
pub const isGamepad = SDL_IsGamepad;
pub const openGamepad = SDL_OpenGamepad;
pub const closeGamepad = SDL_CloseGamepad;
