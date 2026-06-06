// SDL3 Messagebox Bindings
// System message boxes

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");
const video = @import("video.zig");

// Import types
pub const Uint8 = core.Uint8;
pub const Uint32 = core.Uint32;

// Messagebox types
pub const SDL_MessageBoxFlags = Uint32;
pub const SDL_MESSAGEBOX_ERROR = 0x00000010;
pub const SDL_MESSAGEBOX_WARNING = 0x00000020;
pub const SDL_MESSAGEBOX_INFORMATION = 0x00000040;

pub const SDL_MessageBoxButton = extern struct {
    flags: Uint32,
    buttonid: c_int,
    text: ?[*:0]const u8,
};

pub const SDL_MessageBoxColor = extern struct {
    r: Uint8,
    g: Uint8,
    b: Uint8,
};

pub const SDL_MessageBoxColorScheme = extern struct {
    colors: [5]SDL_MessageBoxColor,
};

pub const SDL_MessageBoxData = extern struct {
    flags: SDL_MessageBoxFlags,
    window: ?*video.SDL_Window,
    title: ?[*:0]const u8,
    message: ?[*:0]const u8,
    numbuttons: c_int,
    buttons: ?[*]const SDL_MessageBoxButton,
    colorScheme: ?*const SDL_MessageBoxColorScheme,
};

// Messagebox functions
pub const PFN_SDL_ShowMessageBox = *const fn (data: ?*const SDL_MessageBoxData, buttonid: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_ShowSimpleMessageBox = *const fn (flags: SDL_MessageBoxFlags, title: ?[*:0]const u8, message: ?[*:0]const u8, window: ?*video.SDL_Window) callconv(.c) bool;

pub const MessageBoxFunctions = struct {
    showMessageBox: PFN_SDL_ShowMessageBox,
    showSimpleMessageBox: PFN_SDL_ShowSimpleMessageBox,

    pub fn load(handle: dynamic.LibraryHandle) !MessageBoxFunctions {
        return dynamic.loadFunctions(MessageBoxFunctions, handle, "SDL_", .{}, &.{});
    }
};
