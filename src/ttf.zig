// SDL3 TTF Bindings
// TrueType font rendering

const core = @import("core.zig");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");
const render = @import("render.zig");
const properties = @import("properties.zig");
const gpu = @import("gpu.zig");

pub const Uint8 = core.Uint8;
pub const Uint32 = core.Uint32;
pub const SDL_PropertiesID = properties.SDL_PropertiesID;
pub const SDL_Surface = surface.SDL_Surface;
pub const SDL_IOStream = surface.SDL_IOStream;
pub const SDL_Color = pixels.SDL_Color;
pub const SDL_FColor = render.SDL_FColor;
pub const SDL_Renderer = render.SDL_Renderer;
pub const SDL_GPUDevice = gpu.SDL_GPUDevice;
pub const SDL_GPUTexture = gpu.SDL_GPUTexture;
pub const SDL_FPoint = pixels.SDL_FPoint;
pub const SDL_Rect = pixels.SDL_Rect;

// Version constants
pub const SDL_TTF_MAJOR_VERSION = 3;
pub const SDL_TTF_MINOR_VERSION = 2;
pub const SDL_TTF_MICRO_VERSION = 2;

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

// Text engine types
pub const TTF_TextEngine = opaque {};
pub const TTF_TextData = opaque {};

pub const TTF_Direction = enum(c_int) {
    TTF_DIRECTION_INVALID = 0,
    TTF_DIRECTION_LTR = 4,
    TTF_DIRECTION_RTL,
    TTF_DIRECTION_TTB,
    TTF_DIRECTION_BTT,
};

pub const TTF_GPUTextEngineWinding = enum(c_int) {
    TTF_GPU_TEXTENGINE_WINDING_INVALID = -1,
    TTF_GPU_TEXTENGINE_WINDING_CLOCKWISE,
    TTF_GPU_TEXTENGINE_WINDING_COUNTER_CLOCKWISE,
};

pub const TTF_ImageType = enum(c_int) {
    TTF_IMAGE_INVALID,
    TTF_IMAGE_ALPHA,
    TTF_IMAGE_COLOR,
    TTF_IMAGE_SDF,
};

pub const TTF_SubStringFlags = Uint32;
pub const TTF_SUBSTRING_DIRECTION_MASK: TTF_SubStringFlags = 0x000000FF;
pub const TTF_SUBSTRING_TEXT_START: TTF_SubStringFlags = 0x00000100;
pub const TTF_SUBSTRING_LINE_START: TTF_SubStringFlags = 0x00000200;
pub const TTF_SUBSTRING_LINE_END: TTF_SubStringFlags = 0x00000400;
pub const TTF_SUBSTRING_TEXT_END: TTF_SubStringFlags = 0x00000800;

pub const TTF_Text = extern struct {
    text: ?[*:0]u8,
    num_lines: c_int,
    refcount: c_int,
    internal: ?*TTF_TextData,
};

pub const TTF_SubString = extern struct {
    flags: TTF_SubStringFlags,
    offset: c_int,
    length: c_int,
    line_index: c_int,
    cluster_index: c_int,
    rect: SDL_Rect,
};

pub const TTF_GPUAtlasDrawSequence = extern struct {
    atlas_texture: ?*SDL_GPUTexture,
    xy: ?*SDL_FPoint,
    uv: ?*SDL_FPoint,
    num_vertices: c_int,
    indices: ?*c_int,
    num_indices: c_int,
    image_type: TTF_ImageType,
    next: ?*TTF_GPUAtlasDrawSequence,
};

// Version functions
extern fn TTF_Version() c_int;
extern fn TTF_GetFreeTypeVersion(major: ?*c_int, minor: ?*c_int, patch: ?*c_int) void;
extern fn TTF_GetHarfBuzzVersion(major: ?*c_int, minor: ?*c_int, patch: ?*c_int) void;

// Initialization
extern fn TTF_Init() bool;
extern fn TTF_Quit() void;
extern fn TTF_WasInit() c_int;

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
extern fn TTF_FontHasGlyph(font: ?*const TTF_Font, ch: core.Uint32) bool;
extern fn TTF_GetFontFamilyName(font: ?*const TTF_Font) ?[*:0]const u8;
extern fn TTF_GetFontStyleName(font: ?*const TTF_Font) ?[*:0]const u8;

// Glyph metrics
extern fn TTF_GetGlyphMetrics(font: ?*const TTF_Font, ch: core.Uint32, minx: ?*c_int, maxx: ?*c_int, miny: ?*c_int, maxy: ?*c_int, advance: ?*c_int) bool;
extern fn TTF_GetGlyphKerning(font: ?*const TTF_Font, previous_ch: core.Uint32, ch: core.Uint32, kerning: ?*c_int) bool;

