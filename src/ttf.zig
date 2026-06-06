// SDL3 TTF Bindings
// TrueType font rendering

const core = @import("core.zig");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");
const render = @import("render.zig");
const properties = @import("properties.zig");
const dynamic = @import("dynamic.zig");
const gpu = @import("gpu.zig");

// Import types
pub const Uint32 = core.Uint32;
pub const Uint64 = core.Uint64;
pub const SDL_PropertiesID = properties.SDL_PropertiesID;
pub const SDL_Surface = surface.SDL_Surface;
pub const SDL_IOStream = surface.SDL_IOStream;
pub const SDL_Color = pixels.SDL_Color;
pub const SDL_FColor = render.SDL_FColor;
pub const SDL_Rect = pixels.SDL_Rect;
pub const SDL_FPoint = pixels.SDL_FPoint;
pub const SDL_GPUTexture = gpu.SDL_GPUTexture;
pub const SDL_GPUDevice = gpu.SDL_GPUDevice;
pub const SDL_Renderer = render.SDL_Renderer;

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

// Text engine types
pub const TTF_Direction = enum(c_int) {
    TTF_DIRECTION_INVALID = 0,
    TTF_DIRECTION_LTR = 4,
    TTF_DIRECTION_RTL,
    TTF_DIRECTION_TTB,
    TTF_DIRECTION_BTT,
};

pub const TTF_ImageType = enum(c_int) {
    TTF_IMAGE_INVALID,
    TTF_IMAGE_ALPHA,
    TTF_IMAGE_COLOR,
    TTF_IMAGE_SDF,
};

pub const TTF_GPUTextEngineWinding = enum(c_int) {
    TTF_GPU_TEXTENGINE_WINDING_INVALID = -1,
    TTF_GPU_TEXTENGINE_WINDING_CLOCKWISE,
    TTF_GPU_TEXTENGINE_WINDING_COUNTER_CLOCKWISE,
};

pub const TTF_TextEngine = opaque {};

