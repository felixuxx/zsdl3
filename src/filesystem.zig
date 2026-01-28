// SDL3 Filesystem Bindings
// File I/O abstractions

const core = @import("core.zig");
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
    create_time: Sint64, // SDL_Time is Sint64
    modify_time: Sint64, // SDL_Time is Sint64
    access_time: Sint64, // SDL_Time is Sint64
};

pub const SDL_GLOB_CASEINSENSITIVE: SDL_GlobFlags = 1 << 0;

pub const SDL_EnumerationResult = enum(c_int) {
    SDL_ENUM_CONTINUE,
    SDL_ENUM_SUCCESS,
    SDL_ENUM_FAILURE,
};

pub const SDL_EnumerateDirectoryCallback = ?*const fn (?*anyopaque, [*:0]const u8, [*:0]const u8) callconv(.C) SDL_EnumerationResult;

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
extern fn SDL_GetBasePath() ?[*:0]const u8;
extern fn SDL_GetPrefPath(org: ?[*:0]const u8, app: [*:0]const u8) ?[*:0]u8;
extern fn SDL_GetUserFolder(folder: SDL_Folder) ?[*:0]const u8;
extern fn SDL_GetCurrentDirectory() ?[*:0]u8;
extern fn SDL_CreateDirectory(path: [*:0]const u8) bool;
extern fn SDL_RemovePath(path: [*:0]const u8) bool;
extern fn SDL_RenamePath(oldpath: [*:0]const u8, newpath: [*:0]const u8) bool;
extern fn SDL_CopyFile(oldpath: [*:0]const u8, newpath: [*:0]const u8) bool;
extern fn SDL_GetPathInfo(path: [*:0]const u8, info: ?*SDL_PathInfo) bool;
extern fn SDL_EnumerateDirectory(path: [*:0]const u8, callback: SDL_EnumerateDirectoryCallback, userdata: ?*anyopaque) bool;
extern fn SDL_GlobDirectory(path: [*:0]const u8, pattern: ?[*:0]const u8, flags: SDL_GlobFlags, count: ?*c_int) ?[*]?[*:0]u8;

