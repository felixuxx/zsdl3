// SDL3 Pen Bindings
// Stylus/pen input

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

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
pub const PFN_SDL_GetPens = *const fn (count: ?*c_int) callconv(.c) ?[*]core.SDL_PenID;
pub const PFN_SDL_GetPenName = *const fn (pen: ?*SDL_Pen) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetPenCapabilities = *const fn (pen: ?*SDL_Pen, capabilities: ?*Uint32) callconv(.c) bool;
pub const PFN_SDL_GetPenStatus = *const fn (pen: ?*SDL_Pen, axes: ?[*]f32) callconv(.c) bool;
pub const PFN_SDL_PenConnected = *const fn (pen: ?*SDL_Pen) callconv(.c) bool;
pub const PFN_SDL_GetPenFromID = *const fn (id: core.SDL_PenID) callconv(.c) ?*SDL_Pen;
pub const PFN_SDL_GetPenID = *const fn (pen: ?*SDL_Pen) callconv(.c) core.SDL_PenID;
pub const PFN_SDL_PenAxisSupported = *const fn (pen: ?*SDL_Pen, axis: SDL_PenAxis) callconv(.c) bool;

pub const PenFunctions = struct {
    getPens: ?PFN_SDL_GetPens,
    getPenName: ?PFN_SDL_GetPenName,
    getPenCapabilities: ?PFN_SDL_GetPenCapabilities,
    getPenStatus: ?PFN_SDL_GetPenStatus,
    penConnected: ?PFN_SDL_PenConnected,
    getPenFromID: ?PFN_SDL_GetPenFromID,
    getPenID: ?PFN_SDL_GetPenID,
    penAxisSupported: ?PFN_SDL_PenAxisSupported,

    pub fn load(handle: dynamic.LibraryHandle) !PenFunctions {
        return dynamic.loadFunctions(PenFunctions, handle, "SDL_", .{}, &.{ "getPens", "getPenName", "getPenCapabilities", "getPenStatus", "penConnected", "getPenFromID", "getPenID", "penAxisSupported" });
    }
};
