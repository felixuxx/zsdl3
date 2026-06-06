// SDL3 Touch Bindings
// Touchscreen input

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

// Import types
pub const Uint64 = core.Uint64;

// Touch device
pub const SDL_TouchID = Uint64;

// Finger ID
pub const SDL_FingerID = Uint64;

// Touch functions
pub const PFN_SDL_GetTouchDevices = *const fn (count: ?*c_int) callconv(.c) ?[*]SDL_TouchID;
pub const PFN_SDL_GetTouchDeviceName = *const fn (touchID: SDL_TouchID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetTouchDeviceType = *const fn (touchID: SDL_TouchID) callconv(.c) SDL_TouchDeviceType;
pub const PFN_SDL_GetTouchFingers = *const fn (touchID: SDL_TouchID, count: ?*c_int) callconv(.c) ?[*]?*SDL_Finger;

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

pub const TouchFunctions = struct {
    getTouchDevices: PFN_SDL_GetTouchDevices,
    getTouchDeviceName: PFN_SDL_GetTouchDeviceName,
    getTouchDeviceType: PFN_SDL_GetTouchDeviceType,
    getTouchFingers: PFN_SDL_GetTouchFingers,

    pub fn load(handle: dynamic.LibraryHandle) !TouchFunctions {
        return dynamic.loadFunctions(TouchFunctions, handle, "SDL_", .{}, &.{});
    }
};
