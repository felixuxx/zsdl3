// SDL3 Atomic Bindings
// Lock-free atomic operations

// Atomic types
pub const SDL_SpinLock = c_int;
pub const SDL_AtomicInt = extern struct {
    value: c_int,
};

// Atomic functions
extern fn SDL_TryLockSpinlock(lock: ?*SDL_SpinLock) bool;
extern fn SDL_LockSpinlock(lock: ?*SDL_SpinLock) void;
extern fn SDL_UnlockSpinlock(lock: ?*SDL_SpinLock) void;
extern fn SDL_MemoryBarrierReleaseFunction() void;
extern fn SDL_MemoryBarrierAcquireFunction() void;

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
