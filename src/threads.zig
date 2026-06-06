// SDL3 Threads Bindings
// Multithreading support

const atomic = @import("atomic.zig");
pub const SDL_TLSID = atomic.SDL_AtomicInt;
const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

pub const Uint32 = core.Uint32;
pub const Sint32 = core.Sint32;
pub const Uint64 = core.Uint64;
pub const SDL_ThreadID = Uint64;

// Import types
// Thread structs
pub const SDL_Thread = opaque {};
pub const SDL_Mutex = opaque {};
pub const SDL_Condition = opaque {};
pub const SDL_Semaphore = opaque {};

pub const SDL_ThreadPriority = enum(c_int) {
    SDL_THREAD_PRIORITY_LOW,
    SDL_THREAD_PRIORITY_NORMAL,
    SDL_THREAD_PRIORITY_HIGH,
    SDL_THREAD_PRIORITY_TIME_CRITICAL,
};

pub const SDL_ThreadState = enum(c_int) {
    SDL_THREAD_UNKNOWN,
    SDL_THREAD_ALIVE,
    SDL_THREAD_DETACHED,
    SDL_THREAD_COMPLETE,
};

pub const SDL_TLSDestructorCallback = ?*const fn (?*anyopaque) callconv(.c) void;

// Thread functions
pub const PFN_SDL_CreateThread = *const fn (func: ?*const fn (?*anyopaque) callconv(.c) c_int, name: ?[*:0]const u8, data: ?*anyopaque) callconv(.c) ?*SDL_Thread;
pub const PFN_SDL_CreateThreadWithProperties = *const fn (props: core.SDL_PropertiesID) callconv(.c) ?*SDL_Thread;
pub const PFN_SDL_WaitThread = *const fn (thread: ?*SDL_Thread, status: ?*c_int) callconv(.c) void;
pub const PFN_SDL_CreateMutex = *const fn () callconv(.c) ?*SDL_Mutex;
pub const PFN_SDL_DestroyMutex = *const fn (mutex: ?*SDL_Mutex) callconv(.c) void;
pub const PFN_SDL_LockMutex = *const fn (mutex: ?*SDL_Mutex) callconv(.c) bool;
pub const PFN_SDL_UnlockMutex = *const fn (mutex: ?*SDL_Mutex) callconv(.c) bool;
pub const PFN_SDL_TryLockMutex = *const fn (mutex: ?*SDL_Mutex) callconv(.c) bool;
pub const PFN_SDL_CreateCondition = *const fn () callconv(.c) ?*SDL_Condition;
pub const PFN_SDL_DestroyCondition = *const fn (cond: ?*SDL_Condition) callconv(.c) void;
pub const PFN_SDL_SignalCondition = *const fn (cond: ?*SDL_Condition) callconv(.c) bool;
pub const PFN_SDL_BroadcastCondition = *const fn (cond: ?*SDL_Condition) callconv(.c) bool;
pub const PFN_SDL_WaitCondition = *const fn (cond: ?*SDL_Condition, mutex: ?*SDL_Mutex) callconv(.c) bool;
pub const PFN_SDL_WaitConditionTimeout = *const fn (cond: ?*SDL_Condition, mutex: ?*SDL_Mutex, ms: Uint32) callconv(.c) bool;
pub const PFN_SDL_CreateSemaphore = *const fn (initial_value: Uint32) callconv(.c) ?*SDL_Semaphore;
pub const PFN_SDL_DestroySemaphore = *const fn (sem: ?*SDL_Semaphore) callconv(.c) void;
pub const PFN_SDL_SemWait = *const fn (sem: ?*SDL_Semaphore) callconv(.c) bool;
pub const PFN_SDL_SemTryWait = *const fn (sem: ?*SDL_Semaphore) callconv(.c) bool;
pub const PFN_SDL_SemWaitTimeout = *const fn (sem: ?*SDL_Semaphore, ms: Sint32) callconv(.c) bool;
pub const PFN_SDL_SemPost = *const fn (sem: ?*SDL_Semaphore) callconv(.c) bool;
pub const PFN_SDL_SemValue = *const fn (sem: ?*SDL_Semaphore) callconv(.c) Uint32;
pub const PFN_SDL_GetThreadName = *const fn (thread: ?*SDL_Thread) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_SetCurrentThreadPriority = *const fn (priority: SDL_ThreadPriority) callconv(.c) bool;
pub const PFN_SDL_GetCurrentThreadPriority = *const fn () callconv(.c) SDL_ThreadPriority;
pub const PFN_SDL_GetCurrentThreadID = *const fn () callconv(.c) SDL_ThreadID;
pub const PFN_SDL_DetachThread = *const fn (thread: ?*SDL_Thread) callconv(.c) void;
pub const PFN_SDL_GetThreadID = *const fn (thread: ?*SDL_Thread) callconv(.c) SDL_ThreadID;
pub const PFN_SDL_GetThreadState = *const fn (thread: ?*SDL_Thread) callconv(.c) SDL_ThreadState;
pub const PFN_SDL_GetTLS = *const fn (id: ?*SDL_TLSID) callconv(.c) ?*anyopaque;
pub const PFN_SDL_SetTLS = *const fn (id: ?*SDL_TLSID, value: ?*const anyopaque, destructor: SDL_TLSDestructorCallback) callconv(.c) bool;
pub const PFN_SDL_CleanupTLS = *const fn () callconv(.c) void;

