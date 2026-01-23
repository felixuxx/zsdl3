// SDL3 Intrinsics Bindings
// SIMD and low-level operations

// Intrinsics functions (limited in SDL3)
extern fn SDL_HasARMSIMD() bool;
extern fn SDL_HasARMSVE() bool;

// Public API
pub const hasARMSIMD = SDL_HasARMSIMD;
pub const hasARMSVE = SDL_HasARMSVE;
