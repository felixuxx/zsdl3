// SDL3 Hints Bindings
// Runtime configuration

// Hints functions
extern fn SDL_SetHint(name: [*:0]const u8, value: [*:0]const u8) bool;
extern fn SDL_GetHint(name: [*:0]const u8) ?[*:0]const u8;
extern fn SDL_SetHintWithPriority(name: [*:0]const u8, value: [*:0]const u8, priority: c_int) bool;
extern fn SDL_ResetHint(name: [*:0]const u8) void;
extern fn SDL_AddHintCallback(name: [*:0]const u8, callback: ?*const fn (?*anyopaque, [*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.C) void, userdata: ?*anyopaque) bool;
extern fn SDL_DelHintCallback(name: [*:0]const u8, callback: ?*const fn (?*anyopaque, [*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.C) void, userdata: ?*anyopaque) void;

// Priority enum
pub const SDL_HintPriority = enum(c_int) {
    SDL_HINT_DEFAULT,
    SDL_HINT_NORMAL,
    SDL_HINT_OVERRIDE,
};

// Public API
pub const setHint = SDL_SetHint;
pub const getHint = SDL_GetHint;
pub const setHintWithPriority = SDL_SetHintWithPriority;
pub const resetHint = SDL_ResetHint;
pub const addHintCallback = SDL_AddHintCallback;
pub const delHintCallback = SDL_DelHintCallback;
