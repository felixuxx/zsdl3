// SDL3 Power Bindings
// Battery and power status

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
extern fn SDL_GetPowerInfo(seconds: ?*c_int, percent: ?*c_int) SDL_PowerState;

// Public API
pub const getPowerInfo = SDL_GetPowerInfo;
