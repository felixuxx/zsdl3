// SDL3 Log Bindings
// Logging system

const core = @import("core.zig");

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
extern fn SDL_SetLogPriorities(priority: SDL_LogPriority) void;
extern fn SDL_SetLogPriority(category: c_int, priority: SDL_LogPriority) void;
extern fn SDL_GetLogPriority(category: c_int) SDL_LogPriority;
extern fn SDL_ResetLogPriorities() void;
extern fn SDL_Log(fmt: [*:0]const u8, ...) void;
extern fn SDL_LogVerbose(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogDebug(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogInfo(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogWarn(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogError(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogCritical(category: c_int, fmt: [*:0]const u8, ...) void;
extern fn SDL_LogMessage(category: c_int, priority: SDL_LogPriority, fmt: [*:0]const u8, ...) void;
extern fn SDL_GetDefaultLogOutputFunction() ?*const fn (?*anyopaque, c_int, SDL_LogPriority, [*:0]const u8) callconv(.C) void;
extern fn SDL_SetLogOutputFunction(callback: ?*const fn (?*anyopaque, c_int, SDL_LogPriority, [*:0]const u8) callconv(.C) void, userdata: ?*anyopaque) void;

// Public API
pub const setLogPriorities = SDL_SetLogPriorities;
pub const setLogPriority = SDL_SetLogPriority;
pub const getLogPriority = SDL_GetLogPriority;
pub const resetLogPriorities = SDL_ResetLogPriorities;
pub const log = SDL_Log;
pub const logVerbose = SDL_LogVerbose;
pub const logDebug = SDL_LogDebug;
pub const logInfo = SDL_LogInfo;
pub const logWarn = SDL_LogWarn;
pub const logError = SDL_LogError;
pub const logCritical = SDL_LogCritical;
pub const logMessage = SDL_LogMessage;
pub const getDefaultLogOutputFunction = SDL_GetDefaultLogOutputFunction;
pub const setLogOutputFunction = SDL_SetLogOutputFunction;
