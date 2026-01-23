// SDL3 Time Bindings
// Timers, delays, timing functions

const core = @import("core.zig");

// Time functions
extern fn SDL_GetTicks() core.Uint64;
extern fn SDL_GetTicksNS() core.Uint64;
extern fn SDL_Delay(ms: core.Uint32) void;

// Public API
pub const getTicks = SDL_GetTicks;
pub const getTicksNS = SDL_GetTicksNS;
pub const delay = SDL_Delay;
