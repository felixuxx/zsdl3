// SDL3 TTF Bindings
// TrueType font rendering

const core = @import("core.zig");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");
const render = @import("render.zig");
const properties = @import("properties.zig");

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
extern fn TTF_Version() c_int;
extern fn TTF_GetFreeTypeVersion(major: ?*c_int, minor: ?*c_int, patch: ?*c_int) void;
extern fn TTF_GetHarfBuzzVersion(major: ?*c_int, minor: ?*c_int, patch: ?*c_int) void;

// Initialization
extern fn TTF_Init() bool;
extern fn TTF_Quit() void;

// Font creation
extern fn TTF_OpenFont(file: [*:0]const u8, ptsize: f32) ?*TTF_Font;
extern fn TTF_OpenFontIO(src: ?*SDL_IOStream, closeio: bool, ptsize: f32) ?*TTF_Font;
extern fn TTF_OpenFontWithProperties(props: SDL_PropertiesID) ?*TTF_Font;
extern fn TTF_CopyFont(existing_font: ?*TTF_Font) ?*TTF_Font;
extern fn TTF_CloseFont(font: ?*TTF_Font) void;

// Font properties
extern fn TTF_GetFontProperties(font: ?*TTF_Font) SDL_PropertiesID;
extern fn TTF_GetFontGeneration(font: ?*TTF_Font) Uint32;

// Fallback fonts
extern fn TTF_AddFallbackFont(font: ?*TTF_Font, fallback: ?*TTF_Font) bool;
extern fn TTF_RemoveFallbackFont(font: ?*TTF_Font, fallback: ?*TTF_Font) void;
extern fn TTF_ClearFallbackFonts(font: ?*TTF_Font) void;

// Font size
extern fn TTF_SetFontSize(font: ?*TTF_Font, ptsize: f32) bool;
extern fn TTF_SetFontSizeDPI(font: ?*TTF_Font, ptsize: f32, hdpi: c_int, vdpi: c_int) bool;
extern fn TTF_GetFontSize(font: ?*TTF_Font) f32;
extern fn TTF_GetFontDPI(font: ?*TTF_Font, hdpi: ?*c_int, vdpi: ?*c_int) bool;

// Font style
extern fn TTF_SetFontStyle(font: ?*TTF_Font, style: TTF_FontStyleFlags) void;
extern fn TTF_GetFontStyle(font: ?*const TTF_Font) TTF_FontStyleFlags;

// Font outline
extern fn TTF_SetFontOutline(font: ?*TTF_Font, outline: c_int) bool;
extern fn TTF_GetFontOutline(font: ?*const TTF_Font) c_int;

// Font hinting
extern fn TTF_SetFontHinting(font: ?*TTF_Font, hinting: TTF_HintingFlags) void;
extern fn TTF_GetFontHinting(font: ?*const TTF_Font) TTF_HintingFlags;
extern fn TTF_GetNumFontFaces(font: ?*const TTF_Font) c_int;

// Font SDF
extern fn TTF_SetFontSDF(font: ?*TTF_Font, enabled: bool) bool;
extern fn TTF_GetFontSDF(font: ?*const TTF_Font) bool;

// Font weight
extern fn TTF_GetFontWeight(font: ?*const TTF_Font) c_int;

// Font wrap alignment
extern fn TTF_SetFontWrapAlignment(font: ?*TTF_Font, alignment: TTF_HorizontalAlignment) void;
extern fn TTF_GetFontWrapAlignment(font: ?*const TTF_Font) TTF_HorizontalAlignment;

// Font metrics
extern fn TTF_GetFontHeight(font: ?*const TTF_Font) c_int;
extern fn TTF_GetFontAscent(font: ?*const TTF_Font) c_int;
extern fn TTF_GetFontDescent(font: ?*const TTF_Font) c_int;
extern fn TTF_SetFontLineSkip(font: ?*TTF_Font, lineskip: c_int) void;
extern fn TTF_GetFontLineSkip(font: ?*const TTF_Font) c_int;

