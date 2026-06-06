// SDL3 TTF Bindings
// TrueType font rendering

const core = @import("core.zig");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");
const render = @import("render.zig");
const properties = @import("properties.zig");
const dynamic = @import("dynamic.zig");

// Import types
pub const Uint32 = core.Uint32;
pub const SDL_PropertiesID = properties.SDL_PropertiesID;
pub const SDL_Surface = surface.SDL_Surface;
pub const SDL_IOStream = surface.SDL_IOStream;
pub const SDL_Color = pixels.SDL_Color;
pub const SDL_FColor = render.SDL_FColor;

// Version constants
pub const SDL_TTF_MAJOR_VERSION = 3;
pub const SDL_TTF_MINOR_VERSION = 3;
pub const SDL_TTF_MICRO_VERSION = 0;

// Opaque font type
pub const TTF_Font = opaque {};

// Font style flags
pub const TTF_FontStyleFlags = Uint32;
pub const TTF_STYLE_NORMAL: TTF_FontStyleFlags = 0x00;
pub const TTF_STYLE_BOLD: TTF_FontStyleFlags = 0x01;
pub const TTF_STYLE_ITALIC: TTF_FontStyleFlags = 0x02;
pub const TTF_STYLE_UNDERLINE: TTF_FontStyleFlags = 0x04;
pub const TTF_STYLE_STRIKETHROUGH: TTF_FontStyleFlags = 0x08;

// Hinting flags
pub const TTF_HintingFlags = enum(c_int) {
    TTF_HINTING_INVALID = -1,
    TTF_HINTING_NORMAL,
    TTF_HINTING_LIGHT,
    TTF_HINTING_MONO,
    TTF_HINTING_NONE,
    TTF_HINTING_LIGHT_SUBPIXEL,
};

// Horizontal alignment
pub const TTF_HorizontalAlignment = enum(c_int) {
    TTF_HORIZONTAL_ALIGN_INVALID = -1,
    TTF_HORIZONTAL_ALIGN_LEFT,
    TTF_HORIZONTAL_ALIGN_CENTER,
    TTF_HORIZONTAL_ALIGN_RIGHT,
};

// Font weight constants
pub const TTF_FONT_WEIGHT_THIN = 100;
pub const TTF_FONT_WEIGHT_EXTRA_LIGHT = 200;
pub const TTF_FONT_WEIGHT_LIGHT = 300;
pub const TTF_FONT_WEIGHT_NORMAL = 400;
pub const TTF_FONT_WEIGHT_MEDIUM = 500;
pub const TTF_FONT_WEIGHT_SEMI_BOLD = 600;
pub const TTF_FONT_WEIGHT_BOLD = 700;
pub const TTF_FONT_WEIGHT_EXTRA_BOLD = 800;
pub const TTF_FONT_WEIGHT_BLACK = 900;
pub const TTF_FONT_WEIGHT_EXTRA_BLACK = 950;

// Property constants
pub const TTF_PROP_FONT_CREATE_FILENAME_STRING = "SDL_ttf.font.create.filename";
pub const TTF_PROP_FONT_CREATE_IOSTREAM_POINTER = "SDL_ttf.font.create.iostream";
pub const TTF_PROP_FONT_CREATE_IOSTREAM_OFFSET_NUMBER = "SDL_ttf.font.create.iostream.offset";
pub const TTF_PROP_FONT_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN = "SDL_ttf.font.create.iostream.autoclose";
pub const TTF_PROP_FONT_CREATE_SIZE_FLOAT = "SDL_ttf.font.create.size";
pub const TTF_PROP_FONT_CREATE_FACE_NUMBER = "SDL_ttf.font.create.face";
pub const TTF_PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER = "SDL_ttf.font.create.hdpi";
pub const TTF_PROP_FONT_CREATE_VERTICAL_DPI_NUMBER = "SDL_ttf.font.create.vdpi";
pub const TTF_PROP_FONT_CREATE_EXISTING_FONT_POINTER = "SDL_ttf.font.create.existing_font";
pub const TTF_PROP_FONT_OUTLINE_LINE_CAP_NUMBER = "SDL_ttf.font.outline.line_cap";
pub const TTF_PROP_FONT_OUTLINE_LINE_JOIN_NUMBER = "SDL_ttf.font.outline.line_join";
pub const TTF_PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER = "SDL_ttf.font.outline.miter_limit";

