// SDL3 Touch Bindings
// Touchscreen input

const core = @import("core.zig");

// Import types
pub const Uint64 = core.Uint64;

// Touch device
pub const SDL_TouchID = Uint64;

// Finger ID
pub const SDL_FingerID = Uint64;

// Touch functions
extern fn SDL_GetTouchDevices(count: ?*c_int) ?[*]SDL_TouchID;
extern fn SDL_GetTouchDeviceName(touchID: SDL_TouchID) ?[*:0]const u8;
extern fn SDL_GetTouchDeviceType(touchID: SDL_TouchID) SDL_TouchDeviceType;
extern fn SDL_GetTouchFingers(touchID: SDL_TouchID, count: ?*c_int) ?[*]?*SDL_Finger;

// Touch device type
pub const SDL_TouchDeviceType = enum(c_int) {
    SDL_TOUCH_DEVICE_INVALID = -1,
    SDL_TOUCH_DEVICE_DIRECT,
    SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE,
    SDL_TOUCH_DEVICE_INDIRECT_RELATIVE,
};

// Finger struct
pub const SDL_Finger = extern struct {
    id: SDL_FingerID,
    x: f32,
    y: f32,
    pressure: f32,
};

// Public API
pub const getTouchDevices = SDL_GetTouchDevices;
pub const getTouchDeviceName = SDL_GetTouchDeviceName;
pub const getTouchDeviceType = SDL_GetTouchDeviceType;
pub const getTouchFingers = SDL_GetTouchFingers;
