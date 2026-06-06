// SDL3 Atomic Bindings
// Lock-free atomic operations

const dynamic = @import("dynamic.zig");

// Atomic types
pub const SDL_SpinLock = c_int;
pub const SDL_AtomicInt = extern struct {
    value: c_int,
};

// Atomic functions
pub const PFN_SDL_TryLockSpinlock = *const fn (lock: ?*SDL_SpinLock) callconv(.c) bool;
pub const PFN_SDL_LockSpinlock = *const fn (lock: ?*SDL_SpinLock) callconv(.c) void;
pub const PFN_SDL_UnlockSpinlock = *const fn (lock: ?*SDL_SpinLock) callconv(.c) void;
pub const PFN_SDL_AtomicIncRef = *const fn (atomic: ?*anyopaque) callconv(.c) c_int;
pub const PFN_SDL_AtomicDecRef = *const fn (atomic: ?*anyopaque) callconv(.c) c_int;
pub const PFN_SDL_MemoryBarrierReleaseFunction = *const fn () callconv(.c) void;
pub const PFN_SDL_MemoryBarrierAcquireFunction = *const fn () callconv(.c) void;

pub const AtomicFunctions = struct {
    tryLockSpinlock: PFN_SDL_TryLockSpinlock,
    lockSpinlock: PFN_SDL_LockSpinlock,
    unlockSpinlock: PFN_SDL_UnlockSpinlock,
    atomicIncRef: PFN_SDL_AtomicIncRef,
    atomicDecRef: PFN_SDL_AtomicDecRef,
    memoryBarrierReleaseFunction: PFN_SDL_MemoryBarrierReleaseFunction,
    memoryBarrierAcquireFunction: PFN_SDL_MemoryBarrierAcquireFunction,

    pub fn load(handle: dynamic.LibraryHandle) !AtomicFunctions {
        return dynamic.loadFunctions(AtomicFunctions, handle, "SDL_", .{}, &.{ "atomicIncRef", "atomicDecRef" });
    }
};
