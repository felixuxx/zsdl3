// SDL3 Time Bindings
// Timers, delays, timing functions

const core = @import("core.zig");

// Import types
pub const Uint32 = core.Uint32;

// Timer callback
pub const SDL_TimerCallback = ?*const fn (Uint32, ?*anyopaque) callconv(.C) Uint32;
pub const SDL_TimerID = c_int;

// Time functions
extern fn SDL_GetTicks() core.Uint64;
extern fn SDL_GetTicksNS() core.Uint64;
extern fn SDL_Delay(ms: core.Uint32) void;
extern fn SDL_AddTimer(interval: Uint32, callback: SDL_TimerCallback, param: ?*anyopaque) SDL_TimerID;
extern fn SDL_RemoveTimer(id: SDL_TimerID) bool;

// Public API
pub const getTicks = SDL_GetTicks;
pub const getTicksNS = SDL_GetTicksNS;
pub const delay = SDL_Delay;
pub const addTimer = SDL_AddTimer;
pub const removeTimer = SDL_RemoveTimer;
