// SDL3 Storage Bindings
// User/title storage

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

// Import types
pub const Uint64 = core.Uint64;
pub const SDL_Time = core.Sint64; // SDL_Time is Sint64 (nanoseconds since epoch)

// Storage structs
pub const SDL_Storage = opaque {};

pub const SDL_EnumerationResult = enum(c_int) {
    SDL_ENUM_CONTINUE,
    SDL_ENUM_SUCCESS,
    SDL_ENUM_FAILURE,
};

pub const SDL_GlobFlags = c_uint;

// Storage functions
pub const PFN_SDL_OpenTitleStorage = *const fn (override: ?[*:0]const u8, props: core.SDL_PropertiesID) callconv(.c) ?*SDL_Storage;
pub const PFN_SDL_OpenUserStorage = *const fn (root: ?[*:0]const u8, name: ?[*:0]const u8, props: core.SDL_PropertiesID) callconv(.c) ?*SDL_Storage;
pub const PFN_SDL_OpenFileStorage = *const fn (path: ?[*:0]const u8) callconv(.c) ?*SDL_Storage;
pub const PFN_SDL_CloseStorage = *const fn (storage: ?*SDL_Storage) callconv(.c) bool;
pub const PFN_SDL_StorageReady = *const fn (storage: ?*SDL_Storage) callconv(.c) bool;
pub const PFN_SDL_GetStorageFileSize = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8, length: ?*Uint64) callconv(.c) bool;
pub const PFN_SDL_ReadStorageFile = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8, destination: ?*anyopaque, length: Uint64) callconv(.c) bool;
pub const PFN_SDL_WriteStorageFile = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8, source: ?*const anyopaque, length: Uint64) callconv(.c) bool;
pub const PFN_SDL_CreateStorageDirectory = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_EnumerateStorageDirectory = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8, callback: ?*const fn (?*anyopaque, ?[*:0]const u8, ?[*:0]const u8, SDL_EnumerationResult) callconv(.c) bool, userdata: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_RemoveStoragePath = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GlobStorageDirectory = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8, pattern: ?[*:0]const u8, flags: SDL_GlobFlags, count: ?*c_int) callconv(.c) ?[*]?[*:0]u8;
pub const PFN_SDL_GetStoragePathInfo = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8, info: ?*SDL_PathInfo) callconv(.c) bool;

// Storage path info
pub const SDL_PathInfo = extern struct {
    type: c_int,
    size: Uint64,
    create_time: SDL_Time,
    modify_time: SDL_Time,
    access_time: SDL_Time,
};

pub const StorageFunctions = struct {
    openTitleStorage: PFN_SDL_OpenTitleStorage,
    openUserStorage: PFN_SDL_OpenUserStorage,
    openFileStorage: PFN_SDL_OpenFileStorage,
    closeStorage: PFN_SDL_CloseStorage,
    storageReady: PFN_SDL_StorageReady,
    getStorageFileSize: PFN_SDL_GetStorageFileSize,
    readStorageFile: PFN_SDL_ReadStorageFile,
    writeStorageFile: PFN_SDL_WriteStorageFile,
    createStorageDirectory: PFN_SDL_CreateStorageDirectory,
    enumerateStorageDirectory: PFN_SDL_EnumerateStorageDirectory,
    removeStoragePath: PFN_SDL_RemoveStoragePath,
    globStorageDirectory: PFN_SDL_GlobStorageDirectory,
    getStoragePathInfo: PFN_SDL_GetStoragePathInfo,

    pub fn load(handle: dynamic.LibraryHandle) !StorageFunctions {
        return dynamic.loadFunctions(StorageFunctions, handle, "SDL_", .{}, &.{});
    }
};
