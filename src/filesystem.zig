// SDL3 Filesystem Bindings
// File I/O abstractions

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

pub const Uint8 = core.Uint8;
pub const Sint8 = core.Sint8;
pub const Uint16 = core.Uint16;
pub const Sint16 = core.Sint16;
pub const Uint32 = core.Uint32;
pub const Sint32 = core.Sint32;
pub const Uint64 = core.Uint64;
pub const Sint64 = core.Sint64;
pub const SDL_GlobFlags = Uint32;

// Import types
// Filesystem structs
pub const SDL_IOStream = opaque {};

// Filesystem path types and enums
pub const SDL_Folder = enum(c_int) {
    SDL_FOLDER_HOME,
    SDL_FOLDER_DESKTOP,
    SDL_FOLDER_DOCUMENTS,
    SDL_FOLDER_DOWNLOADS,
    SDL_FOLDER_MUSIC,
    SDL_FOLDER_PICTURES,
    SDL_FOLDER_PUBLICSHARE,
    SDL_FOLDER_SAVEDGAMES,
    SDL_FOLDER_SCREENSHOTS,
    SDL_FOLDER_TEMPLATES,
    SDL_FOLDER_VIDEOS,
    SDL_FOLDER_COUNT,
};

pub const SDL_PathType = enum(c_int) {
    SDL_PATHTYPE_NONE,
    SDL_PATHTYPE_FILE,
    SDL_PATHTYPE_DIRECTORY,
    SDL_PATHTYPE_OTHER,
};

pub const SDL_PathInfo = extern struct {
    type: SDL_PathType,
    size: Uint64,
    create_time: Sint64,
    modify_time: Sint64,
    access_time: Sint64,
};

pub const SDL_GLOB_CASEINSENSITIVE: SDL_GlobFlags = 1 << 0;

pub const SDL_EnumerationResult = enum(c_int) {
    SDL_ENUM_CONTINUE,
    SDL_ENUM_SUCCESS,
    SDL_ENUM_FAILURE,
};

pub const SDL_EnumerateDirectoryCallback = ?*const fn (?*anyopaque, [*:0]const u8, [*:0]const u8) callconv(.c) SDL_EnumerationResult;

// Async I/O
pub const SDL_AsyncIO = opaque {};
pub const SDL_AsyncIOOutcome = extern struct {
    asyncio: ?*SDL_AsyncIO,
    type_: SDL_AsyncIOTaskType,
    result: SDL_AsyncIOResult,
    buffer: ?*anyopaque,
    offset: Uint64,
    bytes_transferred: Uint64,
    userdata: ?*anyopaque,
};
pub const SDL_AsyncIOTaskType = enum(c_int) {
    SDL_ASYNCIO_TASK_READ,
    SDL_ASYNCIO_TASK_WRITE,
    SDL_ASYNCIO_TASK_CLOSE,
};
pub const SDL_AsyncIOResult = enum(c_int) {
    SDL_ASYNCIO_COMPLETE,
    SDL_ASYNCIO_FAILURE,
    SDL_ASYNCIO_CANCELED,
};
pub const SDL_AsyncIOQueue = opaque {};

