// SDL3 Time Bindings
// Timers, delays, timing functions

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

pub const Uint32 = core.Uint32;
pub const SDL_Time = core.Sint64;

// Import types
// Timer callback
pub const SDL_TimerCallback = ?*const fn (?*anyopaque, SDL_TimerID, Uint32) callconv(.c) Uint32;
pub const SDL_TimerID = Uint32;

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
pub const PFN_SDL_GetTicks = *const fn () callconv(.c) core.Uint64;
pub const PFN_SDL_GetTicksNS = *const fn () callconv(.c) core.Uint64;
pub const PFN_SDL_Delay = *const fn (ms: core.Uint32) callconv(.c) void;
pub const PFN_SDL_AddTimer = *const fn (interval: Uint32, callback: SDL_TimerCallback, param: ?*anyopaque) callconv(.c) SDL_TimerID;
pub const PFN_SDL_RemoveTimer = *const fn (id: SDL_TimerID) callconv(.c) bool;
pub const PFN_SDL_GetPerformanceCounter = *const fn () callconv(.c) core.Uint64;
pub const PFN_SDL_GetPerformanceFrequency = *const fn () callconv(.c) core.Uint64;
pub const PFN_SDL_GetCurrentTime = *const fn (ticks: ?*SDL_Time) callconv(.c) bool;
pub const PFN_SDL_TimeToDateTime = *const fn (ticks: SDL_Time, dt: ?*SDL_DateTime, localTime: bool) callconv(.c) bool;
pub const PFN_SDL_DateTimeToTime = *const fn (dt: ?*const SDL_DateTime, ticks: ?*SDL_Time) callconv(.c) bool;
pub const PFN_SDL_GetDateTimeLocalePreferences = *const fn (dateFormat: ?*SDL_DateFormat, timeFormat: ?*SDL_TimeFormat) callconv(.c) bool;
pub const PFN_SDL_TimeToWindows = *const fn (ticks: SDL_Time, dwLowDateTime: ?*core.Uint32, dwHighDateTime: ?*core.Uint32) callconv(.c) void;
pub const PFN_SDL_TimeFromWindows = *const fn (dwLowDateTime: core.Uint32, dwHighDateTime: core.Uint32) callconv(.c) SDL_Time;
pub const PFN_SDL_GetDaysInMonth = *const fn (year: c_int, month: c_int) callconv(.c) c_int;
pub const PFN_SDL_GetDayOfYear = *const fn (year: c_int, month: c_int, day: c_int) callconv(.c) c_int;
pub const PFN_SDL_GetDayOfWeek = *const fn (year: c_int, month: c_int, day: c_int) callconv(.c) c_int;
pub const PFN_SDL_AddTimerNS = *const fn (interval: core.Uint32, callback: SDL_TimerCallback, userdata: ?*anyopaque) callconv(.c) SDL_TimerID;
pub const PFN_SDL_DelayNS = *const fn (ns: core.Uint64) callconv(.c) void;
pub const PFN_SDL_DelayPrecise = *const fn (ns: core.Uint64) callconv(.c) bool;

pub const TimeFunctions = struct {
    getTicks: PFN_SDL_GetTicks,
    getTicksNS: PFN_SDL_GetTicksNS,
    delay: PFN_SDL_Delay,
    addTimer: PFN_SDL_AddTimer,
    removeTimer: PFN_SDL_RemoveTimer,
    getPerformanceCounter: PFN_SDL_GetPerformanceCounter,
    getPerformanceFrequency: PFN_SDL_GetPerformanceFrequency,
    getCurrentTime: PFN_SDL_GetCurrentTime,
    timeToDateTime: PFN_SDL_TimeToDateTime,
    dateTimeToTime: PFN_SDL_DateTimeToTime,
    getDateTimeLocalePreferences: PFN_SDL_GetDateTimeLocalePreferences,
    timeToWindows: PFN_SDL_TimeToWindows,
    timeFromWindows: PFN_SDL_TimeFromWindows,
    getDaysInMonth: PFN_SDL_GetDaysInMonth,
    getDayOfYear: PFN_SDL_GetDayOfYear,
    getDayOfWeek: PFN_SDL_GetDayOfWeek,
    addTimerNS: PFN_SDL_AddTimerNS,
    delayNS: PFN_SDL_DelayNS,
    delayPrecise: PFN_SDL_DelayPrecise,

    pub fn load(handle: dynamic.LibraryHandle) !TimeFunctions {
        return dynamic.loadFunctions(TimeFunctions, handle, "SDL_", .{}, &.{});
    }
};
