// SDL3 Intrinsics Bindings
// SIMD and low-level operations

const dynamic = @import("dynamic.zig");

// Intrinsics functions (limited in SDL3)
pub const PFN_SDL_HasARMSIMD = *const fn () callconv(.c) bool;
pub const PFN_SDL_HasARMSVE = *const fn () callconv(.c) bool;

pub const IntrinsicsFunctions = struct {
    hasARMSIMD: PFN_SDL_HasARMSIMD,
    hasARMSVE: PFN_SDL_HasARMSVE,

    pub fn load(handle: dynamic.LibraryHandle) !IntrinsicsFunctions {
        return dynamic.loadFunctions(IntrinsicsFunctions, handle, "SDL_", .{}, &.{ "hasARMSVE" });
    }
};
