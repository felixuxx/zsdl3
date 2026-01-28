// SDL3 Clipboard Bindings
// System clipboard

const core = @import("core.zig");

// Clipboard callback types
pub const SDL_ClipboardDataCallback = ?*const fn (?*anyopaque, [*:0]const u8, ?*usize) callconv(.C) ?*const anyopaque;
pub const SDL_ClipboardCleanupCallback = ?*const fn (?*anyopaque) callconv(.C) void;

// Clipboard functions
extern fn SDL_SetClipboardText(text: [*:0]const u8) bool;
extern fn SDL_GetClipboardText() ?[*:0]const u8;
extern fn SDL_HasClipboardText() bool;
extern fn SDL_SetPrimarySelectionText(text: [*:0]const u8) bool;
extern fn SDL_GetPrimarySelectionText() ?[*:0]const u8;
extern fn SDL_HasPrimarySelectionText() bool;
extern fn SDL_SetClipboardData(callback: SDL_ClipboardDataCallback, cleanup: SDL_ClipboardCleanupCallback, userdata: ?*anyopaque, mime_types: ?[*]?[*:0]const u8, num_mime_types: usize) bool;
extern fn SDL_GetClipboardData(mime_type: [*:0]const u8, size: ?*usize) ?*anyopaque;
extern fn SDL_HasClipboardData(mime_type: [*:0]const u8) bool;
extern fn SDL_GetClipboardMimeTypes(num_mime_types: ?*usize) ?[*]?[*:0]u8;

// Public API
pub const setClipboardText = SDL_SetClipboardText;
pub const getClipboardText = SDL_GetClipboardText;
pub const hasClipboardText = SDL_HasClipboardText;
pub const setPrimarySelectionText = SDL_SetPrimarySelectionText;
pub const getPrimarySelectionText = SDL_GetPrimarySelectionText;
pub const hasPrimarySelectionText = SDL_HasPrimarySelectionText;
pub const setClipboardData = SDL_SetClipboardData;
pub const getClipboardData = SDL_GetClipboardData;
pub const hasClipboardData = SDL_HasClipboardData;
pub const getClipboardMimeTypes = SDL_GetClipboardMimeTypes;