// Font kerning
extern fn TTF_SetFontKerning(font: ?*TTF_Font, enabled: bool) void;
extern fn TTF_GetFontKerning(font: ?*const TTF_Font) bool;

// Font queries
extern fn TTF_FontIsFixedWidth(font: ?*const TTF_Font) bool;
extern fn TTF_FontIsScalable(font: ?*const TTF_Font) bool;
extern fn TTF_GetFontFamilyName(font: ?*const TTF_Font) ?[*:0]const u8;
extern fn TTF_GetFontStyleName(font: ?*const TTF_Font) ?[*:0]const u8;

// Glyph metrics
extern fn TTF_GetGlyphMetrics(font: ?*const TTF_Font, ch: core.Uint32, minx: ?*c_int, maxx: ?*c_int, miny: ?*c_int, maxy: ?*c_int, advance: ?*c_int) bool;
extern fn TTF_GetGlyphAdvance(font: ?*const TTF_Font, ch: core.Uint32) c_int;

// Text size
extern fn TTF_SizeText(font: ?*const TTF_Font, text: [*:0]const u8, w: ?*c_int, h: ?*c_int) bool;
extern fn TTF_SizeUTF8(font: ?*const TTF_Font, text: [*:0]const u8, w: ?*c_int, h: ?*c_int) bool;
extern fn TTF_SizeUNICODE(font: ?*const TTF_Font, text: [*]const core.Uint16, w: ?*c_int, h: ?*c_int) bool;

// Text rendering (Solid)
extern fn TTF_RenderText_Solid(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color) ?*SDL_Surface;
extern fn TTF_RenderUTF8_Solid(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color) ?*SDL_Surface;
extern fn TTF_RenderUNICODE_Solid(font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_Color) ?*SDL_Surface;

// Text rendering (Shaded)
extern fn TTF_RenderText_Shaded(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, bg: SDL_Color) ?*SDL_Surface;
extern fn TTF_RenderUTF8_Shaded(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, bg: SDL_Color) ?*SDL_Surface;
extern fn TTF_RenderUNICODE_Shaded(font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_Color, bg: SDL_Color) ?*SDL_Surface;

// Text rendering (Blended)
extern fn TTF_RenderText_Blended(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color) ?*SDL_Surface;
extern fn TTF_RenderUTF8_Blended(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color) ?*SDL_Surface;
extern fn TTF_RenderUNICODE_Blended(font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_Color) ?*SDL_Surface;

// Text rendering (Blended with wrap)
extern fn TTF_RenderText_Blended_Wrapped(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, wrapLength: c_int) ?*SDL_Surface;
extern fn TTF_RenderUTF8_Blended_Wrapped(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, wrapLength: c_int) ?*SDL_Surface;
extern fn TTF_RenderUNICODE_Blended_Wrapped(font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_Color, wrapLength: c_int) ?*SDL_Surface;

// Text rendering (Blended with float color)
extern fn TTF_RenderText_Blended_Float(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_FColor) ?*SDL_Surface;
extern fn TTF_RenderUTF8_Blended_Float(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_FColor) ?*SDL_Surface;
extern fn TTF_RenderUNICODE_Blended_Float(font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_FColor) ?*SDL_Surface;

// Text rendering (Blended with float color and wrap)
extern fn TTF_RenderText_Blended_Float_Wrapped(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_FColor, wrapLength: c_int) ?*SDL_Surface;
extern fn TTF_RenderUTF8_Blended_Float_Wrapped(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_FColor, wrapLength: c_int) ?*SDL_Surface;
extern fn TTF_RenderUNICODE_Blended_Float_Wrapped(font: ?*const TTF_Font, text: [*]const core.Uint16, length: usize, fg: SDL_FColor, wrapLength: c_int) ?*SDL_Surface;

