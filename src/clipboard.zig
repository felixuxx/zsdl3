// SDL3 Clipboard Bindings
// System clipboard

const core = @import("core.zig");

// Clipboard functions
extern fn SDL_SetClipboardText(text: [*:0]const u8) bool;
extern fn SDL_GetClipboardText() ?[*:0]const u8;
extern fn SDL_HasClipboardText() bool;
extern fn SDL_SetPrimarySelectionText(text: [*:0]const u8) bool;
extern fn SDL_GetPrimarySelectionText() ?[*:0]const u8;
extern fn SDL_HasPrimarySelectionText() bool;

// Public API
pub const setClipboardText = SDL_SetClipboardText;
pub const getClipboardText = SDL_GetClipboardText;
pub const hasClipboardText = SDL_HasClipboardText;
pub const setPrimarySelectionText = SDL_SetPrimarySelectionText;
pub const getPrimarySelectionText = SDL_GetPrimarySelectionText;
pub const hasPrimarySelectionText = SDL_HasPrimarySelectionText;
