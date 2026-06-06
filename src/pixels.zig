// SDL3 Pixels and Rect Bindings
// Pixel formats, blend modes, rectangles, colors

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

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

// Pixel format details
pub const SDL_PixelFormatDetails = extern struct {
    format: SDL_PixelFormat,
    bits_per_pixel: Uint8,
    bytes_per_pixel: Uint8,
    padding: [2]Uint8,
    Rmask: Uint32,
    Gmask: Uint32,
    Bmask: Uint32,
    Amask: Uint32,
    Rbits: Uint8,
    Gbits: Uint8,
    Bbits: Uint8,
    Abits: Uint8,
    Rshift: Uint8,
    Gshift: Uint8,
    Bshift: Uint8,
    Ashift: Uint8,
};

// Pixel functions
pub const PFN_SDL_GetPixelFormatName = *const fn (format: SDL_PixelFormat) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetMasksForPixelFormat = *const fn (format: SDL_PixelFormat, bpp: ?*c_int, Rmask: ?*Uint32, Gmask: ?*Uint32, Bmask: ?*Uint32, Amask: ?*Uint32) callconv(.c) bool;

// Blend mode function
pub const PFN_SDL_ComposeCustomBlendMode = *const fn (srcColorFactor: SDL_BlendFactor, dstColorFactor: SDL_BlendFactor, colorOperation: SDL_BlendOperation, srcAlphaFactor: SDL_BlendFactor, dstAlphaFactor: SDL_BlendFactor, alphaOperation: SDL_BlendOperation) callconv(.c) SDL_BlendMode;

// Color mapping functions
pub const PFN_SDL_MapRGB = *const fn (format: SDL_PixelFormat, palette: ?*SDL_Palette, r: Uint8, g: Uint8, b: Uint8) callconv(.c) Uint32;
pub const PFN_SDL_MapRGBA = *const fn (format: SDL_PixelFormat, palette: ?*SDL_Palette, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) Uint32;
pub const PFN_SDL_GetRGB = *const fn (pixel: Uint32, format: SDL_PixelFormat, palette: ?*SDL_Palette, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8) callconv(.c) void;
pub const PFN_SDL_GetRGBA = *const fn (pixel: Uint32, format: SDL_PixelFormat, palette: ?*SDL_Palette, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8, a: ?*Uint8) callconv(.c) void;

// Palette functions
pub const PFN_SDL_AllocPalette = *const fn (ncolors: c_int) callconv(.c) ?*SDL_Palette;
pub const PFN_SDL_SetPaletteColors = *const fn (palette: ?*SDL_Palette, colors: ?[*]const SDL_Color, firstcolor: c_int, ncolors: c_int) callconv(.c) bool;
pub const PFN_SDL_FreePalette = *const fn (palette: ?*SDL_Palette) callconv(.c) void;

// Pixel format functions
pub const PFN_SDL_GetPixelFormatForMasks = *const fn (bpp: c_int, Rmask: Uint32, Gmask: Uint32, Bmask: Uint32, Amask: Uint32) callconv(.c) SDL_PixelFormat;
pub const PFN_SDL_GetPixelFormatDetails = *const fn (format: SDL_PixelFormat) callconv(.c) ?*const SDL_PixelFormatDetails;
pub const PFN_SDL_CreatePalette = *const fn (ncolors: c_int) callconv(.c) ?*SDL_Palette;
pub const PFN_SDL_DestroyPalette = *const fn (palette: ?*SDL_Palette) callconv(.c) void;

