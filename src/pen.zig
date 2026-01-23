// SDL3 Pen Bindings
// Stylus/pen input

const core = @import("core.zig");

// Import types
pub const Uint32 = core.Uint32;

// Pen handle
pub const SDL_Pen = opaque {};

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
extern fn SDL_GetPens(count: ?*c_int) ?[*]core.SDL_PenID;
extern fn SDL_GetPenName(pen: ?*SDL_Pen) ?[*:0]const u8;
extern fn SDL_GetPenCapabilities(pen: ?*SDL_Pen, capabilities: ?*Uint32) bool;
extern fn SDL_GetPenStatus(pen: ?*SDL_Pen, axes: ?[*]f32) bool;
extern fn SDL_PenConnected(pen: ?*SDL_Pen) bool;
extern fn SDL_GetPenFromID(id: core.SDL_PenID) ?*SDL_Pen;
extern fn SDL_GetPenID(pen: ?*SDL_Pen) core.SDL_PenID;
extern fn SDL_PenAxisSupported(pen: ?*SDL_Pen, axis: SDL_PenAxis) bool;

// Public API
pub const getPens = SDL_GetPens;
pub const getPenName = SDL_GetPenName;
pub const getPenCapabilities = SDL_GetPenCapabilities;
pub const getPenStatus = SDL_GetPenStatus;
pub const penConnected = SDL_PenConnected;
pub const getPenFromID = SDL_GetPenFromID;
pub const getPenID = SDL_GetPenID;
pub const penAxisSupported = SDL_PenAxisSupported;
