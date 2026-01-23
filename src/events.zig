// SDL3 Events Bindings
// Event handling and polling

const core = @import("core.zig");
const video = @import("video.zig");
const input = @import("input.zig");

// Import types
pub const SDL_EventType = core.SDL_EventType;
pub const SDL_CommonEvent = core.SDL_CommonEvent;
pub const SDL_QuitEvent = core.SDL_QuitEvent;
pub const SDL_KeyboardEvent = core.SDL_KeyboardEvent;
pub const SDL_MouseMotionEvent = core.SDL_MouseMotionEvent;
pub const SDL_WindowID = core.SDL_WindowID;

// SDL_Event union
pub const SDL_Event = extern union {
    type: SDL_EventType,
    common: SDL_CommonEvent,
    quit: SDL_QuitEvent,
    key: SDL_KeyboardEvent,
    motion: SDL_MouseMotionEvent,
    // padding for ABI
    padding: [128]core.Uint8,
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

// Public API
pub const pumpEvents = SDL_PumpEvents;
pub const pollEvent = SDL_PollEvent;
pub const waitEvent = SDL_WaitEvent;
pub const waitEventTimeout = SDL_WaitEventTimeout;
pub const pushEvent = SDL_PushEvent;
pub const filterEvents = SDL_FilterEvents;
pub const addEventWatch = SDL_AddEventWatch;
pub const delEventWatch = SDL_DelEventWatch;