// Version functions
pub const PFN_TTF_Version = *const fn () callconv(.c) c_int;
pub const PFN_TTF_GetFreeTypeVersion = *const fn (major: ?*c_int, minor: ?*c_int, patch: ?*c_int) callconv(.c) void;
pub const PFN_TTF_GetHarfBuzzVersion = *const fn (major: ?*c_int, minor: ?*c_int, patch: ?*c_int) callconv(.c) void;

// Initialization
pub const PFN_TTF_Init = *const fn () callconv(.c) bool;
pub const PFN_TTF_Quit = *const fn () callconv(.c) void;

// Font creation
pub const PFN_TTF_OpenFont = *const fn (file: [*:0]const u8, ptsize: f32) callconv(.c) ?*TTF_Font;
pub const PFN_TTF_OpenFontIO = *const fn (src: ?*SDL_IOStream, closeio: bool, ptsize: f32) callconv(.c) ?*TTF_Font;
pub const PFN_TTF_OpenFontWithProperties = *const fn (props: SDL_PropertiesID) callconv(.c) ?*TTF_Font;
pub const PFN_TTF_CopyFont = *const fn (existing_font: ?*TTF_Font) callconv(.c) ?*TTF_Font;
pub const PFN_TTF_CloseFont = *const fn (font: ?*TTF_Font) callconv(.c) void;

// Font properties
pub const PFN_TTF_GetFontProperties = *const fn (font: ?*TTF_Font) callconv(.c) SDL_PropertiesID;
pub const PFN_TTF_GetFontGeneration = *const fn (font: ?*TTF_Font) callconv(.c) Uint32;

// Fallback fonts
pub const PFN_TTF_AddFallbackFont = *const fn (font: ?*TTF_Font, fallback: ?*TTF_Font) callconv(.c) bool;
pub const PFN_TTF_RemoveFallbackFont = *const fn (font: ?*TTF_Font, fallback: ?*TTF_Font) callconv(.c) void;
pub const PFN_TTF_ClearFallbackFonts = *const fn (font: ?*TTF_Font) callconv(.c) void;

// Font size
pub const PFN_TTF_SetFontSize = *const fn (font: ?*TTF_Font, ptsize: f32) callconv(.c) bool;
pub const PFN_TTF_SetFontSizeDPI = *const fn (font: ?*TTF_Font, ptsize: f32, hdpi: c_int, vdpi: c_int) callconv(.c) bool;
pub const PFN_TTF_GetFontSize = *const fn (font: ?*TTF_Font) callconv(.c) f32;
pub const PFN_TTF_GetFontDPI = *const fn (font: ?*TTF_Font, hdpi: ?*c_int, vdpi: ?*c_int) callconv(.c) bool;

// Font style
pub const PFN_TTF_SetFontStyle = *const fn (font: ?*TTF_Font, style: TTF_FontStyleFlags) callconv(.c) void;
pub const PFN_TTF_GetFontStyle = *const fn (font: ?*const TTF_Font) callconv(.c) TTF_FontStyleFlags;

// Font outline
pub const PFN_TTF_SetFontOutline = *const fn (font: ?*TTF_Font, outline: c_int) callconv(.c) bool;
pub const PFN_TTF_GetFontOutline = *const fn (font: ?*const TTF_Font) callconv(.c) c_int;

// Font hinting
pub const PFN_TTF_SetFontHinting = *const fn (font: ?*TTF_Font, hinting: TTF_HintingFlags) callconv(.c) void;
pub const PFN_TTF_GetFontHinting = *const fn (font: ?*const TTF_Font) callconv(.c) TTF_HintingFlags;
pub const PFN_TTF_GetNumFontFaces = *const fn (font: ?*const TTF_Font) callconv(.c) c_int;

