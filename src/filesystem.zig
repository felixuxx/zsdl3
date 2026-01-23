// SDL3 Filesystem Bindings
// File I/O abstractions

const core = @import("core.zig");

// Filesystem structs
pub const SDL_IOStream = opaque {};

// Filesystem functions
extern fn SDL_GetBasePath() ?[*:0]const u8;
extern fn SDL_IOFromFile(file: ?[*:0]const u8, mode: ?[*:0]const u8) ?*SDL_IOStream;
extern fn SDL_CloseIO(stream: ?*SDL_IOStream) bool;
extern fn SDL_ReadIO(stream: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
extern fn SDL_WriteIO(stream: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize;

// Public API
pub const getBasePath = SDL_GetBasePath;
pub const ioFromFile = SDL_IOFromFile;
pub const closeIO = SDL_CloseIO;
pub const readIO = SDL_ReadIO;
pub const writeIO = SDL_WriteIO;
