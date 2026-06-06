// SDL3 AsyncIO Bindings
// Asynchronous file I/O

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

// Import types
pub const Uint64 = core.Uint64;
pub const Sint64 = core.Sint64;
pub const Sint32 = core.Sint32;

// AsyncIO handle
pub const SDL_AsyncIO = opaque {};

// AsyncIO queue
pub const SDL_AsyncIOQueue = opaque {};

// AsyncIO task type
pub const SDL_AsyncIOTaskType = enum(c_int) {
    SDL_ASYNCIO_TASK_READ,
    SDL_ASYNCIO_TASK_WRITE,
    SDL_ASYNCIO_TASK_CLOSE,
};

// AsyncIO result
pub const SDL_AsyncIOResult = enum(c_int) {
    SDL_ASYNCIO_COMPLETE,
    SDL_ASYNCIO_FAILURE,
    SDL_ASYNCIO_CANCELED,
};

// AsyncIO outcome
pub const SDL_AsyncIOOutcome = extern struct {
    asyncio: ?*SDL_AsyncIO,
    type_: SDL_AsyncIOTaskType,
    result: SDL_AsyncIOResult,
    buffer: ?*anyopaque,
    offset: Uint64,
    bytes_requested: Uint64,
    bytes_transferred: Uint64,
    userdata: ?*anyopaque,
};

// AsyncIO functions
pub const PFN_SDL_AsyncIOFromFile = *const fn (file: ?[*:0]const u8, mode: ?[*:0]const u8) callconv(.c) ?*SDL_AsyncIO;
pub const PFN_SDL_GetAsyncIOSize = *const fn (asyncio: ?*SDL_AsyncIO) callconv(.c) Sint64;
pub const PFN_SDL_ReadAsyncIO = *const fn (asyncio: ?*SDL_AsyncIO, ptr: ?*anyopaque, offset: Uint64, size: Uint64, queue: ?*SDL_AsyncIOQueue, userdata: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_WriteAsyncIO = *const fn (asyncio: ?*SDL_AsyncIO, ptr: ?*const anyopaque, offset: Uint64, size: Uint64, queue: ?*SDL_AsyncIOQueue, userdata: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_CloseAsyncIO = *const fn (asyncio: ?*SDL_AsyncIO, flush: bool, queue: ?*SDL_AsyncIOQueue, userdata: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_CreateAsyncIOQueue = *const fn () callconv(.c) ?*SDL_AsyncIOQueue;
pub const PFN_SDL_DestroyAsyncIOQueue = *const fn (queue: ?*SDL_AsyncIOQueue) callconv(.c) void;
pub const PFN_SDL_GetAsyncIOResult = *const fn (queue: ?*SDL_AsyncIOQueue, outcome: ?*SDL_AsyncIOOutcome) callconv(.c) bool;
pub const PFN_SDL_WaitAsyncIOResult = *const fn (queue: ?*SDL_AsyncIOQueue, outcome: ?*SDL_AsyncIOOutcome, timeoutMS: Sint32) callconv(.c) bool;

pub const AsyncIOFunctions = struct {
    asyncIOFromFile: PFN_SDL_AsyncIOFromFile,
    getAsyncIOSize: PFN_SDL_GetAsyncIOSize,
    readAsyncIO: PFN_SDL_ReadAsyncIO,
    writeAsyncIO: PFN_SDL_WriteAsyncIO,
    closeAsyncIO: PFN_SDL_CloseAsyncIO,
    createAsyncIOQueue: PFN_SDL_CreateAsyncIOQueue,
    destroyAsyncIOQueue: PFN_SDL_DestroyAsyncIOQueue,
    getAsyncIOResult: PFN_SDL_GetAsyncIOResult,
    waitAsyncIOResult: PFN_SDL_WaitAsyncIOResult,

    pub fn load(handle: dynamic.LibraryHandle) !AsyncIOFunctions {
        return dynamic.loadFunctions(AsyncIOFunctions, handle, "SDL_", .{}, &.{});
    }
};
