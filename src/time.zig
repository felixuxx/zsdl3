// SDL3 Time Bindings
// Timers, delays, timing functions

const core = @import("core.zig");
pub const Uint32 = core.Uint32;
pub const SDL_Time = core.Sint64;

// Timer callback
pub const SDL_TimerCallback = ?*const fn (?*anyopaque, SDL_TimerID, Uint32) callconv(.c) Uint32;
pub const SDL_NSTimerCallback = ?*const fn (?*anyopaque, SDL_TimerID, core.Uint64) callconv(.c) core.Uint64;
pub const SDL_TimerID = Uint32;

// Time conversion constants
pub const SDL_MS_PER_SECOND: Uint32 = 1000;
pub const SDL_US_PER_SECOND: Uint32 = 1000000;
pub const SDL_NS_PER_SECOND: core.Uint64 = 1000000000;
pub const SDL_NS_PER_MS: Uint32 = 1000000;
pub const SDL_NS_PER_US: Uint32 = 1000;

// Time conversion functions (replace C macros)
pub fn SDL_SECONDS_TO_NS(S: anytype) core.Uint64 {
    return @as(core.Uint64, @intCast(S)) * SDL_NS_PER_SECOND;
}
pub fn SDL_NS_TO_SECONDS(NS: anytype) @TypeOf(NS) {
    return @divTrunc(NS, SDL_NS_PER_SECOND);
}
pub fn SDL_MS_TO_NS(MS: anytype) core.Uint64 {
    return @as(core.Uint64, @intCast(MS)) * SDL_NS_PER_MS;
}
pub fn SDL_NS_TO_MS(NS: anytype) @TypeOf(NS) {
    return @divTrunc(NS, SDL_NS_PER_MS);
}
pub fn SDL_US_TO_NS(US: anytype) core.Uint64 {
    return @as(core.Uint64, @intCast(US)) * SDL_NS_PER_US;
}
pub fn SDL_NS_TO_US(NS: anytype) @TypeOf(NS) {
    return @divTrunc(NS, SDL_NS_PER_US);
}

// Time types
// SDL_Time is Sint64

pub const SDL_DateTime = extern struct {
    year: c_int,
    month: c_int,
    day: c_int,
    hour: c_int,
    minute: c_int,
    second: c_int,
    nanosecond: c_int,
    day_of_week: c_int,
    utc_offset: c_int,
};

pub const SDL_DateFormat = enum(c_int) {
    SDL_DATE_FORMAT_YYYYMMDD,
    SDL_DATE_FORMAT_DDMMYYYY,
    SDL_DATE_FORMAT_MMDDYYYY,
};

pub const SDL_TimeFormat = enum(c_int) {
    SDL_TIME_FORMAT_24HR,
    SDL_TIME_FORMAT_12HR,
};

// Time functions
extern fn SDL_GetTicks() core.Uint64;
extern fn SDL_GetTicksNS() core.Uint64;
extern fn SDL_Delay(ms: core.Uint32) void;
extern fn SDL_AddTimer(interval: Uint32, callback: SDL_TimerCallback, param: ?*anyopaque) SDL_TimerID;
extern fn SDL_AddTimerNS(interval: core.Uint64, callback: SDL_NSTimerCallback, param: ?*anyopaque) SDL_TimerID;
extern fn SDL_RemoveTimer(id: SDL_TimerID) bool;
extern fn SDL_DelayNS(ns: core.Uint64) void;
extern fn SDL_DelayPrecise(ns: core.Uint64) void;
extern fn SDL_GetPerformanceCounter() core.Uint64;
extern fn SDL_GetPerformanceFrequency() core.Uint64;
extern fn SDL_GetCurrentTime(ticks: ?*SDL_Time) bool;
extern fn SDL_TimeToDateTime(ticks: SDL_Time, dt: ?*SDL_DateTime, localTime: bool) bool;
extern fn SDL_DateTimeToTime(dt: ?*const SDL_DateTime, ticks: ?*SDL_Time) bool;
extern fn SDL_GetDateTimeLocalePreferences(dateFormat: ?*SDL_DateFormat, timeFormat: ?*SDL_TimeFormat) bool;
extern fn SDL_TimeToWindows(ticks: SDL_Time, dwLowDateTime: ?*core.Uint32, dwHighDateTime: ?*core.Uint32) void;
extern fn SDL_TimeFromWindows(dwLowDateTime: core.Uint32, dwHighDateTime: core.Uint32) SDL_Time;
extern fn SDL_GetDaysInMonth(year: c_int, month: c_int) c_int;
extern fn SDL_GetDayOfYear(year: c_int, month: c_int, day: c_int) c_int;
extern fn SDL_GetDayOfWeek(year: c_int, month: c_int, day: c_int) c_int;

// Public API
pub const getTicks = SDL_GetTicks;
pub const getTicksNS = SDL_GetTicksNS;
pub const delay = SDL_Delay;
pub const addTimer = SDL_AddTimer;
pub const addTimerNS = SDL_AddTimerNS;
pub const removeTimer = SDL_RemoveTimer;
pub const delayNS = SDL_DelayNS;
pub const delayPrecise = SDL_DelayPrecise;
pub const getPerformanceCounter = SDL_GetPerformanceCounter;
pub const getPerformanceFrequency = SDL_GetPerformanceFrequency;
pub const getCurrentTime = SDL_GetCurrentTime;
pub const timeToDateTime = SDL_TimeToDateTime;
pub const dateTimeToTime = SDL_DateTimeToTime;
pub const getDateTimeLocalePreferences = SDL_GetDateTimeLocalePreferences;
pub const timeToWindows = SDL_TimeToWindows;
pub const timeFromWindows = SDL_TimeFromWindows;
pub const getDaysInMonth = SDL_GetDaysInMonth;
pub const getDayOfYear = SDL_GetDayOfYear;
pub const getDayOfWeek = SDL_GetDayOfWeek;
