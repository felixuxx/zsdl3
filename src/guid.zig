// SDL3 GUID Bindings
// Unique identifier generation and handling

const dynamic = @import("dynamic.zig");

// GUID struct
pub const SDL_GUID = extern struct {
    data: [16]u8,
};

// GUID functions
pub const PFN_SDL_GUIDToString = *const fn (guid: SDL_GUID, pszGUID: ?[*:0]u8, cbGUID: c_int) callconv(.c) void;
pub const PFN_SDL_StringToGUID = *const fn (pchGUID: ?[*:0]const u8) callconv(.c) SDL_GUID;

pub const GuidFunctions = struct {
    guidToString: PFN_SDL_GUIDToString,
    stringToGUID: PFN_SDL_StringToGUID,

    pub fn load(handle: dynamic.LibraryHandle) !GuidFunctions {
        return dynamic.loadFunctions(GuidFunctions, handle, "SDL_", .{
            .{ "guidToString", "SDL_GUIDToString" },
        }, &.{});
    }
};