// Font text direction and script
extern fn TTF_SetFontDirection(font: ?*TTF_Font, direction: TTF_Direction) bool;
extern fn TTF_GetFontDirection(font: ?*const TTF_Font) TTF_Direction;
extern fn TTF_SetFontScript(font: ?*TTF_Font, script: Uint32) bool;
extern fn TTF_GetFontScript(font: ?*const TTF_Font) Uint32;
extern fn TTF_GetGlyphScript(ch: Uint32) Uint32;
extern fn TTF_SetFontLanguage(font: ?*TTF_Font, language_bcp47: ?[*:0]const u8) bool;
extern fn TTF_GetGlyphImage(font: ?*const TTF_Font, ch: Uint32, image_type: ?*TTF_ImageType) ?*SDL_Surface;
extern fn TTF_GetGlyphImageForIndex(font: ?*const TTF_Font, glyph_index: Uint32, image_type: ?*TTF_ImageType) ?*SDL_Surface;
extern fn TTF_StringToTag(string: ?[*:0]const u8) Uint32;
extern fn TTF_TagToString(tag: Uint32, string: ?[*:0]u8, size: usize) void;

// Text size
extern fn TTF_GetStringSize(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, w: ?*c_int, h: ?*c_int) bool;
extern fn TTF_GetStringSizeWrapped(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, wrap_width: c_int, w: ?*c_int, h: ?*c_int) bool;
extern fn TTF_MeasureString(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, max_width: c_int, measured_width: ?*c_int, measured_length: ?*usize) bool;

// Text rendering
extern fn TTF_RenderText_Solid(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color) ?*SDL_Surface;
extern fn TTF_RenderText_Solid_Wrapped(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, wrapLength: c_int) ?*SDL_Surface;
extern fn TTF_RenderGlyph_Solid(font: ?*const TTF_Font, ch: core.Uint32, fg: SDL_Color) ?*SDL_Surface;

extern fn TTF_RenderText_Shaded(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, bg: SDL_Color) ?*SDL_Surface;
extern fn TTF_RenderText_Shaded_Wrapped(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, bg: SDL_Color, wrap_width: c_int) ?*SDL_Surface;
extern fn TTF_RenderGlyph_Shaded(font: ?*const TTF_Font, ch: core.Uint32, fg: SDL_Color, bg: SDL_Color) ?*SDL_Surface;

extern fn TTF_RenderText_Blended(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color) ?*SDL_Surface;
extern fn TTF_RenderText_Blended_Wrapped(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, wrapLength: c_int) ?*SDL_Surface;
extern fn TTF_RenderGlyph_Blended(font: ?*const TTF_Font, ch: core.Uint32, fg: SDL_Color) ?*SDL_Surface;

extern fn TTF_RenderText_LCD(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, bg: SDL_Color) ?*SDL_Surface;
extern fn TTF_RenderText_LCD_Wrapped(font: ?*const TTF_Font, text: [*:0]const u8, length: usize, fg: SDL_Color, bg: SDL_Color, wrap_width: c_int) ?*SDL_Surface;
extern fn TTF_RenderGlyph_LCD(font: ?*const TTF_Font, ch: core.Uint32, fg: SDL_Color, bg: SDL_Color) ?*SDL_Surface;

// Text engine creation
extern fn TTF_CreateSurfaceTextEngine() ?*TTF_TextEngine;
extern fn TTF_DestroySurfaceTextEngine(engine: ?*TTF_TextEngine) void;
extern fn TTF_CreateRendererTextEngine(renderer: ?*SDL_Renderer) ?*TTF_TextEngine;
extern fn TTF_CreateRendererTextEngineWithProperties(props: SDL_PropertiesID) ?*TTF_TextEngine;
extern fn TTF_DestroyRendererTextEngine(engine: ?*TTF_TextEngine) void;
extern fn TTF_CreateGPUTextEngine(device: ?*SDL_GPUDevice) ?*TTF_TextEngine;
extern fn TTF_CreateGPUTextEngineWithProperties(props: SDL_PropertiesID) ?*TTF_TextEngine;
extern fn TTF_DestroyGPUTextEngine(engine: ?*TTF_TextEngine) void;
extern fn TTF_SetGPUTextEngineWinding(engine: ?*TTF_TextEngine, winding: TTF_GPUTextEngineWinding) void;
extern fn TTF_GetGPUTextEngineWinding(engine: ?*const TTF_TextEngine) TTF_GPUTextEngineWinding;

// Text creation and drawing
extern fn TTF_CreateText(engine: ?*TTF_TextEngine, font: ?*TTF_Font, text: ?[*:0]const u8, length: usize) ?*TTF_Text;
extern fn TTF_DestroyText(text: ?*TTF_Text) void;
extern fn TTF_UpdateText(text: ?*TTF_Text) bool;
extern fn TTF_DrawSurfaceText(text: ?*TTF_Text, x: c_int, y: c_int, surface: ?*SDL_Surface) bool;
extern fn TTF_DrawRendererText(text: ?*TTF_Text, x: f32, y: f32) bool;
extern fn TTF_GetGPUTextDrawData(text: ?*TTF_Text) ?*TTF_GPUAtlasDrawSequence;

