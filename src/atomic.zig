// SDL3 Atomic Bindings
// Lock-free atomic operations

const core = @import("core.zig");

// Atomic types
pub const SDL_SpinLock = c_int;
pub const SDL_AtomicInt = extern struct {
    value: c_int,
};
pub const SDL_AtomicU32 = extern struct {
    value: core.Uint32,
};

// Atomic functions
extern fn SDL_TryLockSpinlock(lock: ?*SDL_SpinLock) bool;
extern fn SDL_LockSpinlock(lock: ?*SDL_SpinLock) void;
extern fn SDL_UnlockSpinlock(lock: ?*SDL_SpinLock) void;
extern fn SDL_MemoryBarrierReleaseFunction() void;
extern fn SDL_MemoryBarrierAcquireFunction() void;
extern fn SDL_CompareAndSwapAtomicInt(a: ?*SDL_AtomicInt, oldval: c_int, newval: c_int) bool;
extern fn SDL_SetAtomicInt(a: ?*SDL_AtomicInt, v: c_int) c_int;
extern fn SDL_GetAtomicInt(a: ?*SDL_AtomicInt) c_int;
extern fn SDL_AddAtomicInt(a: ?*SDL_AtomicInt, v: c_int) c_int;
extern fn SDL_CompareAndSwapAtomicU32(a: ?*SDL_AtomicU32, oldval: core.Uint32, newval: core.Uint32) bool;
extern fn SDL_SetAtomicU32(a: ?*SDL_AtomicU32, v: core.Uint32) core.Uint32;
extern fn SDL_GetAtomicU32(a: ?*SDL_AtomicU32) core.Uint32;
extern fn SDL_AddAtomicU32(a: ?*SDL_AtomicU32, v: c_int) core.Uint32;
extern fn SDL_CompareAndSwapAtomicPointer(a: ?*?*anyopaque, oldval: ?*anyopaque, newval: ?*anyopaque) bool;
extern fn SDL_SetAtomicPointer(a: ?*?*anyopaque, v: ?*anyopaque) ?*anyopaque;
extern fn SDL_GetAtomicPointer(a: ?*?*anyopaque) ?*anyopaque;

// Inline wrappers for C macros
pub fn SDL_AtomicIncRef(a: ?*SDL_AtomicInt) void {
    _ = SDL_AddAtomicInt(a, 1);
}
pub fn SDL_AtomicDecRef(a: ?*SDL_AtomicInt) bool {
    return SDL_AddAtomicInt(a, -1) == 1;
}

// Public API
pub const tryLockSpinlock = SDL_TryLockSpinlock;
pub const lockSpinlock = SDL_LockSpinlock;
pub const unlockSpinlock = SDL_UnlockSpinlock;
pub const atomicIncRef = SDL_AtomicIncRef;
pub const atomicDecRef = SDL_AtomicDecRef;
pub const memoryBarrierReleaseFunction = SDL_MemoryBarrierReleaseFunction;
pub const memoryBarrierAcquireFunction = SDL_MemoryBarrierAcquireFunction;
pub const compareAndSwapAtomicInt = SDL_CompareAndSwapAtomicInt;
pub const setAtomicInt = SDL_SetAtomicInt;
pub const getAtomicInt = SDL_GetAtomicInt;
pub const addAtomicInt = SDL_AddAtomicInt;
pub const compareAndSwapAtomicU32 = SDL_CompareAndSwapAtomicU32;
pub const setAtomicU32 = SDL_SetAtomicU32;
pub const getAtomicU32 = SDL_GetAtomicU32;
pub const addAtomicU32 = SDL_AddAtomicU32;
pub const compareAndSwapAtomicPointer = SDL_CompareAndSwapAtomicPointer;
pub const setAtomicPointer = SDL_SetAtomicPointer;
pub const getAtomicPointer = SDL_GetAtomicPointer;
