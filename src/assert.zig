// SDL3 Assert Bindings
// Custom assertion handling

const dynamic = @import("dynamic.zig");

// Assert state
pub const SDL_AssertState = enum(c_int) {
    SDL_ASSERTION_RETRY,
    SDL_ASSERTION_BREAK,
    SDL_ASSERTION_ABORT,
    SDL_ASSERTION_IGNORE,
    SDL_ASSERTION_ALWAYS_IGNORE,
};

// Assert data
pub const SDL_AssertData = extern struct {
    always_ignore: bool,
    trigger_count: c_uint,
    condition: ?[*:0]const u8,
    filename: ?[*:0]const u8,
    linenum: c_int,
    function: ?[*:0]const u8,
    next: ?*SDL_AssertData,
};

// Assert functions
pub const PFN_SDL_SetAssertionHandler = *const fn (handler: ?*const fn (?*const SDL_AssertData, ?*anyopaque) callconv(.c) SDL_AssertState, userdata: ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_GetDefaultAssertionHandler = *const fn () callconv(.c) ?*const fn (?*const SDL_AssertData, ?*anyopaque) callconv(.c) SDL_AssertState;
pub const PFN_SDL_GetAssertionHandler = *const fn (userdata: ?*?*anyopaque) callconv(.c) ?*const fn (?*const SDL_AssertData, ?*anyopaque) callconv(.c) SDL_AssertState;
pub const PFN_SDL_GetAssertionReport = *const fn () callconv(.c) ?*const SDL_AssertData;
pub const PFN_SDL_ResetAssertionReport = *const fn () callconv(.c) void;
pub const PFN_SDL_TriggerBreakpoint = *const fn () callconv(.c) void;
pub const PFN_SDL_SetAssertionRetry = *const fn (state: bool) callconv(.c) void;
pub const PFN_SDL_GetAssertionRetry = *const fn () callconv(.c) bool;

pub const AssertFunctions = struct {
    setAssertionHandler: PFN_SDL_SetAssertionHandler,
    getDefaultAssertionHandler: PFN_SDL_GetDefaultAssertionHandler,
    getAssertionHandler: PFN_SDL_GetAssertionHandler,
    getAssertionReport: PFN_SDL_GetAssertionReport,
    resetAssertionReport: PFN_SDL_ResetAssertionReport,
    triggerBreakpoint: PFN_SDL_TriggerBreakpoint,
    setAssertionRetry: PFN_SDL_SetAssertionRetry,
    getAssertionRetry: PFN_SDL_GetAssertionRetry,

    pub fn load(handle: dynamic.LibraryHandle) !AssertFunctions {
        return dynamic.loadFunctions(AssertFunctions, handle, "SDL_", .{}, &.{ "triggerBreakpoint", "setAssertionRetry", "getAssertionRetry" });
    }
};
