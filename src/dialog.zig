// SDL3 Dialog Bindings
// File and message dialogs

const core = @import("core.zig");
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
extern fn SDL_ShowOpenFileDialog(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*video.SDL_Window, filters: ?[*]const SDL_DialogFileFilter, nfilters: c_int, default_location: ?[*:0]const u8, allow_many: bool) void;
extern fn SDL_ShowSaveFileDialog(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*video.SDL_Window, filters: ?[*]const SDL_DialogFileFilter, nfilters: c_int, default_location: ?[*:0]const u8) void;
extern fn SDL_ShowOpenFolderDialog(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*video.SDL_Window, default_location: ?[*:0]const u8, allow_many: bool) void;
extern fn SDL_ShowFileDialogWithProperties(dialog_type: SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: core.SDL_PropertiesID) void;

// Dialog file filter
pub const SDL_DialogFileFilter = extern struct {
    name: ?[*:0]const u8,
    pattern: ?[*:0]const u8,
};

// File dialog property string constants
pub const SDL_PROP_FILE_DIALOG_FILTERS_POINTER = "SDL.filedialog.filters";
pub const SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER = "SDL.filedialog.nfilters";
pub const SDL_PROP_FILE_DIALOG_WINDOW_POINTER = "SDL.filedialog.window";
pub const SDL_PROP_FILE_DIALOG_LOCATION_STRING = "SDL.filedialog.location";
pub const SDL_PROP_FILE_DIALOG_MANY_BOOLEAN = "SDL.filedialog.many";
pub const SDL_PROP_FILE_DIALOG_TITLE_STRING = "SDL.filedialog.title";
pub const SDL_PROP_FILE_DIALOG_ACCEPT_STRING = "SDL.filedialog.accept";
pub const SDL_PROP_FILE_DIALOG_CANCEL_STRING = "SDL.filedialog.cancel";

// Public API
pub const showOpenFileDialog = SDL_ShowOpenFileDialog;
pub const showSaveFileDialog = SDL_ShowSaveFileDialog;
pub const showOpenFolderDialog = SDL_ShowOpenFolderDialog;
pub const showFileDialogWithProperties = SDL_ShowFileDialogWithProperties;