// Font SDF
pub const PFN_TTF_SetFontSDF = *const fn (font: ?*TTF_Font, enabled: bool) callconv(.c) bool;
pub const PFN_TTF_GetFontSDF = *const fn (font: ?*const TTF_Font) callconv(.c) bool;

// Font weight
pub const PFN_TTF_GetFontWeight = *const fn (font: ?*const TTF_Font) callconv(.c) c_int;

// Font wrap alignment
pub const PFN_TTF_SetFontWrapAlignment = *const fn (font: ?*TTF_Font, alignment: TTF_HorizontalAlignment) callconv(.c) void;
pub const PFN_TTF_GetFontWrapAlignment = *const fn (font: ?*const TTF_Font) callconv(.c) TTF_HorizontalAlignment;

// Font metrics
pub const PFN_TTF_GetFontHeight = *const fn (font: ?*const TTF_Font) callconv(.c) c_int;
pub const PFN_TTF_GetFontAscent = *const fn (font: ?*const TTF_Font) callconv(.c) c_int;
pub const PFN_TTF_GetFontDescent = *const fn (font: ?*const TTF_Font) callconv(.c) c_int;
pub const PFN_TTF_SetFontLineSkip = *const fn (font: ?*TTF_Font, lineskip: c_int) callconv(.c) void;
pub const PFN_TTF_GetFontLineSkip = *const fn (font: ?*const TTF_Font) callconv(.c) c_int;

// Font kerning
pub const PFN_TTF_SetFontKerning = *const fn (font: ?*TTF_Font, enabled: bool) callconv(.c) void;
pub const PFN_TTF_GetFontKerning = *const fn (font: ?*const TTF_Font) callconv(.c) bool;

// Font queries
pub const PFN_TTF_FontIsFixedWidth = *const fn (font: ?*const TTF_Font) callconv(.c) bool;
pub const PFN_TTF_FontIsScalable = *const fn (font: ?*const TTF_Font) callconv(.c) bool;
pub const PFN_TTF_GetFontFamilyName = *const fn (font: ?*const TTF_Font) callconv(.c) ?[*:0]const u8;
pub const PFN_TTF_GetFontStyleName = *const fn (font: ?*const TTF_Font) callconv(.c) ?[*:0]const u8;

// Glyph metrics
pub const PFN_TTF_GetGlyphMetrics = *const fn (font: ?*const TTF_Font, ch: core.Uint32, minx: ?*c_int, maxx: ?*c_int, miny: ?*c_int, maxy: ?*c_int, advance: ?*c_int) callconv(.c) bool;
pub const PFN_TTF_GetGlyphAdvance = *const fn (font: ?*const TTF_Font, ch: core.Uint32) callconv(.c) c_int;

// Text size
pub const PFN_TTF_GetStringSize = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, w: ?*c_int, h: ?*c_int) callconv(.c) bool;
pub const PFN_TTF_GetStringSizeWrapped = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, wrap_width: c_int, w: ?*c_int, h: ?*c_int) callconv(.c) bool;

// Text rendering (Solid)
pub const PFN_TTF_RenderText_Solid = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUTF8_Solid = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUNICODE_Solid = *const fn (font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_Color) callconv(.c) ?*SDL_Surface;

// Text rendering (Shaded)
pub const PFN_TTF_RenderText_Shaded = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, bg: SDL_Color) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUTF8_Shaded = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, bg: SDL_Color) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUNICODE_Shaded = *const fn (font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_Color, bg: SDL_Color) callconv(.c) ?*SDL_Surface;

// Text rendering (Blended)
pub const PFN_TTF_RenderText_Blended = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUTF8_Blended = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUNICODE_Blended = *const fn (font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_Color) callconv(.c) ?*SDL_Surface;

// Text rendering (Blended with wrap)
pub const PFN_TTF_RenderText_Blended_Wrapped = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, wrapLength: c_int) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUTF8_Blended_Wrapped = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, wrapLength: c_int) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUNICODE_Blended_Wrapped = *const fn (font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_Color, wrapLength: c_int) callconv(.c) ?*SDL_Surface;

