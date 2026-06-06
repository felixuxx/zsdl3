// SDL3 Power Bindings
// Battery and power status

const dynamic = @import("dynamic.zig");

// Power state
pub const SDL_PowerState = enum(c_int) {
    SDL_POWERSTATE_ERROR = -1,
    SDL_POWERSTATE_UNKNOWN,
    SDL_POWERSTATE_ON_BATTERY,
    SDL_POWERSTATE_NO_BATTERY,
    SDL_POWERSTATE_CHARGING,
    SDL_POWERSTATE_CHARGED,
};

// Power functions
pub const PFN_SDL_GetPowerInfo = *const fn (seconds: ?*c_int, percent: ?*c_int) callconv(.c) SDL_PowerState;

pub const PowerFunctions = struct {
    getPowerInfo: PFN_SDL_GetPowerInfo,

    pub fn load(handle: dynamic.LibraryHandle) !PowerFunctions {
        return dynamic.loadFunctions(PowerFunctions, handle, "SDL_", .{}, &.{});
    }
};