pub const ThreadFunctions = struct {
    createThread: PFN_SDL_CreateThread,
    createThreadWithProperties: PFN_SDL_CreateThreadWithProperties,
    waitThread: PFN_SDL_WaitThread,
    createMutex: PFN_SDL_CreateMutex,
    destroyMutex: PFN_SDL_DestroyMutex,
    lockMutex: PFN_SDL_LockMutex,
    unlockMutex: PFN_SDL_UnlockMutex,
    tryLockMutex: PFN_SDL_TryLockMutex,
    createCondition: PFN_SDL_CreateCondition,
    destroyCondition: PFN_SDL_DestroyCondition,
    signalCondition: PFN_SDL_SignalCondition,
    broadcastCondition: PFN_SDL_BroadcastCondition,
    waitCondition: PFN_SDL_WaitCondition,
    waitConditionTimeout: PFN_SDL_WaitConditionTimeout,
    createSemaphore: PFN_SDL_CreateSemaphore,
    destroySemaphore: PFN_SDL_DestroySemaphore,
    semWait: PFN_SDL_SemWait,
    semTryWait: PFN_SDL_SemTryWait,
    semWaitTimeout: PFN_SDL_SemWaitTimeout,
    semPost: PFN_SDL_SemPost,
    semValue: PFN_SDL_SemValue,
    getThreadName: PFN_SDL_GetThreadName,
    setCurrentThreadPriority: PFN_SDL_SetCurrentThreadPriority,
    getCurrentThreadPriority: PFN_SDL_GetCurrentThreadPriority,
    getCurrentThreadID: PFN_SDL_GetCurrentThreadID,
    detachThread: PFN_SDL_DetachThread,
    getThreadID: PFN_SDL_GetThreadID,
    getThreadState: PFN_SDL_GetThreadState,
    getTLS: PFN_SDL_GetTLS,
    setTLS: PFN_SDL_SetTLS,
    cleanupTLS: PFN_SDL_CleanupTLS,

    pub fn load(handle: dynamic.LibraryHandle) !ThreadFunctions {
        return dynamic.loadFunctions(ThreadFunctions, handle, "SDL_", .{
            .{ "createThread", "SDL_CreateThreadRuntime" },
            .{ "createThreadWithProperties", "SDL_CreateThreadWithPropertiesRuntime" },
            .{ "semWait", "SDL_WaitSemaphore" },
            .{ "semTryWait", "SDL_TryWaitSemaphore" },
            .{ "semWaitTimeout", "SDL_WaitSemaphoreTimeout" },
            .{ "semPost", "SDL_SignalSemaphore" },
            .{ "semValue", "SDL_GetSemaphoreValue" },
        }, &.{ "getCurrentThreadPriority" });
    }
};
