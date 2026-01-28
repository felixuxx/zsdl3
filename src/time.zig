// SDL3 Time Bindings
// Timers, delays, timing functions

const core = @import("core.zig");
pub const Uint32 = core.Uint32;
pub const SDL_Time = core.Sint64;

// Import types
// Timer callback
pub const SDL_TimerCallback = ?*const fn (Uint32, ?*anyopaque) callconv(.C) Uint32;
pub const SDL_TimerID = c_int;

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
extern fn SDL_RemoveTimer(id: SDL_TimerID) bool;
extern fn SDL_GetPerformanceCounter() core.Uint64;
extern fn SDL_GetPerformanceFrequency() core.Uint64;
extern fn SDL_GetCurrentTime(ticks: ?*core.SDL_Time) bool;
extern fn SDL_TimeToDateTime(ticks: core.SDL_Time, dt: ?*SDL_DateTime, localTime: bool) bool;
extern fn SDL_DateTimeToTime(dt: ?*const SDL_DateTime, ticks: ?*core.SDL_Time) bool;
extern fn SDL_GetDateTimeLocalePreferences(dateFormat: ?*SDL_DateFormat, timeFormat: ?*SDL_TimeFormat) bool;
extern fn SDL_TimeToWindows(ticks: core.SDL_Time, dwLowDateTime: ?*core.Uint32, dwHighDateTime: ?*core.Uint32) void;
extern fn SDL_TimeFromWindows(dwLowDateTime: core.Uint32, dwHighDateTime: core.Uint32) core.SDL_Time;
extern fn SDL_GetDaysInMonth(year: c_int, month: c_int) c_int;
extern fn SDL_GetDayOfYear(year: c_int, month: c_int, day: c_int) c_int;
extern fn SDL_GetDayOfWeek(year: c_int, month: c_int, day: c_int) c_int;

// Public API
pub const getTicks = SDL_GetTicks;
pub const getTicksNS = SDL_GetTicksNS;
pub const delay = SDL_Delay;
pub const addTimer = SDL_AddTimer;
pub const removeTimer = SDL_RemoveTimer;
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
