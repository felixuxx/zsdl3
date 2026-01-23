// SDL3 AsyncIO Bindings
// Asynchronous file I/O

const core = @import("core.zig");
const filesystem = @import("filesystem.zig");

// Import types
pub const Uint64 = core.Uint64;

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
    bytes_transferred: Uint64,
    userdata: ?*anyopaque,
};

// AsyncIO functions
extern fn SDL_AsyncIOFromFile(file: ?[*:0]const u8, mode: ?[*:0]const u8) ?*SDL_AsyncIO;
extern fn SDL_GetAsyncIOSize(asyncio: ?*SDL_AsyncIO) bool;
extern fn SDL_ReadAsyncIO(asyncio: ?*SDL_AsyncIO, ptr: ?*anyopaque, len: Uint64, offset: Uint64, queue: ?*SDL_AsyncIOQueue, userdata: ?*anyopaque) bool;
extern fn SDL_WriteAsyncIO(asyncio: ?*SDL_AsyncIO, ptr: ?*const anyopaque, len: Uint64, offset: Uint64, queue: ?*SDL_AsyncIOQueue, userdata: ?*anyopaque) bool;
extern fn SDL_CloseAsyncIO(asyncio: ?*SDL_AsyncIO, flush: bool, queue: ?*SDL_AsyncIOQueue, userdata: ?*anyopaque) bool;
extern fn SDL_CreateAsyncIOQueue() ?*SDL_AsyncIOQueue;
extern fn SDL_DestroyAsyncIOQueue(queue: ?*SDL_AsyncIOQueue) void;
extern fn SDL_GetAsyncIOResult(queue: ?*SDL_AsyncIOQueue, outcome: ?*SDL_AsyncIOOutcome) bool;
extern fn SDL_WaitAsyncIOResult(queue: ?*SDL_AsyncIOQueue, outcome: ?*SDL_AsyncIOOutcome) bool;

// Public API
pub const asyncIOFromFile = SDL_AsyncIOFromFile;
pub const getAsyncIOSize = SDL_GetAsyncIOSize;
pub const readAsyncIO = SDL_ReadAsyncIO;
pub const writeAsyncIO = SDL_WriteAsyncIO;
pub const closeAsyncIO = SDL_CloseAsyncIO;
pub const createAsyncIOQueue = SDL_CreateAsyncIOQueue;
pub const destroyAsyncIOQueue = SDL_DestroyAsyncIOQueue;
pub const getAsyncIOResult = SDL_GetAsyncIOResult;
pub const waitAsyncIOResult = SDL_WaitAsyncIOResult;
