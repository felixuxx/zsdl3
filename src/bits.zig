// SDL3 Bits Bindings
// Bit manipulation utilities

const core = @import("core.zig");

pub const Uint32 = core.Uint32;

// Bits functions (inline in C, implemented in Zig)
pub fn SDL_MostSignificantBitIndex32(x: Uint32) c_int {
    if (x == 0) return -1;
    return @as(c_int, @intCast(31 - @clz(x)));
}
pub fn SDL_HasExactlyOneBitSet32(x: Uint32) bool {
    return x != 0 and (x & (x -% 1)) == 0;
}

// Public API
pub const mostSignificantBitIndex32 = SDL_MostSignificantBitIndex32;
pub const hasExactlyOneBitSet32 = SDL_HasExactlyOneBitSet32;
