// SDL3 Log Bindings
// Logging system

const dynamic = @import("dynamic.zig");

// Log priority
pub const SDL_LogPriority = enum(c_int) {
    SDL_LOG_PRIORITY_VERBOSE = 1,
    SDL_LOG_PRIORITY_DEBUG,
    SDL_LOG_PRIORITY_INFO,
    SDL_LOG_PRIORITY_WARN,
    SDL_LOG_PRIORITY_ERROR,
    SDL_LOG_PRIORITY_CRITICAL,
    SDL_NUM_LOG_PRIORITIES,
};

// Log category
pub const SDL_LogCategory = enum(c_int) {
    SDL_LOG_CATEGORY_APPLICATION,
    SDL_LOG_CATEGORY_ERROR,
    SDL_LOG_CATEGORY_ASSERT,
    SDL_LOG_CATEGORY_SYSTEM,
    SDL_LOG_CATEGORY_AUDIO,
    SDL_LOG_CATEGORY_VIDEO,
    SDL_LOG_CATEGORY_RENDER,
    SDL_LOG_CATEGORY_INPUT,
    SDL_LOG_CATEGORY_TEST,
    SDL_LOG_CATEGORY_GPU,
    SDL_LOG_CATEGORY_RESERVED1,
    SDL_LOG_CATEGORY_RESERVED2,
    SDL_LOG_CATEGORY_RESERVED3,
    SDL_LOG_CATEGORY_RESERVED4,
    SDL_LOG_CATEGORY_RESERVED5,
    SDL_LOG_CATEGORY_RESERVED6,
    SDL_LOG_CATEGORY_RESERVED7,
    SDL_LOG_CATEGORY_RESERVED8,
    SDL_LOG_CATEGORY_RESERVED9,
    SDL_LOG_CATEGORY_RESERVED10,
    SDL_LOG_CATEGORY_CUSTOM,
};

// Log functions
pub const PFN_SDL_SetLogPriorities = *const fn (priority: SDL_LogPriority) callconv(.c) void;
pub const PFN_SDL_SetLogPriority = *const fn (category: c_int, priority: SDL_LogPriority) callconv(.c) void;
pub const PFN_SDL_GetLogPriority = *const fn (category: c_int) callconv(.c) SDL_LogPriority;
pub const PFN_SDL_ResetLogPriorities = *const fn () callconv(.c) void;
pub const PFN_SDL_Log = *const fn (fmt: [*:0]const u8, ...) callconv(.c) void;
pub const PFN_SDL_LogVerbose = *const fn (category: c_int, fmt: [*:0]const u8, ...) callconv(.c) void;
pub const PFN_SDL_LogDebug = *const fn (category: c_int, fmt: [*:0]const u8, ...) callconv(.c) void;
pub const PFN_SDL_LogInfo = *const fn (category: c_int, fmt: [*:0]const u8, ...) callconv(.c) void;
pub const PFN_SDL_LogWarn = *const fn (category: c_int, fmt: [*:0]const u8, ...) callconv(.c) void;
pub const PFN_SDL_LogError = *const fn (category: c_int, fmt: [*:0]const u8, ...) callconv(.c) void;
pub const PFN_SDL_LogCritical = *const fn (category: c_int, fmt: [*:0]const u8, ...) callconv(.c) void;
pub const PFN_SDL_LogMessage = *const fn (category: c_int, priority: SDL_LogPriority, fmt: [*:0]const u8, ...) callconv(.c) void;
pub const PFN_SDL_GetDefaultLogOutputFunction = *const fn () callconv(.c) ?*const fn (?*anyopaque, c_int, SDL_LogPriority, [*:0]const u8) callconv(.c) void;
pub const PFN_SDL_SetLogOutputFunction = *const fn (callback: ?*const fn (?*anyopaque, c_int, SDL_LogPriority, [*:0]const u8) callconv(.c) void, userdata: ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_GetLogOutputFunction = *const fn (callback: ?*?*const fn (?*anyopaque, c_int, SDL_LogPriority, [*:0]const u8) callconv(.c) void, userdata: ?*?*anyopaque) callconv(.c) void;
pub const PFN_SDL_SetLogPriorityPrefix = *const fn (priority: SDL_LogPriority, prefix: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_LogMessageV = *const fn (category: c_int, priority: SDL_LogPriority, fmt: [*:0]const u8, ap: ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_LogTrace = *const fn (category: c_int, fmt: [*:0]const u8, ...) callconv(.c) void;

pub const LogFunctions = struct {
    setLogPriorities: PFN_SDL_SetLogPriorities,
    setLogPriority: PFN_SDL_SetLogPriority,
    getLogPriority: PFN_SDL_GetLogPriority,
    resetLogPriorities: PFN_SDL_ResetLogPriorities,
    log: PFN_SDL_Log,
    logVerbose: PFN_SDL_LogVerbose,
    logDebug: PFN_SDL_LogDebug,
    logInfo: PFN_SDL_LogInfo,
    logWarn: PFN_SDL_LogWarn,
    logError: PFN_SDL_LogError,
    logCritical: PFN_SDL_LogCritical,
    logMessage: PFN_SDL_LogMessage,
    getDefaultLogOutputFunction: PFN_SDL_GetDefaultLogOutputFunction,
    setLogOutputFunction: PFN_SDL_SetLogOutputFunction,
    getLogOutputFunction: PFN_SDL_GetLogOutputFunction,
    setLogPriorityPrefix: PFN_SDL_SetLogPriorityPrefix,
    logMessageV: PFN_SDL_LogMessageV,
    logTrace: PFN_SDL_LogTrace,

    pub fn load(handle: dynamic.LibraryHandle) !LogFunctions {
        return dynamic.loadFunctions(LogFunctions, handle, "SDL_", .{}, &.{});
    }
};
