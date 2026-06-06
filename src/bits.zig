// SDL3 Bits Bindings
// Bit manipulation utilities

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

// Import types
pub const Uint32 = core.Uint32;

// Bits functions
pub const PFN_SDL_MostSignificantBitIndex32 = *const fn (x: Uint32) callconv(.c) c_int;
pub const PFN_SDL_HasExactlyOneBitSet32 = *const fn (x: Uint32) callconv(.c) bool;

pub const BitsFunctions = struct {
    mostSignificantBitIndex32: PFN_SDL_MostSignificantBitIndex32,
    hasExactlyOneBitSet32: PFN_SDL_HasExactlyOneBitSet32,

    pub fn load(handle: dynamic.LibraryHandle) !BitsFunctions {
        return dynamic.loadFunctions(BitsFunctions, handle, "SDL_", .{}, &.{ "mostSignificantBitIndex32", "hasExactlyOneBitSet32" });
    }
};