// Text rendering (Blended with float color)
pub const PFN_TTF_RenderText_Blended_Float = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_FColor) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUTF8_Blended_Float = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_FColor) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUNICODE_Blended_Float = *const fn (font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_FColor) callconv(.c) ?*SDL_Surface;

// Text rendering (Blended with float color and wrap)
pub const PFN_TTF_RenderText_Blended_Float_Wrapped = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_FColor, wrapLength: c_int) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUTF8_Blended_Float_Wrapped = *const fn (font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_FColor, wrapLength: c_int) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderUNICODE_Blended_Float_Wrapped = *const fn (font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_FColor, wrapLength: c_int) callconv(.c) ?*SDL_Surface;

// Dispatch struct
pub const TTFFunctions = struct {
    version: PFN_TTF_Version,
    getFreeTypeVersion: PFN_TTF_GetFreeTypeVersion,
    getHarfBuzzVersion: PFN_TTF_GetHarfBuzzVersion,
    init: PFN_TTF_Init,
    quit: PFN_TTF_Quit,
    openFont: PFN_TTF_OpenFont,
    openFontIO: PFN_TTF_OpenFontIO,
    openFontWithProperties: PFN_TTF_OpenFontWithProperties,
    copyFont: PFN_TTF_CopyFont,
    closeFont: PFN_TTF_CloseFont,
    getFontProperties: PFN_TTF_GetFontProperties,
    getFontGeneration: PFN_TTF_GetFontGeneration,
    addFallbackFont: PFN_TTF_AddFallbackFont,
    removeFallbackFont: PFN_TTF_RemoveFallbackFont,
    clearFallbackFonts: PFN_TTF_ClearFallbackFonts,
    setFontSize: PFN_TTF_SetFontSize,
    setFontSizeDPI: PFN_TTF_SetFontSizeDPI,
    getFontSize: PFN_TTF_GetFontSize,
    getFontDPI: PFN_TTF_GetFontDPI,
    setFontStyle: PFN_TTF_SetFontStyle,
    getFontStyle: PFN_TTF_GetFontStyle,
    setFontOutline: PFN_TTF_SetFontOutline,
    getFontOutline: PFN_TTF_GetFontOutline,
    setFontHinting: PFN_TTF_SetFontHinting,
    getFontHinting: PFN_TTF_GetFontHinting,
    getNumFontFaces: PFN_TTF_GetNumFontFaces,
    setFontSDF: PFN_TTF_SetFontSDF,
    getFontSDF: PFN_TTF_GetFontSDF,
    getFontWeight: PFN_TTF_GetFontWeight,
    setFontWrapAlignment: PFN_TTF_SetFontWrapAlignment,
    getFontWrapAlignment: PFN_TTF_GetFontWrapAlignment,
    getFontHeight: PFN_TTF_GetFontHeight,
    getFontAscent: PFN_TTF_GetFontAscent,
    getFontDescent: PFN_TTF_GetFontDescent,
    setFontLineSkip: PFN_TTF_SetFontLineSkip,
    getFontLineSkip: PFN_TTF_GetFontLineSkip,
    setFontKerning: PFN_TTF_SetFontKerning,
    getFontKerning: PFN_TTF_GetFontKerning,
    fontIsFixedWidth: PFN_TTF_FontIsFixedWidth,
    fontIsScalable: PFN_TTF_FontIsScalable,
    getFontFamilyName: PFN_TTF_GetFontFamilyName,
    getFontStyleName: PFN_TTF_GetFontStyleName,
    getGlyphMetrics: PFN_TTF_GetGlyphMetrics,
    getGlyphAdvance: PFN_TTF_GetGlyphAdvance,
    getStringSize: PFN_TTF_GetStringSize,
    getStringSizeWrapped: PFN_TTF_GetStringSizeWrapped,
    renderTextSolid: PFN_TTF_RenderText_Solid,
    renderUTF8Solid: PFN_TTF_RenderUTF8_Solid,
    renderUNICODESolid: PFN_TTF_RenderUNICODE_Solid,
    renderTextShaded: PFN_TTF_RenderText_Shaded,
    renderUTF8Shaded: PFN_TTF_RenderUTF8_Shaded,
    renderUNICODEShaded: PFN_TTF_RenderUNICODE_Shaded,
    renderTextBlended: PFN_TTF_RenderText_Blended,
    renderUTF8Blended: PFN_TTF_RenderUTF8_Blended,
    renderUNICODEBlended: PFN_TTF_RenderUNICODE_Blended,
    renderTextBlendedWrapped: PFN_TTF_RenderText_Blended_Wrapped,
    renderUTF8BlendedWrapped: PFN_TTF_RenderUTF8_Blended_Wrapped,
    renderUNICODEBlendedWrapped: PFN_TTF_RenderUNICODE_Blended_Wrapped,
    renderTextBlendedFloat: PFN_TTF_RenderText_Blended_Float,
    renderUTF8BlendedFloat: PFN_TTF_RenderUTF8_Blended_Float,
    renderUNICODEBlendedFloat: PFN_TTF_RenderUNICODE_Blended_Float,
    renderTextBlendedFloatWrapped: PFN_TTF_RenderText_Blended_Float_Wrapped,
    renderUTF8BlendedFloatWrapped: PFN_TTF_RenderUTF8_Blended_Float_Wrapped,
    renderUNICODEBlendedFloatWrapped: PFN_TTF_RenderUNICODE_Blended_Float_Wrapped,

    pub fn load(handle: dynamic.LibraryHandle) !TTFFunctions {
        return dynamic.loadFunctions(TTFFunctions, handle, "TTF_", .{
            .{ "renderTextSolid", "TTF_RenderText_Solid" },
            .{ "renderUTF8Solid", "TTF_RenderUTF8_Solid" },
            .{ "renderUNICODESolid", "TTF_RenderUNICODE_Solid" },
            .{ "renderTextShaded", "TTF_RenderText_Shaded" },
            .{ "renderUTF8Shaded", "TTF_RenderUTF8_Shaded" },
            .{ "renderUNICODEShaded", "TTF_RenderUNICODE_Shaded" },
            .{ "renderTextBlended", "TTF_RenderText_Blended" },
            .{ "renderUTF8Blended", "TTF_RenderUTF8_Blended" },
            .{ "renderUNICODEBlended", "TTF_RenderUNICODE_Blended" },
            .{ "renderTextBlendedWrapped", "TTF_RenderText_Blended_Wrapped" },
            .{ "renderUTF8BlendedWrapped", "TTF_RenderUTF8_Blended_Wrapped" },
            .{ "renderUNICODEBlendedWrapped", "TTF_RenderUNICODE_Blended_Wrapped" },
            .{ "renderTextBlendedFloat", "TTF_RenderText_Blended_Float" },
            .{ "renderUTF8BlendedFloat", "TTF_RenderUTF8_Blended_Float" },
            .{ "renderUNICODEBlendedFloat", "TTF_RenderUNICODE_Blended_Float" },
            .{ "renderTextBlendedFloatWrapped", "TTF_RenderText_Blended_Float_Wrapped" },
            .{ "renderUTF8BlendedFloatWrapped", "TTF_RenderUTF8_Blended_Float_Wrapped" },
            .{ "renderUNICODEBlendedFloatWrapped", "TTF_RenderUNICODE_Blended_Float_Wrapped" },
        }, &.{ "getGlyphAdvance", "renderUTF8Solid", "renderUNICODESolid", "renderUTF8Shaded", "renderUNICODEShaded", "renderUTF8Blended", "renderUNICODEBlended", "renderUTF8BlendedWrapped", "renderUNICODEBlendedWrapped", "renderTextBlendedFloat", "renderUTF8BlendedFloat", "renderUNICODEBlendedFloat", "renderTextBlendedFloatWrapped", "renderUTF8BlendedFloatWrapped", "renderUNICODEBlendedFloatWrapped" });
    }
};
