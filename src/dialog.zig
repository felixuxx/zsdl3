// SDL3 Dialog Bindings
// File and message dialogs

const core = @import("core.zig");
const video = @import("video.zig");

// Dialog callbacks
pub const SDL_DialogFileCallback = ?*const fn (?*anyopaque, ?[*]const ?[*:0]const u8, c_int) callconv(.C) void;

// Dialog functions
extern fn SDL_ShowOpenFileDialog(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*video.SDL_Window, filters: ?[*]const SDL_DialogFileFilter, default_location: ?[*:0]const u8, allow_many: bool) bool;
extern fn SDL_ShowSaveFileDialog(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*video.SDL_Window, filters: ?[*]const SDL_DialogFileFilter, default_location: ?[*:0]const u8) bool;
extern fn SDL_ShowOpenFolderDialog(callback: SDL_DialogFileCallback, userdata: ?*anyopaque, window: ?*video.SDL_Window, default_location: ?[*:0]const u8, allow_many: bool) bool;
extern fn SDL_ShowFileDialogWithProperties(props: core.SDL_PropertiesID) bool;

// Dialog file filter
pub const SDL_DialogFileFilter = extern struct {
    name: ?[*:0]const u8,
    pattern: ?[*:0]const u8,
};

// Public API
pub const showOpenFileDialog = SDL_ShowOpenFileDialog;
pub const showSaveFileDialog = SDL_ShowSaveFileDialog;
pub const showOpenFolderDialog = SDL_ShowOpenFolderDialog;
pub const showFileDialogWithProperties = SDL_ShowFileDialogWithProperties;
