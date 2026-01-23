// SDL3 Pixels and Rect Bindings
// Pixel formats, blend modes, rectangles, colors

const core = @import("core.zig");

// Import basic types
pub const Uint8 = core.Uint8;
pub const Uint32 = core.Uint32;

// Pixel format
pub const SDL_PixelFormat = c_uint;

// Key pixel formats
pub const SDL_PIXELFORMAT_UNKNOWN = 0;
pub const SDL_PIXELFORMAT_RGBA8888 = 0x16462004;
pub const SDL_PIXELFORMAT_ARGB8888 = 0x16362004;
pub const SDL_PIXELFORMAT_ABGR8888 = 0x16762004;
pub const SDL_PIXELFORMAT_BGRA8888 = 0x16862004;
pub const SDL_PIXELFORMAT_RGB565 = 0x15151002;

// Blend modes
pub const SDL_BlendMode = Uint32;
pub const SDL_BLENDMODE_NONE = 0x00000000;
pub const SDL_BLENDMODE_BLEND = 0x00000001;
pub const SDL_BLENDMODE_BLEND_PREMULTIPLIED = 0x00000010;
pub const SDL_BLENDMODE_ADD = 0x00000002;
pub const SDL_BLENDMODE_ADD_PREMULTIPLIED = 0x00000020;
pub const SDL_BLENDMODE_MOD = 0x00000004;
pub const SDL_BLENDMODE_MUL = 0x00000008;
pub const SDL_BLENDMODE_INVALID = 0x7FFFFFFF;

pub const SDL_BlendOperation = enum(c_int) {
    SDL_BLENDOPERATION_ADD = 0x1,
    SDL_BLENDOPERATION_SUBTRACT = 0x2,
    SDL_BLENDOPERATION_REV_SUBTRACT = 0x3,
    SDL_BLENDOPERATION_MINIMUM = 0x4,
    SDL_BLENDOPERATION_MAXIMUM = 0x5,
};

pub const SDL_BlendFactor = enum(c_int) {
    SDL_BLENDFACTOR_ZERO = 0x1,
    SDL_BLENDFACTOR_ONE = 0x2,
    SDL_BLENDFACTOR_SRC_COLOR = 0x3,
    SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR = 0x4,
    SDL_BLENDFACTOR_SRC_ALPHA = 0x5,
    SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 0x6,
    SDL_BLENDFACTOR_DST_COLOR = 0x7,
    SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR = 0x8,
    SDL_BLENDFACTOR_DST_ALPHA = 0x9,
    SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA = 0xA,
};

// Color
pub const SDL_Color = extern struct {
    r: Uint8,
    g: Uint8,
    b: Uint8,
    a: Uint8,
};

// Palette
pub const SDL_Palette = extern struct {
    ncolors: c_int,
    colors: ?[*]SDL_Color,
    version: Uint32,
    refcount: c_int,
};

// Point and Rect
pub const SDL_Point = extern struct {
    x: c_int,
    y: c_int,
};

pub const SDL_FPoint = extern struct {
    x: f32,
    y: f32,
};

pub const SDL_Rect = extern struct {
    x: c_int,
    y: c_int,
    w: c_int,
    h: c_int,
};

pub const SDL_FRect = extern struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,
};

// Pixel functions
extern fn SDL_GetPixelFormatName(format: SDL_PixelFormat) ?[*:0]const u8;
extern fn SDL_GetMasksForPixelFormat(format: SDL_PixelFormat, bpp: ?*c_int, Rmask: ?*Uint32, Gmask: ?*Uint32, Bmask: ?*Uint32, Amask: ?*Uint32) bool;

// Blend mode function
extern fn SDL_ComposeCustomBlendMode(srcColorFactor: SDL_BlendFactor, dstColorFactor: SDL_BlendFactor, colorOperation: SDL_BlendOperation, srcAlphaFactor: SDL_BlendFactor, dstAlphaFactor: SDL_BlendFactor, alphaOperation: SDL_BlendOperation) SDL_BlendMode;

// Color mapping functions
extern fn SDL_MapRGB(format: SDL_PixelFormat, palette: ?*SDL_Palette, r: Uint8, g: Uint8, b: Uint8) Uint32;
extern fn SDL_MapRGBA(format: SDL_PixelFormat, palette: ?*SDL_Palette, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32;
extern fn SDL_GetRGB(pixel: Uint32, format: SDL_PixelFormat, palette: ?*SDL_Palette, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8) void;
extern fn SDL_GetRGBA(pixel: Uint32, format: SDL_PixelFormat, palette: ?*SDL_Palette, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8, a: ?*Uint8) void;

// Palette functions
extern fn SDL_AllocPalette(ncolors: c_int) ?*SDL_Palette;
extern fn SDL_SetPaletteColors(palette: ?*SDL_Palette, colors: ?[*]const SDL_Color, firstcolor: c_int, ncolors: c_int) bool;
extern fn SDL_FreePalette(palette: ?*SDL_Palette) void;

// Rect functions (inline in C, implemented in Zig)
pub fn SDL_PointInRect(p: ?*const SDL_Point, r: ?*const SDL_Rect) bool {
    return if (p != null and r != null and p.?.x >= r.?.x and p.?.x < r.?.x + r.?.w and p.?.y >= r.?.y and p.?.y < r.?.y + r.?.h) true else false;
}

pub fn SDL_RectEmpty(r: ?*const SDL_Rect) bool {
    return (r == null or r.?.w <= 0 or r.?.h <= 0);
}

// Public API
pub const getPixelFormatName = SDL_GetPixelFormatName;
pub const getMasksForPixelFormat = SDL_GetMasksForPixelFormat;
pub const composeCustomBlendMode = SDL_ComposeCustomBlendMode;
pub const mapRGB = SDL_MapRGB;
pub const mapRGBA = SDL_MapRGBA;
pub const getRGB = SDL_GetRGB;
pub const getRGBA = SDL_GetRGBA;
pub const allocPalette = SDL_AllocPalette;
pub const setPaletteColors = SDL_SetPaletteColors;
pub const freePalette = SDL_FreePalette;
