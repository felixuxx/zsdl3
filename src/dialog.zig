// SDL3 Dialog Bindings
// File and message dialogs

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");
const video = @import("video.zig");

// Dialog callbacks
pub const SDL_DialogFileCallback = ?*const fn (?*anyopaque, ?[*]const ?[*:0]const u8, c_int) callconv(.c) void;

// File dialog type enum
pub const SDL_FileDialogType = enum(c_int) {
    SDL_FILEDIALOG_OPENFILE,
    SDL_FILEDIALOG_SAVEFILE,
    SDL_FILEDIALOG_OPENFOLDER,
};

// Dialog functions
pub const PFN_SDL_ShowOpenFileDialog = *const fn (callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*video.SDL_Window, filters: ?[*]const SDL_DialogFileFilter, nfilters: c_int, default_location: ?[*:0]const u8, allow_many: bool) callconv(.c) void;
pub const PFN_SDL_ShowSaveFileDialog = *const fn (callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*video.SDL_Window, filters: ?[*]const SDL_DialogFileFilter, nfilters: c_int, default_location: ?[*:0]const u8) callconv(.c) void;
pub const PFN_SDL_ShowOpenFolderDialog = *const fn (callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*video.SDL_Window, default_location: ?[*:0]const u8, allow_many: bool) callconv(.c) void;
pub const PFN_SDL_ShowFileDialogWithProperties = *const fn (dialog_type: SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: core.SDL_PropertiesID) callconv(.c) void;

// Dialog file filter
pub const SDL_DialogFileFilter = extern struct {
    name: ?[*:0]const u8,
    pattern: ?[*:0]const u8,
};

pub const DialogFunctions = struct {
    showOpenFileDialog: PFN_SDL_ShowOpenFileDialog,
    showSaveFileDialog: PFN_SDL_ShowSaveFileDialog,
    showOpenFolderDialog: PFN_SDL_ShowOpenFolderDialog,
    showFileDialogWithProperties: PFN_SDL_ShowFileDialogWithProperties,

    pub fn load(handle: dynamic.LibraryHandle) !DialogFunctions {
        return dynamic.loadFunctions(DialogFunctions, handle, "SDL_", .{}, &.{});
    }
};
