// SDL3 Pen Bindings
// Stylus/pen input

const core = @import("core.zig");

pub const Uint32 = core.Uint32;

// Pen handle
pub const SDL_Pen = opaque {};

// Pen device type
pub const SDL_PenDeviceType = enum(c_int) {
    SDL_PEN_DEVICE_TYPE_INVALID = -1,
    SDL_PEN_DEVICE_TYPE_UNKNOWN,
    SDL_PEN_DEVICE_TYPE_DIRECT,
    SDL_PEN_DEVICE_TYPE_INDIRECT,
};

// Pen axis
pub const SDL_PenAxis = enum(c_int) {
    SDL_PEN_AXIS_PRESSURE,
    SDL_PEN_AXIS_XTILT,
    SDL_PEN_AXIS_YTILT,
    SDL_PEN_AXIS_DISTANCE,
    SDL_PEN_AXIS_ROTATION,
    SDL_PEN_AXIS_SLIDER,
    SDL_PEN_AXIS_TANGENTIAL_PRESSURE,
    SDL_PEN_AXIS_COUNT,
};

// Pen functions
extern fn SDL_GetPenDeviceType(instance_id: core.SDL_PenID) SDL_PenDeviceType;

// Public API
pub const getPenDeviceType = SDL_GetPenDeviceType;