// Public API
pub const version = TTF_Version;
pub const getFreeTypeVersion = TTF_GetFreeTypeVersion;
pub const getHarfBuzzVersion = TTF_GetHarfBuzzVersion;
pub const init = TTF_Init;
pub const quit = TTF_Quit;
pub const openFont = TTF_OpenFont;
pub const openFontIO = TTF_OpenFontIO;
pub const openFontWithProperties = TTF_OpenFontWithProperties;
pub const copyFont = TTF_CopyFont;
pub const closeFont = TTF_CloseFont;
pub const getFontProperties = TTF_GetFontProperties;
pub const getFontGeneration = TTF_GetFontGeneration;
pub const addFallbackFont = TTF_AddFallbackFont;
pub const removeFallbackFont = TTF_RemoveFallbackFont;
pub const clearFallbackFonts = TTF_ClearFallbackFonts;
pub const setFontSize = TTF_SetFontSize;
pub const setFontSizeDPI = TTF_SetFontSizeDPI;
pub const getFontSize = TTF_GetFontSize;
pub const getFontDPI = TTF_GetFontDPI;
pub const setFontStyle = TTF_SetFontStyle;
pub const getFontStyle = TTF_GetFontStyle;
pub const setFontOutline = TTF_SetFontOutline;
pub const getFontOutline = TTF_GetFontOutline;
pub const setFontHinting = TTF_SetFontHinting;
pub const getFontHinting = TTF_GetFontHinting;
pub const getNumFontFaces = TTF_GetNumFontFaces;
pub const setFontSDF = TTF_SetFontSDF;
pub const getFontSDF = TTF_GetFontSDF;
pub const getFontWeight = TTF_GetFontWeight;
pub const setFontWrapAlignment = TTF_SetFontWrapAlignment;
pub const getFontWrapAlignment = TTF_GetFontWrapAlignment;
pub const getFontHeight = TTF_GetFontHeight;
pub const getFontAscent = TTF_GetFontAscent;
pub const getFontDescent = TTF_GetFontDescent;
pub const setFontLineSkip = TTF_SetFontLineSkip;
pub const getFontLineSkip = TTF_GetFontLineSkip;
pub const setFontKerning = TTF_SetFontKerning;
pub const getFontKerning = TTF_GetFontKerning;
pub const fontIsFixedWidth = TTF_FontIsFixedWidth;
pub const fontIsScalable = TTF_FontIsScalable;
pub const getFontFamilyName = TTF_GetFontFamilyName;
pub const getFontStyleName = TTF_GetFontStyleName;
pub const getGlyphMetrics = TTF_GetGlyphMetrics;
pub const getGlyphAdvance = TTF_GetGlyphAdvance;
pub const sizeText = TTF_SizeText;
pub const sizeUTF8 = TTF_SizeUTF8;
pub const sizeUNICODE = TTF_SizeUNICODE;
pub const renderTextSolid = TTF_RenderText_Solid;
pub const renderUTF8Solid = TTF_RenderUTF8_Solid;
pub const renderUNICODESolid = TTF_RenderUNICODE_Solid;
pub const renderTextShaded = TTF_RenderText_Shaded;
pub const renderUTF8Shaded = TTF_RenderUTF8_Shaded;
pub const renderUNICODEShaded = TTF_RenderUNICODE_Shaded;
pub const renderTextBlended = TTF_RenderText_Blended;
pub const renderUTF8Blended = TTF_RenderUTF8_Blended;
pub const renderUNICODEBlended = TTF_RenderUNICODE_Blended;
pub const renderTextBlendedWrapped = TTF_RenderText_Blended_Wrapped;
pub const renderUTF8BlendedWrapped = TTF_RenderUTF8_Blended_Wrapped;
pub const renderUNICODEBlendedWrapped = TTF_RenderUNICODE_Blended_Wrapped;
pub const renderTextBlendedFloat = TTF_RenderText_Blended_Float;
pub const renderUTF8BlendedFloat = TTF_RenderUTF8_Blended_Float;
pub const renderUNICODEBlendedFloat = TTF_RenderUNICODE_Blended_Float;
pub const renderTextBlendedFloatWrapped = TTF_RenderText_Blended_Float_Wrapped;
pub const renderUTF8BlendedFloatWrapped = TTF_RenderUTF8_Blended_Float_Wrapped;
pub const renderUNICODEBlendedFloatWrapped = TTF_RenderUNICODE_Blended_Float_Wrapped;
