// SDL3 Assert Bindings
// Custom assertion handling

const core = @import("core.zig");

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
extern fn SDL_SetAssertionHandler(handler: ?*const fn (?*const SDL_AssertData, ?*anyopaque) callconv(.C) SDL_AssertState, userdata: ?*anyopaque) void;
extern fn SDL_GetDefaultAssertionHandler() ?*const fn (?*const SDL_AssertData, ?*anyopaque) callconv(.C) SDL_AssertState;
extern fn SDL_GetAssertionHandler(userdata: ?*?*anyopaque) ?*const fn (?*const SDL_AssertData, ?*anyopaque) callconv(.C) SDL_AssertState;
extern fn SDL_GetAssertionReport() ?*const SDL_AssertData;
extern fn SDL_ResetAssertionReport() void;
extern fn SDL_TriggerBreakpoint() void;
extern fn SDL_SetAssertionRetry(state: bool) void;
extern fn SDL_GetAssertionRetry() bool;

// Public API
pub const setAssertionHandler = SDL_SetAssertionHandler;
pub const getDefaultAssertionHandler = SDL_GetDefaultAssertionHandler;
pub const getAssertionHandler = SDL_GetAssertionHandler;
pub const getAssertionReport = SDL_GetAssertionReport;
pub const resetAssertionReport = SDL_ResetAssertionReport;
pub const triggerBreakpoint = SDL_TriggerBreakpoint;
pub const setAssertionRetry = SDL_SetAssertionRetry;
pub const getAssertionRetry = SDL_GetAssertionRetry;
