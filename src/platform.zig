// SDL3 Platform Bindings
// Platform detection

// Platform functions
extern fn SDL_GetPlatform() ?[*:0]const u8;

// Public API
pub const getPlatform = SDL_GetPlatform;
