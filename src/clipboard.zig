// SDL3 Clipboard Bindings
// System clipboard

const dynamic = @import("dynamic.zig");

// Clipboard callback types
pub const SDL_ClipboardDataCallback = ?*const fn (?*anyopaque, [*:0]const u8, ?*usize) callconv(.c) ?*const anyopaque;
pub const SDL_ClipboardCleanupCallback = ?*const fn (?*anyopaque) callconv(.c) void;

// Clipboard functions
pub const PFN_SDL_SetClipboardText = *const fn (text: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GetClipboardText = *const fn () callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_HasClipboardText = *const fn () callconv(.c) bool;
pub const PFN_SDL_SetPrimarySelectionText = *const fn (text: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GetPrimarySelectionText = *const fn () callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_HasPrimarySelectionText = *const fn () callconv(.c) bool;
pub const PFN_SDL_SetClipboardData = *const fn (callback: SDL_ClipboardDataCallback, cleanup: SDL_ClipboardCleanupCallback, userdata: ?*anyopaque, mime_types: ?[*]?[*:0]const u8, num_mime_types: usize) callconv(.c) bool;
pub const PFN_SDL_GetClipboardData = *const fn (mime_type: [*:0]const u8, size: ?*usize) callconv(.c) ?*anyopaque;
pub const PFN_SDL_HasClipboardData = *const fn (mime_type: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_GetClipboardMimeTypes = *const fn (num_mime_types: ?*usize) callconv(.c) ?[*]?[*:0]u8;
pub const PFN_SDL_ClearClipboardData = *const fn () callconv(.c) bool;

pub const ClipboardFunctions = struct {
    setClipboardText: PFN_SDL_SetClipboardText,
    getClipboardText: PFN_SDL_GetClipboardText,
    hasClipboardText: PFN_SDL_HasClipboardText,
    setPrimarySelectionText: PFN_SDL_SetPrimarySelectionText,
    getPrimarySelectionText: PFN_SDL_GetPrimarySelectionText,
    hasPrimarySelectionText: PFN_SDL_HasPrimarySelectionText,
    setClipboardData: PFN_SDL_SetClipboardData,
    getClipboardData: PFN_SDL_GetClipboardData,
    hasClipboardData: PFN_SDL_HasClipboardData,
    getClipboardMimeTypes: PFN_SDL_GetClipboardMimeTypes,
    clearClipboardData: PFN_SDL_ClearClipboardData,

    pub fn load(handle: dynamic.LibraryHandle) !ClipboardFunctions {
        return dynamic.loadFunctions(ClipboardFunctions, handle, "SDL_", .{}, &.{});
    }
};
