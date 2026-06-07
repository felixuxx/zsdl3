// SDL3 Atomic Bindings
// Lock-free atomic operations

const core = @import("core.zig");
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
pub const PFN_SDL_AddAtomicInt = *const fn (a: ?*SDL_AtomicInt, v: c_int) callconv(.c) c_int;
pub const PFN_SDL_AddAtomicU32 = *const fn (a: ?*core.Uint32, v: core.Uint32) callconv(.c) core.Uint32;
pub const PFN_SDL_CompareAndSwapAtomicInt = *const fn (a: ?*SDL_AtomicInt, oldval: c_int, newval: c_int) callconv(.c) bool;
pub const PFN_SDL_CompareAndSwapAtomicPointer = *const fn (a: ?*?*anyopaque, oldval: ?*anyopaque, newval: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_CompareAndSwapAtomicU32 = *const fn (a: ?*core.Uint32, oldval: core.Uint32, newval: core.Uint32) callconv(.c) bool;
pub const PFN_SDL_GetAtomicInt = *const fn (a: ?*SDL_AtomicInt) callconv(.c) c_int;
pub const PFN_SDL_GetAtomicPointer = *const fn (a: ?*?*anyopaque) callconv(.c) ?*anyopaque;
pub const PFN_SDL_GetAtomicU32 = *const fn (a: ?*core.Uint32) callconv(.c) core.Uint32;
pub const PFN_SDL_SetAtomicInt = *const fn (a: ?*SDL_AtomicInt, v: c_int) callconv(.c) c_int;
pub const PFN_SDL_SetAtomicPointer = *const fn (a: ?*?*anyopaque, v: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const PFN_SDL_SetAtomicU32 = *const fn (a: ?*core.Uint32, v: core.Uint32) callconv(.c) core.Uint32;

pub const AtomicFunctions = struct {
    tryLockSpinlock: PFN_SDL_TryLockSpinlock,
    lockSpinlock: PFN_SDL_LockSpinlock,
    unlockSpinlock: PFN_SDL_UnlockSpinlock,
    atomicIncRef: ?PFN_SDL_AtomicIncRef,
    atomicDecRef: ?PFN_SDL_AtomicDecRef,
    memoryBarrierReleaseFunction: PFN_SDL_MemoryBarrierReleaseFunction,
    memoryBarrierAcquireFunction: PFN_SDL_MemoryBarrierAcquireFunction,
    addAtomicInt: PFN_SDL_AddAtomicInt,
    addAtomicU32: PFN_SDL_AddAtomicU32,
    compareAndSwapAtomicInt: PFN_SDL_CompareAndSwapAtomicInt,
    compareAndSwapAtomicPointer: PFN_SDL_CompareAndSwapAtomicPointer,
    compareAndSwapAtomicU32: PFN_SDL_CompareAndSwapAtomicU32,
    getAtomicInt: PFN_SDL_GetAtomicInt,
    getAtomicPointer: PFN_SDL_GetAtomicPointer,
    getAtomicU32: PFN_SDL_GetAtomicU32,
    setAtomicInt: PFN_SDL_SetAtomicInt,
    setAtomicPointer: PFN_SDL_SetAtomicPointer,
    setAtomicU32: PFN_SDL_SetAtomicU32,

    pub fn load(handle: dynamic.LibraryHandle) !AtomicFunctions {
        return dynamic.loadFunctions(AtomicFunctions, handle, "SDL_", .{}, &.{ "atomicIncRef", "atomicDecRef" });
    }
};