// Filesystem path functions
pub const PFN_SDL_GetBasePath = *const fn () callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetPrefPath = *const fn (org: ?[*:0]const u8, app: [*:0]const u8) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_GetUserFolder = *const fn (folder: SDL_Folder) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetCurrentDirectory = *const fn () callconv(.c) ?[*:0]u8;
pub const PFN_SDL_CreateDirectory = *const fn (path: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_RemovePath = *const fn (path: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_RenamePath = *const fn (oldpath: [*:0]const u8, newpath: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_CopyFile = *const fn (oldpath: [*:0]const u8, newpath: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GetPathInfo = *const fn (path: [*:0]const u8, info: ?*SDL_PathInfo) callconv(.c) bool;
pub const PFN_SDL_EnumerateDirectory = *const fn (path: [*:0]const u8, callback: SDL_EnumerateDirectoryCallback, userdata: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_GlobDirectory = *const fn (path: [*:0]const u8, pattern: ?[*:0]const u8, flags: SDL_GlobFlags, count: ?*c_int) callconv(.c) ?[*]?[*:0]u8;

// Filesystem I/O functions
pub const PFN_SDL_IOFromFile = *const fn (file: ?[*:0]const u8, mode: ?[*:0]const u8) callconv(.c) ?*SDL_IOStream;
pub const PFN_SDL_CloseIO = *const fn (stream: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_SDL_ReadIO = *const fn (stream: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) callconv(.c) usize;
pub const PFN_SDL_WriteIO = *const fn (stream: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) callconv(.c) usize;
pub const PFN_SDL_SeekIO = *const fn (stream: ?*SDL_IOStream, offset: Sint64, whence: c_int) callconv(.c) Sint64;
pub const PFN_SDL_TellIO = *const fn (stream: ?*SDL_IOStream) callconv(.c) Sint64;
pub const PFN_SDL_GetIOSize = *const fn (stream: ?*SDL_IOStream) callconv(.c) Sint64;
pub const PFN_SDL_FlushIO = *const fn (stream: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_SDL_LoadFile = *const fn (file: ?[*:0]const u8, datasize: ?*usize) callconv(.c) ?*anyopaque;
pub const PFN_SDL_SaveFile = *const fn (file: ?[*:0]const u8, data: ?*const anyopaque, datasize: usize) callconv(.c) bool;
pub const PFN_SDL_ReadU8 = *const fn (stream: ?*SDL_IOStream, value: ?*Uint8) callconv(.c) bool;
pub const PFN_SDL_ReadS8 = *const fn (stream: ?*SDL_IOStream, value: ?*Sint8) callconv(.c) bool;
pub const PFN_SDL_ReadU16LE = *const fn (stream: ?*SDL_IOStream, value: ?*Uint16) callconv(.c) bool;
pub const PFN_SDL_ReadS16LE = *const fn (stream: ?*SDL_IOStream, value: ?*Sint16) callconv(.c) bool;
pub const PFN_SDL_ReadU16BE = *const fn (stream: ?*SDL_IOStream, value: ?*Uint16) callconv(.c) bool;
pub const PFN_SDL_ReadS16BE = *const fn (stream: ?*SDL_IOStream, value: ?*Sint16) callconv(.c) bool;
pub const PFN_SDL_ReadU32LE = *const fn (stream: ?*SDL_IOStream, value: ?*Uint32) callconv(.c) bool;
pub const PFN_SDL_ReadS32LE = *const fn (stream: ?*SDL_IOStream, value: ?*Sint32) callconv(.c) bool;
pub const PFN_SDL_ReadU32BE = *const fn (stream: ?*SDL_IOStream, value: ?*Uint32) callconv(.c) bool;
pub const PFN_SDL_ReadS32BE = *const fn (stream: ?*SDL_IOStream, value: ?*Sint32) callconv(.c) bool;
pub const PFN_SDL_ReadU64LE = *const fn (stream: ?*SDL_IOStream, value: ?*Uint64) callconv(.c) bool;
pub const PFN_SDL_ReadS64LE = *const fn (stream: ?*SDL_IOStream, value: ?*Sint64) callconv(.c) bool;
pub const PFN_SDL_ReadU64BE = *const fn (stream: ?*SDL_IOStream, value: ?*Uint64) callconv(.c) bool;
pub const PFN_SDL_ReadS64BE = *const fn (stream: ?*SDL_IOStream, value: ?*Sint64) callconv(.c) bool;
pub const PFN_SDL_WriteU8 = *const fn (stream: ?*SDL_IOStream, value: Uint8) callconv(.c) bool;
pub const PFN_SDL_WriteS8 = *const fn (stream: ?*SDL_IOStream, value: Sint8) callconv(.c) bool;
pub const PFN_SDL_WriteU16LE = *const fn (stream: ?*SDL_IOStream, value: Uint16) callconv(.c) bool;
pub const PFN_SDL_WriteS16LE = *const fn (stream: ?*SDL_IOStream, value: Sint16) callconv(.c) bool;
pub const PFN_SDL_WriteU16BE = *const fn (stream: ?*SDL_IOStream, value: Uint16) callconv(.c) bool;
pub const PFN_SDL_WriteS16BE = *const fn (stream: ?*SDL_IOStream, value: Sint16) callconv(.c) bool;
pub const PFN_SDL_WriteU32LE = *const fn (stream: ?*SDL_IOStream, value: Uint32) callconv(.c) bool;
pub const PFN_SDL_WriteS32LE = *const fn (stream: ?*SDL_IOStream, value: Sint32) callconv(.c) bool;
pub const PFN_SDL_WriteU32BE = *const fn (stream: ?*SDL_IOStream, value: Uint32) callconv(.c) bool;
pub const PFN_SDL_WriteS32BE = *const fn (stream: ?*SDL_IOStream, value: Sint32) callconv(.c) bool;
pub const PFN_SDL_WriteU64LE = *const fn (stream: ?*SDL_IOStream, value: Uint64) callconv(.c) bool;
pub const PFN_SDL_WriteS64LE = *const fn (stream: ?*SDL_IOStream, value: Sint64) callconv(.c) bool;
pub const PFN_SDL_WriteU64BE = *const fn (stream: ?*SDL_IOStream, value: Uint64) callconv(.c) bool;
pub const PFN_SDL_WriteS64BE = *const fn (stream: ?*SDL_IOStream, value: Sint64) callconv(.c) bool;
pub const PFN_SDL_IOFromConstMem = *const fn (mem: ?*const anyopaque, size: usize) callconv(.c) ?*SDL_IOStream;
pub const PFN_SDL_IOFromMem = *const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*SDL_IOStream;
pub const PFN_SDL_IOFromDynamicMem = *const fn () callconv(.c) ?*SDL_IOStream;
pub const PFN_SDL_GetIOProperties = *const fn (stream: ?*SDL_IOStream) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_GetIOStatus = *const fn (stream: ?*SDL_IOStream) callconv(.c) c_int;

pub const FileSystemFunctions = struct {
    getBasePath: PFN_SDL_GetBasePath,
    getPrefPath: PFN_SDL_GetPrefPath,
    getUserFolder: PFN_SDL_GetUserFolder,
    getCurrentDirectory: PFN_SDL_GetCurrentDirectory,
    createDirectory: PFN_SDL_CreateDirectory,
    removePath: PFN_SDL_RemovePath,
    renamePath: PFN_SDL_RenamePath,
    copyFile: PFN_SDL_CopyFile,
    getPathInfo: PFN_SDL_GetPathInfo,
    enumerateDirectory: PFN_SDL_EnumerateDirectory,
    globDirectory: PFN_SDL_GlobDirectory,
    ioFromFile: PFN_SDL_IOFromFile,
    closeIO: PFN_SDL_CloseIO,
    readIO: PFN_SDL_ReadIO,
    writeIO: PFN_SDL_WriteIO,
    seekIO: PFN_SDL_SeekIO,
    tellIO: PFN_SDL_TellIO,
    getIOSize: PFN_SDL_GetIOSize,
    flushIO: PFN_SDL_FlushIO,
    loadFile: PFN_SDL_LoadFile,
    saveFile: PFN_SDL_SaveFile,
    readU8: PFN_SDL_ReadU8,
    readS8: PFN_SDL_ReadS8,
    readU16LE: PFN_SDL_ReadU16LE,
    readS16LE: PFN_SDL_ReadS16LE,
    readU16BE: PFN_SDL_ReadU16BE,
    readS16BE: PFN_SDL_ReadS16BE,
    readU32LE: PFN_SDL_ReadU32LE,
    readS32LE: PFN_SDL_ReadS32LE,
    readU32BE: PFN_SDL_ReadU32BE,
    readS32BE: PFN_SDL_ReadS32BE,
    readU64LE: PFN_SDL_ReadU64LE,
    readS64LE: PFN_SDL_ReadS64LE,
    readU64BE: PFN_SDL_ReadU64BE,
    readS64BE: PFN_SDL_ReadS64BE,
    writeU8: PFN_SDL_WriteU8,
    writeS8: PFN_SDL_WriteS8,
    writeU16LE: PFN_SDL_WriteU16LE,
    writeS16LE: PFN_SDL_WriteS16LE,
    writeU16BE: PFN_SDL_WriteU16BE,
    writeS16BE: PFN_SDL_WriteS16BE,
    writeU32LE: PFN_SDL_WriteU32LE,
    writeS32LE: PFN_SDL_WriteS32LE,
    writeU32BE: PFN_SDL_WriteU32BE,
    writeS32BE: PFN_SDL_WriteS32BE,
    writeU64LE: PFN_SDL_WriteU64LE,
    writeS64LE: PFN_SDL_WriteS64LE,
    writeU64BE: PFN_SDL_WriteU64BE,
    writeS64BE: PFN_SDL_WriteS64BE,
    ioFromConstMem: PFN_SDL_IOFromConstMem,
    ioFromMem: PFN_SDL_IOFromMem,
    ioFromDynamicMem: PFN_SDL_IOFromDynamicMem,
    getIOProperties: PFN_SDL_GetIOProperties,
    getIOStatus: PFN_SDL_GetIOStatus,

    pub fn load(handle: dynamic.LibraryHandle) !FileSystemFunctions {
        return dynamic.loadFunctions(FileSystemFunctions, handle, "SDL_", .{.{ "ioFromFile", "SDL_IOFromFile" }, .{ "ioFromConstMem", "SDL_IOFromConstMem" }, .{ "ioFromMem", "SDL_IOFromMem" }, .{ "ioFromDynamicMem", "SDL_IOFromDynamicMem" }}, &.{});
    }
};
