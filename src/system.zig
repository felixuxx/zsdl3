// SDL3 System Bindings
// System queries

// System functions
extern fn SDL_GetSystemRAM() c_int;
extern fn SDL_GetSIMDAlignment() usize;

// Public API
pub const getSystemRAM = SDL_GetSystemRAM;
pub const getSIMDAlignment = SDL_GetSIMDAlignment;
