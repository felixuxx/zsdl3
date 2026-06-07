// SDL3 Storage Bindings
// User/title storage

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

// Import types
pub const Uint64 = core.Uint64;
pub const SDL_Time = core.Sint64; // SDL_Time is Sint64 (nanoseconds since epoch)

// Storage structs
pub const SDL_Storage = opaque {};

pub const SDL_StorageInterface = extern struct {
    version: core.Uint32,
    close: ?*const fn (userdata: ?*anyopaque) callconv(.c) bool,
    ready: ?*const fn (userdata: ?*anyopaque) callconv(.c) bool,
    enumerate: ?*const fn (userdata: ?*anyopaque, path: ?[*:0]const u8, callback: ?*const fn (?*anyopaque, ?[*:0]const u8, c_int) callconv(.c) c_int, userdata2: ?*anyopaque) callconv(.c) bool,
    info: ?*const fn (userdata: ?*anyopaque, path: ?[*:0]const u8, info: ?*anyopaque) callconv(.c) bool,
    read_file: ?*const fn (userdata: ?*anyopaque, path: ?[*:0]const u8, dest: ?*anyopaque, size: Uint64) callconv(.c) bool,
    write_file: ?*const fn (userdata: ?*anyopaque, path: ?[*:0]const u8, source: ?*const anyopaque, size: Uint64) callconv(.c) bool,
    mkdir: ?*const fn (userdata: ?*anyopaque, path: ?[*:0]const u8) callconv(.c) bool,
    remove: ?*const fn (userdata: ?*anyopaque, path: ?[*:0]const u8) callconv(.c) bool,
    rename: ?*const fn (userdata: ?*anyopaque, oldpath: ?[*:0]const u8, newpath: ?[*:0]const u8) callconv(.c) bool,
    space_remaining: ?*const fn (userdata: ?*anyopaque) callconv(.c) Uint64,
};

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
pub const SDL_EnumerateDirectoryCallback = ?*const fn (userdata: ?*anyopaque, dirname: ?[*:0]const u8, fname: ?[*:0]const u8) callconv(.c) SDL_EnumerationResult;
pub const PFN_SDL_EnumerateStorageDirectory = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8, callback: SDL_EnumerateDirectoryCallback, userdata: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_RemoveStoragePath = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GlobStorageDirectory = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8, pattern: ?[*:0]const u8, flags: SDL_GlobFlags, count: ?*c_int) callconv(.c) ?[*]?[*:0]u8;
pub const PFN_SDL_GetStoragePathInfo = *const fn (storage: ?*SDL_Storage, path: ?[*:0]const u8, info: ?*SDL_PathInfo) callconv(.c) bool;
pub const PFN_SDL_GetStorageSpaceRemaining = *const fn (storage: ?*SDL_Storage) callconv(.c) Uint64;
pub const PFN_SDL_CopyStorageFile = *const fn (storage: ?*SDL_Storage, old_path: ?[*:0]const u8, new_path: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_RenameStoragePath = *const fn (storage: ?*SDL_Storage, old_path: ?[*:0]const u8, new_path: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_OpenStorage = *const fn (iface: ?*const SDL_StorageInterface, userdata: ?*anyopaque) callconv(.c) ?*SDL_Storage;

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
    spaceRemaining: PFN_SDL_GetStorageSpaceRemaining,
    copyStorageFile: PFN_SDL_CopyStorageFile,
    renameStoragePath: PFN_SDL_RenameStoragePath,
    openStorage: ?PFN_SDL_OpenStorage,

    pub fn load(handle: dynamic.LibraryHandle) !StorageFunctions {
        return dynamic.loadFunctions(StorageFunctions, handle, "SDL_", .{
            .{ "spaceRemaining", "SDL_GetStorageSpaceRemaining" },
        }, &.{"openStorage"});
    }
};
