// SDL3 Bits Bindings
// Bit manipulation utilities

const core = @import("core.zig");

// Import types
pub const Uint32 = core.Uint32;

// Bits functions
extern fn SDL_MostSignificantBitIndex32(x: Uint32) c_int;
extern fn SDL_HasExactlyOneBitSet32(x: Uint32) bool;

// Public API
pub const mostSignificantBitIndex32 = SDL_MostSignificantBitIndex32;
pub const hasExactlyOneBitSet32 = SDL_HasExactlyOneBitSet32;