// Rect functions
pub const PFN_SDL_HasRectIntersection = *const fn (A: ?*const SDL_Rect, B: ?*const SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetRectIntersection = *const fn (A: ?*const SDL_Rect, B: ?*const SDL_Rect, result: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetRectUnion = *const fn (A: ?*const SDL_Rect, B: ?*const SDL_Rect, result: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetRectEnclosingPoints = *const fn (points: ?[*]const SDL_Point, count: c_int, clip: ?*const SDL_Rect, result: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetRectAndLineIntersection = *const fn (rect: ?*const SDL_Rect, X1: ?*c_int, Y1: ?*c_int, X2: ?*c_int, Y2: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_HasRectIntersectionFloat = *const fn (A: ?*const SDL_FRect, B: ?*const SDL_FRect) callconv(.c) bool;
pub const PFN_SDL_GetRectIntersectionFloat = *const fn (A: ?*const SDL_FRect, B: ?*const SDL_FRect, result: ?*SDL_FRect) callconv(.c) bool;
pub const PFN_SDL_GetRectUnionFloat = *const fn (A: ?*const SDL_FRect, B: ?*const SDL_FRect, result: ?*SDL_FRect) callconv(.c) bool;
pub const PFN_SDL_GetRectEnclosingPointsFloat = *const fn (points: ?[*]const SDL_FPoint, count: c_int, clip: ?*const SDL_FRect, result: ?*SDL_FRect) callconv(.c) bool;
pub const PFN_SDL_GetRectAndLineIntersectionFloat = *const fn (rect: ?*const SDL_FRect, X1: ?*f32, Y1: ?*f32, X2: ?*f32, Y2: ?*f32) callconv(.c) bool;

// Rect functions (inline in C, implemented in Zig)
pub fn SDL_PointInRect(p: ?*const SDL_Point, r: ?*const SDL_Rect) bool {
    return if (p != null and r != null and p.?.x >= r.?.x and p.?.x < r.?.x + r.?.w and p.?.y >= r.?.y and p.?.y < r.?.y + r.?.h) true else false;
}

pub fn SDL_RectEmpty(r: ?*const SDL_Rect) bool {
    return (r == null or r.?.w <= 0 or r.?.h <= 0);
}

pub const PixelFunctions = struct {
    getPixelFormatName: PFN_SDL_GetPixelFormatName,
    getMasksForPixelFormat: PFN_SDL_GetMasksForPixelFormat,
    composeCustomBlendMode: PFN_SDL_ComposeCustomBlendMode,
    mapRGB: PFN_SDL_MapRGB,
    mapRGBA: PFN_SDL_MapRGBA,
    getRGB: PFN_SDL_GetRGB,
    getRGBA: PFN_SDL_GetRGBA,
    allocPalette: PFN_SDL_AllocPalette,
    setPaletteColors: PFN_SDL_SetPaletteColors,
    freePalette: PFN_SDL_FreePalette,
    getPixelFormatForMasks: PFN_SDL_GetPixelFormatForMasks,
    getPixelFormatDetails: PFN_SDL_GetPixelFormatDetails,
    createPalette: PFN_SDL_CreatePalette,
    destroyPalette: PFN_SDL_DestroyPalette,
    hasRectIntersection: PFN_SDL_HasRectIntersection,
    getRectIntersection: PFN_SDL_GetRectIntersection,
    getRectUnion: PFN_SDL_GetRectUnion,
    getRectEnclosingPoints: PFN_SDL_GetRectEnclosingPoints,
    getRectAndLineIntersection: PFN_SDL_GetRectAndLineIntersection,
    hasRectIntersectionFloat: PFN_SDL_HasRectIntersectionFloat,
    getRectIntersectionFloat: PFN_SDL_GetRectIntersectionFloat,
    getRectUnionFloat: PFN_SDL_GetRectUnionFloat,
    getRectEnclosingPointsFloat: PFN_SDL_GetRectEnclosingPointsFloat,
    getRectAndLineIntersectionFloat: PFN_SDL_GetRectAndLineIntersectionFloat,

    pub fn load(handle: dynamic.LibraryHandle) !PixelFunctions {
        return dynamic.loadFunctions(PixelFunctions, handle, "SDL_", .{}, &.{ "allocPalette", "freePalette" });
    }
};
