// SDL3 Hints Bindings
// Runtime configuration

const dynamic = @import("dynamic.zig");

// Priority enum
pub const SDL_HintPriority = enum(c_int) {
    SDL_HINT_DEFAULT,
    SDL_HINT_NORMAL,
    SDL_HINT_OVERRIDE,
};

pub const SDL_HintCallback = ?*const fn (?*anyopaque, [*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.c) void;

// Hints functions
pub const PFN_SDL_SetHint = *const fn (name: [*:0]const u8, value: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GetHint = *const fn (name: [*:0]const u8) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_SetHintWithPriority = *const fn (name: [*:0]const u8, value: [*:0]const u8, priority: SDL_HintPriority) callconv(.c) bool;
pub const PFN_SDL_ResetHint = *const fn (name: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_ResetHints = *const fn () callconv(.c) void;
pub const PFN_SDL_AddHintCallback = *const fn (name: [*:0]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_RemoveHintCallback = *const fn (name: [*:0]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_GetHintBoolean = *const fn (name: [*:0]const u8, default_value: bool) callconv(.c) bool;

pub const HintFunctions = struct {
    setHint: PFN_SDL_SetHint,
    getHint: PFN_SDL_GetHint,
    setHintWithPriority: PFN_SDL_SetHintWithPriority,
    resetHint: PFN_SDL_ResetHint,
    resetHints: PFN_SDL_ResetHints,
    addHintCallback: PFN_SDL_AddHintCallback,
    removeHintCallback: PFN_SDL_RemoveHintCallback,
    getHintBoolean: PFN_SDL_GetHintBoolean,

    pub fn load(handle: dynamic.LibraryHandle) !HintFunctions {
        return dynamic.loadFunctions(HintFunctions, handle, "SDL_", .{}, &.{});
    }
};
