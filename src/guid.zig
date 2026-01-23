// SDL3 GUID Bindings
// Unique identifier generation and handling

// GUID struct
pub const SDL_GUID = extern struct {
    data: [16]u8,
};

// GUID functions
extern fn SDL_GUIDToString(guid: SDL_GUID, pszGUID: ?[*:0]u8, cbGUID: c_int) void;
extern fn SDL_StringToGUID(pchGUID: ?[*:0]const u8) SDL_GUID;

// Public API
pub const guidToString = SDL_GUIDToString;
pub const stringToGUID = SDL_StringToGUID;