// Text properties
extern fn TTF_GetTextProperties(text: ?*TTF_Text) SDL_PropertiesID;
extern fn TTF_SetTextEngine(text: ?*TTF_Text, engine: ?*TTF_TextEngine) bool;
extern fn TTF_GetTextEngine(text: ?*TTF_Text) ?*TTF_TextEngine;
extern fn TTF_SetTextFont(text: ?*TTF_Text, font: ?*TTF_Font) bool;
extern fn TTF_GetTextFont(text: ?*TTF_Text) ?*TTF_Font;
extern fn TTF_SetTextDirection(text: ?*TTF_Text, direction: TTF_Direction) bool;
extern fn TTF_GetTextDirection(text: ?*TTF_Text) TTF_Direction;
extern fn TTF_SetTextScript(text: ?*TTF_Text, script: Uint32) bool;
extern fn TTF_GetTextScript(text: ?*TTF_Text) Uint32;
extern fn TTF_SetTextColor(text: ?*TTF_Text, r: Uint8, g: Uint8, b: Uint8, a: Uint8) bool;
extern fn TTF_SetTextColorFloat(text: ?*TTF_Text, r: f32, g: f32, b: f32, a: f32) bool;
extern fn TTF_GetTextColor(text: ?*TTF_Text, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8, a: ?*Uint8) bool;
extern fn TTF_GetTextColorFloat(text: ?*TTF_Text, r: ?*f32, g: ?*f32, b: ?*f32, a: ?*f32) bool;
extern fn TTF_SetTextPosition(text: ?*TTF_Text, x: c_int, y: c_int) bool;
extern fn TTF_GetTextPosition(text: ?*TTF_Text, x: ?*c_int, y: ?*c_int) bool;
extern fn TTF_SetTextWrapWidth(text: ?*TTF_Text, wrap_width: c_int) bool;
extern fn TTF_GetTextWrapWidth(text: ?*TTF_Text, wrap_width: ?*c_int) bool;
extern fn TTF_GetTextSize(text: ?*TTF_Text, w: ?*c_int, h: ?*c_int) bool;

// Text wrap whitespace
extern fn TTF_SetTextWrapWhitespaceVisible(text: ?*TTF_Text, visible: bool) bool;
extern fn TTF_TextWrapWhitespaceVisible(text: ?*TTF_Text) bool;

// Text string manipulation
extern fn TTF_SetTextString(text: ?*TTF_Text, string: ?[*:0]const u8, length: usize) bool;
extern fn TTF_InsertTextString(text: ?*TTF_Text, offset: c_int, string: ?[*:0]const u8, length: usize) bool;
extern fn TTF_AppendTextString(text: ?*TTF_Text, string: ?[*:0]const u8, length: usize) bool;
extern fn TTF_DeleteTextString(text: ?*TTF_Text, offset: c_int, length: c_int) bool;

// Substring queries
extern fn TTF_GetTextSubString(text: ?*TTF_Text, offset: c_int, substring: ?*TTF_SubString) bool;
extern fn TTF_GetTextSubStringForLine(text: ?*TTF_Text, line: c_int, substring: ?*TTF_SubString) bool;
extern fn TTF_GetTextSubStringsForRange(text: ?*TTF_Text, offset: c_int, length: c_int, count: ?*c_int) ?[*]?*TTF_SubString;
extern fn TTF_GetTextSubStringForPoint(text: ?*TTF_Text, x: c_int, y: c_int, substring: ?*TTF_SubString) bool;
extern fn TTF_GetPreviousTextSubString(text: ?*TTF_Text, substring: ?*const TTF_SubString, previous: ?*TTF_SubString) bool;
extern fn TTF_GetNextTextSubString(text: ?*TTF_Text, substring: ?*const TTF_SubString, next: ?*TTF_SubString) bool;

