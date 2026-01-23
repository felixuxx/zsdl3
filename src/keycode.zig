// SDL3 Keycode and Scancode Bindings
// Key mappings

const core = @import("core.zig");

// Keycode and scancode types
pub const SDL_Keycode = core.SDL_Keycode;
pub const SDL_Scancode = core.SDL_Scancode;

// Key functions
extern fn SDL_GetKeyFromName(name: [*:0]const u8) SDL_Keycode;
extern fn SDL_GetKeyName(key: SDL_Keycode) ?[*:0]const u8;
extern fn SDL_GetScancodeFromName(name: [*:0]const u8) SDL_Scancode;
extern fn SDL_GetScancodeName(scancode: SDL_Scancode) ?[*:0]const u8;
extern fn SDL_SetScancodeName(scancode: SDL_Scancode, name: [*:0]const u8) bool;

// Public API
pub const getKeyFromName = SDL_GetKeyFromName;
pub const getKeyName = SDL_GetKeyName;
pub const getScancodeFromName = SDL_GetScancodeFromName;
pub const getScancodeName = SDL_GetScancodeName;
pub const setScancodeName = SDL_SetScancodeName;
