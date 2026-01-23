// SDL3 Events Bindings
// Event handling and polling

const core = @import("core.zig");
const video = @import("video.zig");
const input = @import("input.zig");

// Import types
const touch = @import("touch.zig");
pub const SDL_EventType = core.SDL_EventType;
pub const SDL_CommonEvent = core.SDL_CommonEvent;
pub const SDL_QuitEvent = core.SDL_QuitEvent;
pub const SDL_KeyboardEvent = core.SDL_KeyboardEvent;
pub const SDL_MouseMotionEvent = core.SDL_MouseMotionEvent;
pub const SDL_WindowID = core.SDL_WindowID;
pub const SDL_Event = core.SDL_Event;
pub const SDL_TouchID = core.SDL_TouchID;
pub const SDL_Finger = touch.SDL_Finger;

// Event action enum
pub const SDL_EventAction = enum(c_int) {
    SDL_ADDEVENT,
    SDL_PEEKEVENT,
    SDL_GETEVENT,
};

// Event functions
extern fn SDL_PumpEvents() void;
extern fn SDL_PollEvent(event: ?*SDL_Event) bool;
extern fn SDL_WaitEvent(event: ?*SDL_Event) bool;
extern fn SDL_WaitEventTimeout(event: ?*SDL_Event, timeout: c_int) bool;
extern fn SDL_PushEvent(event: ?*const SDL_Event) bool;
extern fn SDL_FilterEvents(callback: ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) bool, userdata: ?*anyopaque) void;
extern fn SDL_AddEventWatch(callback: ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) void, userdata: ?*anyopaque) bool;
extern fn SDL_DelEventWatch(callback: ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) void, userdata: ?*anyopaque) void;
extern fn SDL_PeepEvents(events: ?[*]SDL_Event, numevents: c_int, action: SDL_EventAction, minType: SDL_EventType, maxType: SDL_EventType) c_int;
extern fn SDL_HasEvent(type: SDL_EventType) bool;
extern fn SDL_HasEvents(minType: SDL_EventType, maxType: SDL_EventType) bool;
extern fn SDL_FlushEvent(type: SDL_EventType) void;
extern fn SDL_FlushEvents(minType: SDL_EventType, maxType: SDL_EventType) void;
extern fn SDL_SetEventEnabled(type: SDL_EventType, enabled: bool) void;
extern fn SDL_EventEnabled(type: SDL_EventType) bool;
extern fn SDL_RegisterEvents(numevents: c_int) SDL_EventType;
extern fn SDL_GetEventFilter(filter: ?*?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) bool, userdata: ?*?*anyopaque) bool;
extern fn SDL_SetEventFilter(filter: ?*const fn (?*anyopaque, ?*SDL_Event) callconv(.C) bool, userdata: ?*anyopaque) void;
extern fn SDL_GetNumTouchFingers(touchID: core.SDL_TouchID) c_int;
extern fn SDL_GetTouchFinger(touchID: core.SDL_TouchID, index: c_int) ?*SDL_Finger;

// Public API
pub const pumpEvents = SDL_PumpEvents;
pub const pollEvent = SDL_PollEvent;
pub const waitEvent = SDL_WaitEvent;
pub const waitEventTimeout = SDL_WaitEventTimeout;
pub const pushEvent = SDL_PushEvent;
pub const filterEvents = SDL_FilterEvents;
pub const addEventWatch = SDL_AddEventWatch;
pub const delEventWatch = SDL_DelEventWatch;
pub const peepEvents = SDL_PeepEvents;
pub const hasEvent = SDL_HasEvent;
pub const hasEvents = SDL_HasEvents;
pub const flushEvent = SDL_FlushEvent;
pub const flushEvents = SDL_FlushEvents;
pub const setEventEnabled = SDL_SetEventEnabled;
pub const eventEnabled = SDL_EventEnabled;
pub const registerEvents = SDL_RegisterEvents;
pub const getEventFilter = SDL_GetEventFilter;
pub const setEventFilter = SDL_SetEventFilter;
pub const getNumTouchFingers = SDL_GetNumTouchFingers;
pub const getTouchFinger = SDL_GetTouchFinger;