// Public API
pub const version = TTF_Version;
pub const getFreeTypeVersion = TTF_GetFreeTypeVersion;
pub const getHarfBuzzVersion = TTF_GetHarfBuzzVersion;
pub const init = TTF_Init;
pub const quit = TTF_Quit;
pub const wasInit = TTF_WasInit;
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
pub const fontHasGlyph = TTF_FontHasGlyph;
pub const getFontFamilyName = TTF_GetFontFamilyName;
pub const getFontStyleName = TTF_GetFontStyleName;
pub const getGlyphMetrics = TTF_GetGlyphMetrics;
pub const getGlyphKerning = TTF_GetGlyphKerning;
pub const getStringSize = TTF_GetStringSize;
pub const getStringSizeWrapped = TTF_GetStringSizeWrapped;
pub const measureString = TTF_MeasureString;
pub const renderTextSolid = TTF_RenderText_Solid;
pub const renderTextSolidWrapped = TTF_RenderText_Solid_Wrapped;
pub const renderGlyphSolid = TTF_RenderGlyph_Solid;
pub const renderTextShaded = TTF_RenderText_Shaded;
pub const renderTextShadedWrapped = TTF_RenderText_Shaded_Wrapped;
pub const renderGlyphShaded = TTF_RenderGlyph_Shaded;
pub const renderTextBlended = TTF_RenderText_Blended;
pub const renderTextBlendedWrapped = TTF_RenderText_Blended_Wrapped;
pub const renderGlyphBlended = TTF_RenderGlyph_Blended;
pub const renderTextLCD = TTF_RenderText_LCD;
pub const renderTextLCDWrapped = TTF_RenderText_LCD_Wrapped;
pub const renderGlyphLCD = TTF_RenderGlyph_LCD;

pub const setFontDirection = TTF_SetFontDirection;
pub const getFontDirection = TTF_GetFontDirection;
pub const setFontScript = TTF_SetFontScript;
pub const getFontScript = TTF_GetFontScript;
pub const getGlyphScript = TTF_GetGlyphScript;
pub const setFontLanguage = TTF_SetFontLanguage;
pub const getGlyphImage = TTF_GetGlyphImage;
pub const getGlyphImageForIndex = TTF_GetGlyphImageForIndex;
pub const stringToTag = TTF_StringToTag;
pub const tagToString = TTF_TagToString;

pub const createSurfaceTextEngine = TTF_CreateSurfaceTextEngine;
pub const destroySurfaceTextEngine = TTF_DestroySurfaceTextEngine;
pub const createRendererTextEngine = TTF_CreateRendererTextEngine;
pub const createRendererTextEngineWithProperties = TTF_CreateRendererTextEngineWithProperties;
pub const destroyRendererTextEngine = TTF_DestroyRendererTextEngine;
pub const createGPUTextEngine = TTF_CreateGPUTextEngine;
pub const createGPUTextEngineWithProperties = TTF_CreateGPUTextEngineWithProperties;
pub const destroyGPUTextEngine = TTF_DestroyGPUTextEngine;
pub const setGPUTextEngineWinding = TTF_SetGPUTextEngineWinding;
pub const getGPUTextEngineWinding = TTF_GetGPUTextEngineWinding;

pub const createText = TTF_CreateText;
pub const destroyText = TTF_DestroyText;
pub const updateText = TTF_UpdateText;
pub const drawSurfaceText = TTF_DrawSurfaceText;
pub const drawRendererText = TTF_DrawRendererText;
pub const getGPUTextDrawData = TTF_GetGPUTextDrawData;

pub const getTextProperties = TTF_GetTextProperties;
pub const setTextEngine = TTF_SetTextEngine;
pub const getTextEngine = TTF_GetTextEngine;
pub const setTextFont = TTF_SetTextFont;
pub const getTextFont = TTF_GetTextFont;
pub const setTextDirection = TTF_SetTextDirection;
pub const getTextDirection = TTF_GetTextDirection;
pub const setTextScript = TTF_SetTextScript;
pub const getTextScript = TTF_GetTextScript;
pub const setTextColor = TTF_SetTextColor;
pub const setTextColorFloat = TTF_SetTextColorFloat;
pub const getTextColor = TTF_GetTextColor;
pub const getTextColorFloat = TTF_GetTextColorFloat;
pub const setTextPosition = TTF_SetTextPosition;
pub const getTextPosition = TTF_GetTextPosition;
pub const setTextWrapWidth = TTF_SetTextWrapWidth;
pub const getTextWrapWidth = TTF_GetTextWrapWidth;
pub const getTextSize = TTF_GetTextSize;
pub const setTextWrapWhitespaceVisible = TTF_SetTextWrapWhitespaceVisible;
pub const textWrapWhitespaceVisible = TTF_TextWrapWhitespaceVisible;

pub const setTextString = TTF_SetTextString;
pub const insertTextString = TTF_InsertTextString;
pub const appendTextString = TTF_AppendTextString;
pub const deleteTextString = TTF_DeleteTextString;

pub const getTextSubString = TTF_GetTextSubString;
pub const getTextSubStringForLine = TTF_GetTextSubStringForLine;
pub const getTextSubStringsForRange = TTF_GetTextSubStringsForRange;
pub const getTextSubStringForPoint = TTF_GetTextSubStringForPoint;
pub const getPreviousTextSubString = TTF_GetPreviousTextSubString;
pub const getNextTextSubString = TTF_GetNextTextSubString;
