// SDL3 CPUInfo Bindings
// CPU feature detection

// CPU functions
extern fn SDL_GetCPUCount() c_int;
extern fn SDL_GetCPUCacheLineSize() c_int;
extern fn SDL_HasAltiVec() bool;
extern fn SDL_HasMMX() bool;
extern fn SDL_HasSSE() bool;
extern fn SDL_HasSSE2() bool;
extern fn SDL_HasSSE3() bool;
extern fn SDL_HasSSE41() bool;
extern fn SDL_HasSSE42() bool;
extern fn SDL_HasAVX() bool;
extern fn SDL_HasAVX2() bool;
extern fn SDL_HasAVX512F() bool;
extern fn SDL_HasNEON() bool;
extern fn SDL_HasLSX() bool;
extern fn SDL_HasLASX() bool;

// Public API
pub const getCPUCount = SDL_GetCPUCount;
pub const getCPUCacheLineSize = SDL_GetCPUCacheLineSize;
pub const hasAltiVec = SDL_HasAltiVec;
pub const hasMMX = SDL_HasMMX;
pub const hasSSE = SDL_HasSSE;
pub const hasSSE2 = SDL_HasSSE2;
pub const hasSSE3 = SDL_HasSSE3;
pub const hasSSE41 = SDL_HasSSE41;
pub const hasSSE42 = SDL_HasSSE42;
pub const hasAVX = SDL_HasAVX;
pub const hasAVX2 = SDL_HasAVX2;
pub const hasAVX512F = SDL_HasAVX512F;
pub const hasNEON = SDL_HasNEON;
pub const hasLSX = SDL_HasLSX;
pub const hasLASX = SDL_HasLASX;
