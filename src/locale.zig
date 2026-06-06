// SDL3 Locale Bindings
// Locale preferences

const dynamic = @import("dynamic.zig");

// Locale functions
pub const PFN_SDL_GetPreferredLocales = *const fn (count: ?*c_int) callconv(.c) ?[*]?*SDL_Locale;

// Locale struct
pub const SDL_Locale = extern struct {
    language: ?[*:0]const u8,
    country: ?[*:0]const u8,
};

pub const LocaleFunctions = struct {
    getPreferredLocales: PFN_SDL_GetPreferredLocales,

    pub fn load(handle: dynamic.LibraryHandle) !LocaleFunctions {
        return dynamic.loadFunctions(LocaleFunctions, handle, "SDL_", .{}, &.{});
    }
};
