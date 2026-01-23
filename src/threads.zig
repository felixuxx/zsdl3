// SDL3 Threads Bindings
// Multithreading support

const core = @import("core.zig");

// Thread structs
pub const SDL_Thread = opaque {};
pub const SDL_Mutex = opaque {};

// Thread functions
extern fn SDL_CreateThread(func: ?*const fn (?*anyopaque) callconv(.C) c_int, name: ?[*:0]const u8, data: ?*anyopaque) ?*SDL_Thread;
extern fn SDL_WaitThread(thread: ?*SDL_Thread, status: ?*c_int) void;
extern fn SDL_CreateMutex() ?*SDL_Mutex;
extern fn SDL_DestroyMutex(mutex: ?*SDL_Mutex) void;
extern fn SDL_LockMutex(mutex: ?*SDL_Mutex) bool;
extern fn SDL_UnlockMutex(mutex: ?*SDL_Mutex) bool;

// Public API
pub const createThread = SDL_CreateThread;
pub const waitThread = SDL_WaitThread;
pub const createMutex = SDL_CreateMutex;
pub const destroyMutex = SDL_DestroyMutex;
pub const lockMutex = SDL_LockMutex;
pub const unlockMutex = SDL_UnlockMutex;