pub const TTF_Text = extern struct {
    text: [*:0]u8,
    num_lines: c_int,
    refcount: c_int,
    internal: ?*anyopaque,
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

pub const TTF_SubStringFlags = Uint32;

pub const TTF_SubString = extern struct {
    flags: TTF_SubStringFlags,
    offset: c_int,
    length: c_int,
    line_index: c_int,
    cluster_index: c_int,
    rect: SDL_Rect,
};

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

// Missing core functions
pub const PFN_TTF_WasInit = *const fn () callconv(.c) bool;
pub const PFN_TTF_MeasureString = *const fn (font: ?*const TTF_Font, text: ?[*:0]const u8, length: usize, measure_width: c_int, extent: ?*c_int, count: ?*c_int) callconv(.c) bool;
pub const PFN_TTF_FontHasGlyph = *const fn (font: ?*const TTF_Font, ch: core.Uint32) callconv(.c) bool;
pub const PFN_TTF_GetGlyphKerning = *const fn (font: ?*const TTF_Font, previous_ch: core.Uint32, ch: core.Uint32, kerning: ?*c_int) callconv(.c) bool;
pub const PFN_TTF_GetGlyphImage = *const fn (font: ?*const TTF_Font, ch: core.Uint32, image_type: ?*TTF_ImageType) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_GetGlyphImageForIndex = *const fn (font: ?*const TTF_Font, glyph_index: core.Uint32, image_type: ?*TTF_ImageType) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_GetGlyphScript = *const fn (font: ?*const TTF_Font, ch: core.Uint32) callconv(.c) core.Uint32;
pub const PFN_TTF_SetFontDirection = *const fn (font: ?*TTF_Font, direction: TTF_Direction) callconv(.c) bool;
pub const PFN_TTF_GetFontDirection = *const fn (font: ?*const TTF_Font) callconv(.c) TTF_Direction;
pub const PFN_TTF_SetFontScript = *const fn (font: ?*TTF_Font, script: core.Uint32) callconv(.c) bool;
pub const PFN_TTF_GetFontScript = *const fn (font: ?*const TTF_Font) callconv(.c) core.Uint32;
pub const PFN_TTF_SetFontLanguage = *const fn (font: ?*TTF_Font, language: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_TTF_StringToTag = *const fn (string: ?[*:0]const u8) callconv(.c) core.Uint32;
pub const PFN_TTF_TagToString = *const fn (tag: core.Uint32, string: ?[*]u8, size: usize) callconv(.c) void;

// New render functions
pub const PFN_TTF_RenderText_Solid_Wrapped = *const fn (font: ?*const TTF_Font, text: ?[*:0]const u8, length: usize, fg: SDL_Color, wrap_width: c_int) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderText_Shaded_Wrapped = *const fn (font: ?*const TTF_Font, text: ?[*:0]const u8, length: usize, fg: SDL_Color, bg: SDL_Color, wrap_width: c_int) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderText_LCD = *const fn (font: ?*const TTF_Font, text: ?[*:0]const u8, length: usize, fg: SDL_Color, bg: SDL_Color) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderText_LCD_Wrapped = *const fn (font: ?*const TTF_Font, text: ?[*:0]const u8, length: usize, fg: SDL_Color, bg: SDL_Color, wrap_width: c_int) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderGlyph_Solid = *const fn (font: ?*const TTF_Font, ch: core.Uint32, fg: SDL_Color) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderGlyph_Shaded = *const fn (font: ?*const TTF_Font, ch: core.Uint32, fg: SDL_Color, bg: SDL_Color) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderGlyph_Blended = *const fn (font: ?*const TTF_Font, ch: core.Uint32, fg: SDL_Color) callconv(.c) ?*SDL_Surface;
pub const PFN_TTF_RenderGlyph_LCD = *const fn (font: ?*const TTF_Font, ch: core.Uint32, fg: SDL_Color, bg: SDL_Color) callconv(.c) ?*SDL_Surface;

// Text engine functions
pub const PFN_TTF_CreateSurfaceTextEngine = *const fn () callconv(.c) ?*TTF_TextEngine;
pub const PFN_TTF_DestroySurfaceTextEngine = *const fn (engine: ?*TTF_TextEngine) callconv(.c) void;
pub const PFN_TTF_DrawSurfaceText = *const fn (text: ?*TTF_Text, x: c_int, y: c_int, surface: ?*SDL_Surface) callconv(.c) bool;
pub const PFN_TTF_CreateRendererTextEngine = *const fn (renderer: ?*SDL_Renderer) callconv(.c) ?*TTF_TextEngine;
pub const PFN_TTF_CreateRendererTextEngineWithProperties = *const fn (props: SDL_PropertiesID) callconv(.c) ?*TTF_TextEngine;
pub const PFN_TTF_DestroyRendererTextEngine = *const fn (engine: ?*TTF_TextEngine) callconv(.c) void;
pub const PFN_TTF_DrawRendererText = *const fn (text: ?*TTF_Text, x: f32, y: f32, renderer: ?*SDL_Renderer) callconv(.c) bool;
pub const PFN_TTF_CreateGPUTextEngine = *const fn (device: ?*SDL_GPUDevice) callconv(.c) ?*TTF_TextEngine;
pub const PFN_TTF_CreateGPUTextEngineWithProperties = *const fn (props: SDL_PropertiesID) callconv(.c) ?*TTF_TextEngine;
pub const PFN_TTF_DestroyGPUTextEngine = *const fn (engine: ?*TTF_TextEngine) callconv(.c) void;
pub const PFN_TTF_GetGPUTextDrawData = *const fn (text: ?*TTF_Text) callconv(.c) ?*const TTF_GPUAtlasDrawSequence;
pub const PFN_TTF_GetGPUTextEngineWinding = *const fn (engine: ?*TTF_TextEngine) callconv(.c) TTF_GPUTextEngineWinding;
pub const PFN_TTF_SetGPUTextEngineWinding = *const fn (engine: ?*TTF_TextEngine, winding: TTF_GPUTextEngineWinding) callconv(.c) void;

// Text object functions
pub const PFN_TTF_CreateText = *const fn (engine: ?*TTF_TextEngine, font: ?*TTF_Font, text: ?[*:0]const u8, length: usize) callconv(.c) ?*TTF_Text;
pub const PFN_TTF_DestroyText = *const fn (text: ?*TTF_Text) callconv(.c) void;
pub const PFN_TTF_UpdateText = *const fn (text: ?*TTF_Text) callconv(.c) bool;
pub const PFN_TTF_SetTextString = *const fn (text: ?*TTF_Text, string: ?[*:0]const u8, length: usize) callconv(.c) bool;
pub const PFN_TTF_AppendTextString = *const fn (text: ?*TTF_Text, string: ?[*:0]const u8, length: usize) callconv(.c) bool;
pub const PFN_TTF_DeleteTextString = *const fn (text: ?*TTF_Text, offset: c_int, length: c_int) callconv(.c) bool;
pub const PFN_TTF_InsertTextString = *const fn (text: ?*TTF_Text, offset: c_int, string: ?[*:0]const u8, length: usize) callconv(.c) bool;
pub const PFN_TTF_SetTextEngine = *const fn (text: ?*TTF_Text, engine: ?*TTF_TextEngine) callconv(.c) bool;
pub const PFN_TTF_GetTextEngine = *const fn (text: ?*TTF_Text) callconv(.c) ?*TTF_TextEngine;
pub const PFN_TTF_SetTextFont = *const fn (text: ?*TTF_Text, font: ?*TTF_Font) callconv(.c) bool;
pub const PFN_TTF_GetTextFont = *const fn (text: ?*TTF_Text) callconv(.c) ?*TTF_Font;
pub const PFN_TTF_SetTextDirection = *const fn (text: ?*TTF_Text, direction: TTF_Direction) callconv(.c) bool;
pub const PFN_TTF_GetTextDirection = *const fn (text: ?*TTF_Text) callconv(.c) TTF_Direction;
pub const PFN_TTF_SetTextPosition = *const fn (text: ?*TTF_Text, x: c_int, y: c_int) callconv(.c) bool;
pub const PFN_TTF_GetTextPosition = *const fn (text: ?*TTF_Text, x: ?*c_int, y: ?*c_int) callconv(.c) bool;
pub const PFN_TTF_SetTextColor = *const fn (text: ?*TTF_Text, r: core.Uint8, g: core.Uint8, b: core.Uint8, a: core.Uint8) callconv(.c) bool;
pub const PFN_TTF_GetTextColor = *const fn (text: ?*TTF_Text, r: ?*core.Uint8, g: ?*core.Uint8, b: ?*core.Uint8, a: ?*core.Uint8) callconv(.c) bool;
pub const PFN_TTF_SetTextColorFloat = *const fn (text: ?*TTF_Text, r: f32, g: f32, b: f32, a: f32) callconv(.c) bool;
pub const PFN_TTF_GetTextColorFloat = *const fn (text: ?*TTF_Text, r: ?*f32, g: ?*f32, b: ?*f32, a: ?*f32) callconv(.c) bool;
pub const PFN_TTF_SetTextWrapWidth = *const fn (text: ?*TTF_Text, wrap_width: c_int) callconv(.c) bool;
pub const PFN_TTF_GetTextWrapWidth = *const fn (text: ?*TTF_Text, wrap_width: ?*c_int) callconv(.c) bool;
pub const PFN_TTF_SetTextWrapWhitespaceVisible = *const fn (text: ?*TTF_Text, visible: bool) callconv(.c) bool;
pub const PFN_TTF_TextWrapWhitespaceVisible = *const fn (text: ?*TTF_Text) callconv(.c) bool;
pub const PFN_TTF_SetTextScript = *const fn (text: ?*TTF_Text, script: core.Uint32) callconv(.c) bool;
pub const PFN_TTF_GetTextScript = *const fn (text: ?*TTF_Text) callconv(.c) core.Uint32;
pub const PFN_TTF_GetTextProperties = *const fn (text: ?*TTF_Text) callconv(.c) SDL_PropertiesID;
pub const PFN_TTF_GetTextSize = *const fn (text: ?*TTF_Text, w: ?*c_int, h: ?*c_int) callconv(.c) bool;

// Substring functions
pub const PFN_TTF_GetTextSubString = *const fn (text: ?*TTF_Text, offset: c_int, substring: ?*TTF_SubString) callconv(.c) bool;
pub const PFN_TTF_GetTextSubStringForLine = *const fn (text: ?*TTF_Text, line: c_int, substring: ?*TTF_SubString) callconv(.c) bool;
pub const PFN_TTF_GetTextSubStringForPoint = *const fn (text: ?*TTF_Text, x: c_int, y: c_int, substring: ?*TTF_SubString) callconv(.c) bool;
pub const PFN_TTF_GetTextSubStringsForRange = *const fn (text: ?*TTF_Text, offset: c_int, length: c_int, substrings: ?*?*TTF_SubString) callconv(.c) c_int;
pub const PFN_TTF_GetNextTextSubString = *const fn (text: ?*TTF_Text, substring: ?*const TTF_SubString, next: ?*TTF_SubString) callconv(.c) bool;
pub const PFN_TTF_GetPreviousTextSubString = *const fn (text: ?*TTF_Text, substring: ?*const TTF_SubString, previous: ?*TTF_SubString) callconv(.c) bool;

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
    getGlyphAdvance: ?PFN_TTF_GetGlyphAdvance,
    getStringSize: PFN_TTF_GetStringSize,
    getStringSizeWrapped: PFN_TTF_GetStringSizeWrapped,
    renderTextSolid: PFN_TTF_RenderText_Solid,
    renderUTF8Solid: ?PFN_TTF_RenderUTF8_Solid,
    renderUNICODESolid: ?PFN_TTF_RenderUNICODE_Solid,
    renderTextShaded: PFN_TTF_RenderText_Shaded,
    renderUTF8Shaded: ?PFN_TTF_RenderUTF8_Shaded,
    renderUNICODEShaded: ?PFN_TTF_RenderUNICODE_Shaded,
    renderTextBlended: PFN_TTF_RenderText_Blended,
    renderUTF8Blended: ?PFN_TTF_RenderUTF8_Blended,
    renderUNICODEBlended: ?PFN_TTF_RenderUNICODE_Blended,
    renderTextBlendedWrapped: PFN_TTF_RenderText_Blended_Wrapped,
    renderUTF8BlendedWrapped: ?PFN_TTF_RenderUTF8_Blended_Wrapped,
    renderUNICODEBlendedWrapped: ?PFN_TTF_RenderUNICODE_Blended_Wrapped,
    renderTextBlendedFloat: ?PFN_TTF_RenderText_Blended_Float,
    renderUTF8BlendedFloat: ?PFN_TTF_RenderUTF8_Blended_Float,
    renderUNICODEBlendedFloat: ?PFN_TTF_RenderUNICODE_Blended_Float,
    renderTextBlendedFloatWrapped: ?PFN_TTF_RenderText_Blended_Float_Wrapped,
    renderUTF8BlendedFloatWrapped: ?PFN_TTF_RenderUTF8_Blended_Float_Wrapped,
    renderUNICODEBlendedFloatWrapped: ?PFN_TTF_RenderUNICODE_Blended_Float_Wrapped,
    wasInit: PFN_TTF_WasInit,
    measureString: PFN_TTF_MeasureString,
    fontHasGlyph: PFN_TTF_FontHasGlyph,
    getGlyphKerning: PFN_TTF_GetGlyphKerning,
    getGlyphImage: PFN_TTF_GetGlyphImage,
    getGlyphImageForIndex: PFN_TTF_GetGlyphImageForIndex,
    getGlyphScript: PFN_TTF_GetGlyphScript,
    setFontDirection: PFN_TTF_SetFontDirection,
    getFontDirection: PFN_TTF_GetFontDirection,
    setFontScript: PFN_TTF_SetFontScript,
    getFontScript: PFN_TTF_GetFontScript,
    setFontLanguage: PFN_TTF_SetFontLanguage,
    stringToTag: PFN_TTF_StringToTag,
    tagToString: PFN_TTF_TagToString,
    renderTextSolidWrapped: PFN_TTF_RenderText_Solid_Wrapped,
    renderTextShadedWrapped: PFN_TTF_RenderText_Shaded_Wrapped,
    renderTextLCD: PFN_TTF_RenderText_LCD,
    renderTextLCDWrapped: PFN_TTF_RenderText_LCD_Wrapped,
    renderGlyphSolid: PFN_TTF_RenderGlyph_Solid,
    renderGlyphShaded: PFN_TTF_RenderGlyph_Shaded,
    renderGlyphBlended: PFN_TTF_RenderGlyph_Blended,
    renderGlyphLCD: PFN_TTF_RenderGlyph_LCD,
    createSurfaceTextEngine: PFN_TTF_CreateSurfaceTextEngine,
    destroySurfaceTextEngine: PFN_TTF_DestroySurfaceTextEngine,
    drawSurfaceText: PFN_TTF_DrawSurfaceText,
    createRendererTextEngine: PFN_TTF_CreateRendererTextEngine,
    createRendererTextEngineWithProperties: PFN_TTF_CreateRendererTextEngineWithProperties,
    destroyRendererTextEngine: PFN_TTF_DestroyRendererTextEngine,
    drawRendererText: PFN_TTF_DrawRendererText,
    createGPUTextEngine: PFN_TTF_CreateGPUTextEngine,
    createGPUTextEngineWithProperties: PFN_TTF_CreateGPUTextEngineWithProperties,
    destroyGPUTextEngine: PFN_TTF_DestroyGPUTextEngine,
    getGPUTextDrawData: PFN_TTF_GetGPUTextDrawData,
    getGPUTextEngineWinding: PFN_TTF_GetGPUTextEngineWinding,
    setGPUTextEngineWinding: PFN_TTF_SetGPUTextEngineWinding,
    createText: PFN_TTF_CreateText,
    destroyText: PFN_TTF_DestroyText,
    updateText: PFN_TTF_UpdateText,
    setTextString: PFN_TTF_SetTextString,
    appendTextString: PFN_TTF_AppendTextString,
    deleteTextString: PFN_TTF_DeleteTextString,
    insertTextString: PFN_TTF_InsertTextString,
    setTextEngine: PFN_TTF_SetTextEngine,
    getTextEngine: PFN_TTF_GetTextEngine,
    setTextFont: PFN_TTF_SetTextFont,
    getTextFont: PFN_TTF_GetTextFont,
    setTextDirection: PFN_TTF_SetTextDirection,
    getTextDirection: PFN_TTF_GetTextDirection,
    setTextPosition: PFN_TTF_SetTextPosition,
    getTextPosition: PFN_TTF_GetTextPosition,
    setTextColor: PFN_TTF_SetTextColor,
    getTextColor: PFN_TTF_GetTextColor,
    setTextColorFloat: PFN_TTF_SetTextColorFloat,
    getTextColorFloat: PFN_TTF_GetTextColorFloat,
    setTextWrapWidth: PFN_TTF_SetTextWrapWidth,
    getTextWrapWidth: PFN_TTF_GetTextWrapWidth,
    setTextWrapWhitespaceVisible: PFN_TTF_SetTextWrapWhitespaceVisible,
    textWrapWhitespaceVisible: PFN_TTF_TextWrapWhitespaceVisible,
    setTextScript: PFN_TTF_SetTextScript,
    getTextScript: PFN_TTF_GetTextScript,
    getTextProperties: PFN_TTF_GetTextProperties,
    getTextSize: PFN_TTF_GetTextSize,
    getTextSubString: PFN_TTF_GetTextSubString,
    getTextSubStringForLine: PFN_TTF_GetTextSubStringForLine,
    getTextSubStringForPoint: PFN_TTF_GetTextSubStringForPoint,
    getTextSubStringsForRange: PFN_TTF_GetTextSubStringsForRange,
    getNextTextSubString: PFN_TTF_GetNextTextSubString,
    getPreviousTextSubString: PFN_TTF_GetPreviousTextSubString,

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
            .{ "renderTextSolidWrapped", "TTF_RenderText_Solid_Wrapped" },
            .{ "renderTextShadedWrapped", "TTF_RenderText_Shaded_Wrapped" },
            .{ "renderTextLCD", "TTF_RenderText_LCD" },
            .{ "renderTextLCDWrapped", "TTF_RenderText_LCD_Wrapped" },
            .{ "renderGlyphSolid", "TTF_RenderGlyph_Solid" },
            .{ "renderGlyphShaded", "TTF_RenderGlyph_Shaded" },
            .{ "renderGlyphBlended", "TTF_RenderGlyph_Blended" },
            .{ "renderGlyphLCD", "TTF_RenderGlyph_LCD" },
        }, &.{ "getGlyphAdvance", "renderUTF8Solid", "renderUNICODESolid", "renderUTF8Shaded", "renderUNICODEShaded", "renderUTF8Blended", "renderUNICODEBlended", "renderUTF8BlendedWrapped", "renderUNICODEBlendedWrapped", "renderTextBlendedFloat", "renderUTF8BlendedFloat", "renderUNICODEBlendedFloat", "renderTextBlendedFloatWrapped", "renderUTF8BlendedFloatWrapped", "renderUNICODEBlendedFloatWrapped" });
    }
};
