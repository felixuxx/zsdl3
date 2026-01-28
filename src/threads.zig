// SDL3 Threads Bindings
// Multithreading support

const atomic = @import("atomic.zig");
pub const SDL_TLSID = atomic.SDL_AtomicInt;
const core = @import("core.zig");
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

pub const SDL_TLSDestructorCallback = ?*const fn (?*anyopaque) callconv(.C) void;

// Thread functions
extern fn SDL_CreateThread(func: ?*const fn (?*anyopaque) callconv(.C) c_int, name: ?[*:0]const u8, data: ?*anyopaque) ?*SDL_Thread;
extern fn SDL_CreateThreadWithProperties(props: core.SDL_PropertiesID) ?*SDL_Thread;
extern fn SDL_WaitThread(thread: ?*SDL_Thread, status: ?*c_int) void;
extern fn SDL_CreateMutex() ?*SDL_Mutex;
extern fn SDL_DestroyMutex(mutex: ?*SDL_Mutex) void;
extern fn SDL_LockMutex(mutex: ?*SDL_Mutex) bool;
extern fn SDL_UnlockMutex(mutex: ?*SDL_Mutex) bool;
extern fn SDL_TryLockMutex(mutex: ?*SDL_Mutex) bool;
extern fn SDL_CreateCondition() ?*SDL_Condition;
extern fn SDL_DestroyCondition(cond: ?*SDL_Condition) void;
extern fn SDL_SignalCondition(cond: ?*SDL_Condition) bool;
extern fn SDL_BroadcastCondition(cond: ?*SDL_Condition) bool;
extern fn SDL_WaitCondition(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex) bool;
extern fn SDL_WaitConditionTimeout(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex, ms: Uint32) bool;
extern fn SDL_CreateSemaphore(initial_value: Uint32) ?*SDL_Semaphore;
extern fn SDL_DestroySemaphore(sem: ?*SDL_Semaphore) void;
extern fn SDL_SemWait(sem: ?*SDL_Semaphore) bool;
extern fn SDL_SemTryWait(sem: ?*SDL_Semaphore) bool;
extern fn SDL_SemWaitTimeout(sem: ?*SDL_Semaphore, ms: Sint32) bool;
extern fn SDL_SemPost(sem: ?*SDL_Semaphore) bool;
extern fn SDL_SemValue(sem: ?*SDL_Semaphore) Uint32;
extern fn SDL_GetThreadName(thread: ?*SDL_Thread) ?[*:0]const u8;
extern fn SDL_SetCurrentThreadPriority(priority: SDL_ThreadPriority) bool;
extern fn SDL_GetCurrentThreadPriority() SDL_ThreadPriority;
extern fn SDL_GetCurrentThreadID() SDL_ThreadID;
extern fn SDL_DetachThread(thread: ?*SDL_Thread) void;
extern fn SDL_GetThreadID(thread: ?*SDL_Thread) SDL_ThreadID;
extern fn SDL_GetThreadState(thread: ?*SDL_Thread) SDL_ThreadState;
extern fn SDL_GetTLS(id: ?*SDL_TLSID) ?*anyopaque;
extern fn SDL_SetTLS(id: ?*SDL_TLSID, value: ?*const anyopaque, destructor: SDL_TLSDestructorCallback) bool;
extern fn SDL_CleanupTLS() void;

// Public API
pub const createThread = SDL_CreateThread;
pub const waitThread = SDL_WaitThread;
pub const createMutex = SDL_CreateMutex;
pub const destroyMutex = SDL_DestroyMutex;
pub const lockMutex = SDL_LockMutex;
pub const unlockMutex = SDL_UnlockMutex;
pub const tryLockMutex = SDL_TryLockMutex;
pub const createCondition = SDL_CreateCondition;
pub const destroyCondition = SDL_DestroyCondition;
pub const signalCondition = SDL_SignalCondition;
pub const broadcastCondition = SDL_BroadcastCondition;
pub const waitCondition = SDL_WaitCondition;
pub const waitConditionTimeout = SDL_WaitConditionTimeout;
pub const createSemaphore = SDL_CreateSemaphore;
pub const destroySemaphore = SDL_DestroySemaphore;
pub const semWait = SDL_SemWait;
pub const semTryWait = SDL_SemTryWait;
pub const semWaitTimeout = SDL_SemWaitTimeout;
pub const semPost = SDL_SemPost;
pub const semValue = SDL_SemValue;
pub const getThreadName = SDL_GetThreadName;
pub const setCurrentThreadPriority = SDL_SetCurrentThreadPriority;
pub const getCurrentThreadPriority = SDL_GetCurrentThreadPriority;
pub const getCurrentThreadID = SDL_GetCurrentThreadID;
pub const detachThread = SDL_DetachThread;
pub const getThreadID = SDL_GetThreadID;
pub const getThreadState = SDL_GetThreadState;
pub const getTLS = SDL_GetTLS;
pub const setTLS = SDL_SetTLS;
pub const cleanupTLS = SDL_CleanupTLS;
pub const createThreadWithProperties = SDL_CreateThreadWithProperties;
