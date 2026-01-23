// SDL3 SharedObject Bindings
// Dynamic library loading

const core = @import("core.zig");

// Shared object handle
pub const SDL_SharedObject = opaque {};

// Shared object functions
extern fn SDL_LoadObject(sofile: ?[*:0]const u8) ?*SDL_SharedObject;
extern fn SDL_LoadFunction(handle: ?*SDL_SharedObject, name: ?[*:0]const u8) ?*anyopaque;
extern fn SDL_UnloadObject(handle: ?*SDL_SharedObject) void;

// Public API
pub const loadObject = SDL_LoadObject;
pub const loadFunction = SDL_LoadFunction;
pub const unloadObject = SDL_UnloadObject;
