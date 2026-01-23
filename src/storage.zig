// SDL3 Storage Bindings
// User/title storage

const core = @import("core.zig");
const filesystem = @import("filesystem.zig");

// Import types
pub const Uint64 = core.Uint64;
pub const SDL_Time = Uint64; // Placeholder

// Storage structs
pub const SDL_Storage = opaque {};

// Storage functions
extern fn SDL_OpenTitleStorage(override: ?[*:0]const u8, props: core.SDL_PropertiesID) ?*SDL_Storage;
extern fn SDL_OpenUserStorage(root: ?[*:0]const u8, name: ?[*:0]const u8, props: core.SDL_PropertiesID) ?*SDL_Storage;
extern fn SDL_OpenFileStorage(path: ?[*:0]const u8) ?*SDL_Storage;
extern fn SDL_CloseStorage(storage: ?*SDL_Storage) bool;
extern fn SDL_StorageReady(storage: ?*SDL_Storage) bool;
extern fn SDL_GetStorageFileSize(storage: ?*SDL_Storage, path: ?[*:0]const u8, length: ?*Uint64) bool;
extern fn SDL_ReadStorageFile(storage: ?*SDL_Storage, path: ?[*:0]const u8, destination: ?*anyopaque, length: Uint64) bool;
extern fn SDL_WriteStorageFile(storage: ?*SDL_Storage, path: ?[*:0]const u8, source: ?*const anyopaque, length: Uint64) bool;
extern fn SDL_CreateStorageDirectory(storage: ?*SDL_Storage, path: ?[*:0]const u8) bool;
extern fn SDL_EnumerateStorageDirectory(storage: ?*SDL_Storage, path: ?[*:0]const u8, callback: ?*const fn (?*anyopaque, ?[*:0]const u8, c_int) callconv(.C) void, userdata: ?*anyopaque) bool;
extern fn SDL_RemoveStoragePath(storage: ?*SDL_Storage, path: ?[*:0]const u8) bool;
extern fn SDL_GlobStorageDirectory(storage: ?*SDL_Storage, path: ?[*:0]const u8, pattern: ?[*:0]const u8, flags: c_int, count: ?*c_int) ?[*]?[*:0]u8;
extern fn SDL_GetStoragePathInfo(storage: ?*SDL_Storage, path: ?[*:0]const u8, info: ?*SDL_PathInfo) bool;

// Storage path info
pub const SDL_PathInfo = extern struct {
    type: c_int,
    size: Uint64,
    create_time: core.SDL_Time,
    modify_time: core.SDL_Time,
    access_time: core.SDL_Time,
};

// Public API
pub const openTitleStorage = SDL_OpenTitleStorage;
pub const openUserStorage = SDL_OpenUserStorage;
pub const openFileStorage = SDL_OpenFileStorage;
pub const closeStorage = SDL_CloseStorage;
pub const storageReady = SDL_StorageReady;
pub const getStorageFileSize = SDL_GetStorageFileSize;
pub const readStorageFile = SDL_ReadStorageFile;
pub const writeStorageFile = SDL_WriteStorageFile;
pub const createStorageDirectory = SDL_CreateStorageDirectory;
pub const enumerateStorageDirectory = SDL_EnumerateStorageDirectory;
pub const removeStoragePath = SDL_RemoveStoragePath;
pub const globStorageDirectory = SDL_GlobStorageDirectory;
pub const getStoragePathInfo = SDL_GetStoragePathInfo;
