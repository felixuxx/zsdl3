// SDL3 Atomic Bindings
// Lock-free atomic operations

const core = @import("core.zig");

// Atomic types
pub const SDL_SpinLock = c_int;

// Atomic functions
extern fn SDL_TryLockSpinlock(lock: ?*SDL_SpinLock) bool;
extern fn SDL_LockSpinlock(lock: ?*SDL_SpinLock) void;
extern fn SDL_UnlockSpinlock(lock: ?*SDL_SpinLock) void;
extern fn SDL_AtomicIncRef(atomic: ?*anyopaque) c_int;
extern fn SDL_AtomicDecRef(atomic: ?*anyopaque) c_int;
extern fn SDL_MemoryBarrierReleaseFunction() void;
extern fn SDL_MemoryBarrierAcquireFunction() void;

// Public API
pub const tryLockSpinlock = SDL_TryLockSpinlock;
pub const lockSpinlock = SDL_LockSpinlock;
pub const unlockSpinlock = SDL_UnlockSpinlock;
pub const atomicIncRef = SDL_AtomicIncRef;
pub const atomicDecRef = SDL_AtomicDecRef;
pub const memoryBarrierReleaseFunction = SDL_MemoryBarrierReleaseFunction;
pub const memoryBarrierAcquireFunction = SDL_MemoryBarrierAcquireFunction;