// Filesystem I/O functions
extern fn SDL_IOFromFile(file: ?[*:0]const u8, mode: ?[*:0]const u8) ?*SDL_IOStream;
extern fn SDL_CloseIO(stream: ?*SDL_IOStream) bool;
extern fn SDL_ReadIO(stream: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
extern fn SDL_WriteIO(stream: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize;
extern fn SDL_SeekIO(stream: ?*SDL_IOStream, offset: Sint64, whence: c_int) Sint64;
extern fn SDL_TellIO(stream: ?*SDL_IOStream) Sint64;
extern fn SDL_GetIOSize(stream: ?*SDL_IOStream) Sint64;
extern fn SDL_FlushIO(stream: ?*SDL_IOStream) bool;
extern fn SDL_LoadFile(file: ?[*:0]const u8, datasize: ?*usize) ?*anyopaque;
extern fn SDL_SaveFile(file: ?[*:0]const u8, data: ?*const anyopaque, datasize: usize) bool;
extern fn SDL_ReadU8(stream: ?*SDL_IOStream, value: ?*Uint8) bool;
extern fn SDL_ReadS8(stream: ?*SDL_IOStream, value: ?*Sint8) bool;
extern fn SDL_ReadU16LE(stream: ?*SDL_IOStream, value: ?*Uint16) bool;
extern fn SDL_ReadS16LE(stream: ?*SDL_IOStream, value: ?*Sint16) bool;
extern fn SDL_ReadU16BE(stream: ?*SDL_IOStream, value: ?*Uint16) bool;
extern fn SDL_ReadS16BE(stream: ?*SDL_IOStream, value: ?*Sint16) bool;
extern fn SDL_ReadU32LE(stream: ?*SDL_IOStream, value: ?*Uint32) bool;
extern fn SDL_ReadS32LE(stream: ?*SDL_IOStream, value: ?*Sint32) bool;
extern fn SDL_ReadU32BE(stream: ?*SDL_IOStream, value: ?*Uint32) bool;
extern fn SDL_ReadS32BE(stream: ?*SDL_IOStream, value: ?*Sint32) bool;
extern fn SDL_ReadU64LE(stream: ?*SDL_IOStream, value: ?*Uint64) bool;
extern fn SDL_ReadS64LE(stream: ?*SDL_IOStream, value: ?*Sint64) bool;
extern fn SDL_ReadU64BE(stream: ?*SDL_IOStream, value: ?*Uint64) bool;
extern fn SDL_ReadS64BE(stream: ?*SDL_IOStream, value: ?*Sint64) bool;
extern fn SDL_WriteU8(stream: ?*SDL_IOStream, value: Uint8) bool;
extern fn SDL_WriteS8(stream: ?*SDL_IOStream, value: Sint8) bool;
extern fn SDL_WriteU16LE(stream: ?*SDL_IOStream, value: Uint16) bool;
extern fn SDL_WriteS16LE(stream: ?*SDL_IOStream, value: Sint16) bool;
extern fn SDL_WriteU16BE(stream: ?*SDL_IOStream, value: Uint16) bool;
extern fn SDL_WriteS16BE(stream: ?*SDL_IOStream, value: Sint16) bool;
extern fn SDL_WriteU32LE(stream: ?*SDL_IOStream, value: Uint32) bool;
extern fn SDL_WriteS32LE(stream: ?*SDL_IOStream, value: Sint32) bool;
extern fn SDL_WriteU32BE(stream: ?*SDL_IOStream, value: Uint32) bool;
extern fn SDL_WriteS32BE(stream: ?*SDL_IOStream, value: Sint32) bool;
extern fn SDL_WriteU64LE(stream: ?*SDL_IOStream, value: Uint64) bool;
extern fn SDL_WriteS64LE(stream: ?*SDL_IOStream, value: Sint64) bool;
extern fn SDL_WriteU64BE(stream: ?*SDL_IOStream, value: Uint64) bool;
extern fn SDL_WriteS64BE(stream: ?*SDL_IOStream, value: Sint64) bool;
extern fn SDL_IOFromConstMem(mem: ?*const anyopaque, size: usize) ?*SDL_IOStream;
extern fn SDL_IOFromMem(mem: ?*anyopaque, size: usize) ?*SDL_IOStream;
extern fn SDL_IOFromDynamicMem() ?*SDL_IOStream;
extern fn SDL_GetIOProperties(stream: ?*SDL_IOStream) core.SDL_PropertiesID;
extern fn SDL_GetIOStatus(stream: ?*SDL_IOStream) c_int;

// Public API
pub const getBasePath = SDL_GetBasePath;
pub const getPrefPath = SDL_GetPrefPath;
pub const getUserFolder = SDL_GetUserFolder;
pub const getCurrentDirectory = SDL_GetCurrentDirectory;
pub const createDirectory = SDL_CreateDirectory;
pub const removePath = SDL_RemovePath;
pub const renamePath = SDL_RenamePath;
pub const copyFile = SDL_CopyFile;
pub const getPathInfo = SDL_GetPathInfo;
pub const enumerateDirectory = SDL_EnumerateDirectory;
pub const globDirectory = SDL_GlobDirectory;
pub const ioFromFile = SDL_IOFromFile;
pub const closeIO = SDL_CloseIO;
pub const readIO = SDL_ReadIO;
pub const writeIO = SDL_WriteIO;
pub const seekIO = SDL_SeekIO;
pub const tellIO = SDL_TellIO;
pub const getIOSize = SDL_GetIOSize;
pub const flushIO = SDL_FlushIO;
pub const loadFile = SDL_LoadFile;
pub const saveFile = SDL_SaveFile;
pub const readU8 = SDL_ReadU8;
pub const readS8 = SDL_ReadS8;
pub const readU16LE = SDL_ReadU16LE;
pub const readS16LE = SDL_ReadS16LE;
pub const readU16BE = SDL_ReadU16BE;
pub const readS16BE = SDL_ReadS16BE;
pub const readU32LE = SDL_ReadU32LE;
pub const readS32LE = SDL_ReadS32LE;
pub const readU32BE = SDL_ReadU32BE;
pub const readS32BE = SDL_ReadS32BE;
pub const readU64LE = SDL_ReadU64LE;
pub const readS64LE = SDL_ReadS64LE;
pub const readU64BE = SDL_ReadU64BE;
pub const readS64BE = SDL_ReadS64BE;
pub const writeU8 = SDL_WriteU8;
pub const writeS8 = SDL_WriteS8;
pub const writeU16LE = SDL_WriteU16LE;
pub const writeS16LE = SDL_WriteS16LE;
pub const writeU16BE = SDL_WriteU16BE;
pub const writeS16BE = SDL_WriteS16BE;
pub const writeU32LE = SDL_WriteU32LE;
pub const writeS32LE = SDL_WriteS32LE;
pub const writeU32BE = SDL_WriteU32BE;
pub const writeS32BE = SDL_WriteS32BE;
pub const writeU64LE = SDL_WriteU64LE;
pub const writeS64LE = SDL_WriteS64LE;
pub const writeU64BE = SDL_WriteU64BE;
pub const writeS64BE = SDL_WriteS64BE;
pub const ioFromConstMem = SDL_IOFromConstMem;
pub const ioFromMem = SDL_IOFromMem;
pub const ioFromDynamicMem = SDL_IOFromDynamicMem;
pub const getIOProperties = SDL_GetIOProperties;
pub const getIOStatus = SDL_GetIOStatus;
