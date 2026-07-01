// SDL3 Misc Bindings
// Utility functions

const core = @import("core.zig");
const log = @import("log.zig");

pub const Uint16 = core.Uint16;
pub const Uint32 = core.Uint32;
pub const SDL_LogPriority = log.SDL_LogPriority;

// Misc functions
extern fn SDL_OpenURL(url: [*:0]const u8) bool;

// Public API
pub const openURL = SDL_OpenURL;
