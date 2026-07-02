// SDL3 Messagebox Bindings
// System message boxes

const core = @import("core.zig");
const video = @import("video.zig");

// Import types
pub const Uint8 = core.Uint8;
pub const Uint32 = core.Uint32;

// Messagebox types
pub const SDL_MessageBoxFlags = Uint32;
pub const SDL_MESSAGEBOX_ERROR = 0x00000010;
pub const SDL_MESSAGEBOX_WARNING = 0x00000020;
pub const SDL_MESSAGEBOX_INFORMATION = 0x00000040;

// Button flags
pub const SDL_MessageBoxButtonFlags = Uint32;
pub const SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT: SDL_MessageBoxButtonFlags = 0x00000001;
pub const SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT: SDL_MessageBoxButtonFlags = 0x00000002;

// Button layout flags
pub const SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT: Uint32 = 0x00000080;
pub const SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT: Uint32 = 0x00000100;

// Color type
pub const SDL_MessageBoxColorType = enum(c_int) {
    SDL_MESSAGEBOX_COLOR_BACKGROUND,
    SDL_MESSAGEBOX_COLOR_TEXT,
    SDL_MESSAGEBOX_COLOR_BUTTON_BORDER,
    SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
    SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED,
    SDL_MESSAGEBOX_COLOR_COUNT,
};

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

// C-compatible alias
pub const SDL_MessageBoxButtonData = SDL_MessageBoxButton;

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
extern fn SDL_ShowMessageBox(data: ?*const SDL_MessageBoxData, buttonid: ?*c_int) bool;
extern fn SDL_ShowSimpleMessageBox(flags: SDL_MessageBoxFlags, title: ?[*:0]const u8, message: ?[*:0]const u8, window: ?*video.SDL_Window) bool;

// Public API
pub const showMessageBox = SDL_ShowMessageBox;
pub const showSimpleMessageBox = SDL_ShowSimpleMessageBox;
