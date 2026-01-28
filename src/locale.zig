// SDL3 Locale Bindings
// Locale preferences

// Locale functions
extern fn SDL_GetPreferredLocales(count: ?*c_int) ?[*]?*SDL_Locale;

// Locale struct
pub const SDL_Locale = extern struct {
    language: ?[*:0]const u8,
    country: ?[*:0]const u8,
};

// Public API
pub const getPreferredLocales = SDL_GetPreferredLocales;
