// SDL3 Pixels and Rect Bindings
// Pixel formats, blend modes, rectangles, colors

const core = @import("core.zig");

// Import basic types
pub const Uint8 = core.Uint8;
pub const Uint32 = core.Uint32;

// Pixel format
pub const SDL_PixelFormat = c_uint;

// Pixel format values
pub const SDL_PIXELFORMAT_UNKNOWN = 0;
pub const SDL_PIXELFORMAT_INDEX1LSB = 0x11100100;
pub const SDL_PIXELFORMAT_INDEX1MSB = 0x11200100;
pub const SDL_PIXELFORMAT_INDEX2LSB = 0x1c100200;
pub const SDL_PIXELFORMAT_INDEX2MSB = 0x1c200200;
pub const SDL_PIXELFORMAT_INDEX4LSB = 0x12100400;
pub const SDL_PIXELFORMAT_INDEX4MSB = 0x12200400;
pub const SDL_PIXELFORMAT_INDEX8 = 0x13000801;
pub const SDL_PIXELFORMAT_RGB332 = 0x14110801;
pub const SDL_PIXELFORMAT_XRGB4444 = 0x15120c02;
pub const SDL_PIXELFORMAT_XBGR4444 = 0x15520c02;
pub const SDL_PIXELFORMAT_XRGB1555 = 0x15130f02;
pub const SDL_PIXELFORMAT_XBGR1555 = 0x15530f02;
pub const SDL_PIXELFORMAT_ARGB4444 = 0x15321002;
pub const SDL_PIXELFORMAT_RGBA4444 = 0x15421002;
pub const SDL_PIXELFORMAT_ABGR4444 = 0x15721002;
pub const SDL_PIXELFORMAT_BGRA4444 = 0x15821002;
pub const SDL_PIXELFORMAT_ARGB1555 = 0x15331002;
pub const SDL_PIXELFORMAT_RGBA5551 = 0x15441002;
pub const SDL_PIXELFORMAT_ABGR1555 = 0x15731002;
pub const SDL_PIXELFORMAT_BGRA5551 = 0x15841002;
pub const SDL_PIXELFORMAT_RGB565 = 0x15151002;
pub const SDL_PIXELFORMAT_BGR565 = 0x15551002;
pub const SDL_PIXELFORMAT_RGB24 = 0x17101803;
pub const SDL_PIXELFORMAT_BGR24 = 0x17401803;
pub const SDL_PIXELFORMAT_XRGB8888 = 0x16161804;
pub const SDL_PIXELFORMAT_RGBX8888 = 0x16261804;
pub const SDL_PIXELFORMAT_XBGR8888 = 0x16561804;
pub const SDL_PIXELFORMAT_BGRX8888 = 0x16661804;
pub const SDL_PIXELFORMAT_ARGB8888 = 0x16362004;
pub const SDL_PIXELFORMAT_RGBA8888 = 0x16462004;
pub const SDL_PIXELFORMAT_ABGR8888 = 0x16762004;
pub const SDL_PIXELFORMAT_BGRA8888 = 0x16862004;
pub const SDL_PIXELFORMAT_XRGB2101010 = 0x16172004;
pub const SDL_PIXELFORMAT_XBGR2101010 = 0x16572004;
pub const SDL_PIXELFORMAT_ARGB2101010 = 0x16372004;
pub const SDL_PIXELFORMAT_ABGR2101010 = 0x16772004;
pub const SDL_PIXELFORMAT_RGB48 = 0x18103006;
pub const SDL_PIXELFORMAT_BGR48 = 0x18403006;
pub const SDL_PIXELFORMAT_RGBA64 = 0x18204008;
pub const SDL_PIXELFORMAT_ARGB64 = 0x18304008;
pub const SDL_PIXELFORMAT_BGRA64 = 0x18504008;
pub const SDL_PIXELFORMAT_ABGR64 = 0x18604008;
pub const SDL_PIXELFORMAT_RGB48_FLOAT = 0x1a103006;
pub const SDL_PIXELFORMAT_BGR48_FLOAT = 0x1a403006;
pub const SDL_PIXELFORMAT_RGBA64_FLOAT = 0x1a204008;
pub const SDL_PIXELFORMAT_ARGB64_FLOAT = 0x1a304008;
pub const SDL_PIXELFORMAT_BGRA64_FLOAT = 0x1a504008;
pub const SDL_PIXELFORMAT_ABGR64_FLOAT = 0x1a604008;
pub const SDL_PIXELFORMAT_RGB96_FLOAT = 0x1b10600c;
pub const SDL_PIXELFORMAT_BGR96_FLOAT = 0x1b40600c;
pub const SDL_PIXELFORMAT_RGBA128_FLOAT = 0x1b208010;
pub const SDL_PIXELFORMAT_ARGB128_FLOAT = 0x1b308010;
pub const SDL_PIXELFORMAT_BGRA128_FLOAT = 0x1b508010;
pub const SDL_PIXELFORMAT_ABGR128_FLOAT = 0x1b608010;
pub const SDL_PIXELFORMAT_YV12 = 0x32315659;
pub const SDL_PIXELFORMAT_IYUV = 0x56555949;
pub const SDL_PIXELFORMAT_YUY2 = 0x32595559;
pub const SDL_PIXELFORMAT_UYVY = 0x59565955;
pub const SDL_PIXELFORMAT_YVYU = 0x55595659;
pub const SDL_PIXELFORMAT_NV12 = 0x3231564e;
pub const SDL_PIXELFORMAT_NV21 = 0x3132564e;
pub const SDL_PIXELFORMAT_P010 = 0x30313050;
pub const SDL_PIXELFORMAT_EXTERNAL_OES = 0x2053454f;
pub const SDL_PIXELFORMAT_MJPG = 0x47504a4d;

// Endian-dependent aliases (little-endian default)
pub const SDL_PIXELFORMAT_RGBA32 = SDL_PIXELFORMAT_ABGR8888;
pub const SDL_PIXELFORMAT_ARGB32 = SDL_PIXELFORMAT_BGRA8888;
pub const SDL_PIXELFORMAT_BGRA32 = SDL_PIXELFORMAT_ARGB8888;
pub const SDL_PIXELFORMAT_ABGR32 = SDL_PIXELFORMAT_RGBA8888;
pub const SDL_PIXELFORMAT_RGBX32 = SDL_PIXELFORMAT_XBGR8888;
pub const SDL_PIXELFORMAT_XRGB32 = SDL_PIXELFORMAT_BGRX8888;
pub const SDL_PIXELFORMAT_BGRX32 = SDL_PIXELFORMAT_XRGB8888;
pub const SDL_PIXELFORMAT_XBGR32 = SDL_PIXELFORMAT_RGBX8888;

// Pixel format helper functions (replace C macros)
pub fn SDL_DEFINE_PIXELFOURCC(A: u8, B: u8, C: u8, D: u8) u32 {
    return @as(u32, A) | (@as(u32, B) << 8) | (@as(u32, C) << 16) | (@as(u32, D) << 24);
}
pub fn SDL_DEFINE_PIXELFORMAT(pixeltype: u32, order: u32, layout: u32, bits: u32, bytes: u32) u32 {
    return (1 << 28) | ((pixeltype) << 24) | ((order) << 20) | ((layout) << 16) | ((bits) << 8) | (bytes);
}
pub fn SDL_PIXELFLAG(format: anytype) u32 {
    return (@as(u32, @intCast(format)) >> 28) & 0x0F;
}
pub fn SDL_PIXELTYPE(format: anytype) u32 {
    return (@as(u32, @intCast(format)) >> 24) & 0x0F;
}
pub fn SDL_PIXELORDER(format: anytype) u32 {
    return (@as(u32, @intCast(format)) >> 20) & 0x0F;
}
pub fn SDL_PIXELLAYOUT(format: anytype) u32 {
    return (@as(u32, @intCast(format)) >> 16) & 0x0F;
}
pub fn SDL_ISPIXELFORMAT_FOURCC(format: anytype) bool {
    const f = @as(u32, @intCast(format));
    return f != 0 and SDL_PIXELFLAG(f) != 1;
}
pub fn SDL_BITSPERPIXEL(format: anytype) u32 {
    const f = @as(u32, @intCast(format));
    if (SDL_ISPIXELFORMAT_FOURCC(f)) return 0;
    return (f >> 8) & 0xFF;
}
pub fn SDL_BYTESPERPIXEL(format: anytype) u32 {
    const f = @as(u32, @intCast(format));
    if (SDL_ISPIXELFORMAT_FOURCC(f)) {
        if (f == SDL_PIXELFORMAT_YUY2 or f == SDL_PIXELFORMAT_UYVY or f == SDL_PIXELFORMAT_YVYU or f == SDL_PIXELFORMAT_P010) return 2;
        return 1;
    }
    return f & 0xFF;
}
pub fn SDL_ISPIXELFORMAT_INDEXED(format: anytype) bool {
    const f = @as(u32, @intCast(format));
    return !SDL_ISPIXELFORMAT_FOURCC(f) and switch (SDL_PIXELTYPE(f)) {
        1, 2, 3, 12 => true,
        else => false,
    };
}
pub fn SDL_ISPIXELFORMAT_PACKED(format: anytype) bool {
    const f = @as(u32, @intCast(format));
    return !SDL_ISPIXELFORMAT_FOURCC(f) and switch (SDL_PIXELTYPE(f)) {
        4, 5, 6 => true,
        else => false,
    };
}
pub fn SDL_ISPIXELFORMAT_ARRAY(format: anytype) bool {
    const f = @as(u32, @intCast(format));
    return !SDL_ISPIXELFORMAT_FOURCC(f) and switch (SDL_PIXELTYPE(f)) {
        7, 8, 9, 10, 11 => true,
        else => false,
    };
}
pub fn SDL_ISPIXELFORMAT_10BIT(format: anytype) bool {
    const f = @as(u32, @intCast(format));
    return !SDL_ISPIXELFORMAT_FOURCC(f) and SDL_PIXELTYPE(f) == 6 and SDL_PIXELLAYOUT(f) == 7;
}
pub fn SDL_ISPIXELFORMAT_FLOAT(format: anytype) bool {
    const f = @as(u32, @intCast(format));
    return !SDL_ISPIXELFORMAT_FOURCC(f) and switch (SDL_PIXELTYPE(f)) {
        10, 11 => true,
        else => false,
    };
}
pub fn SDL_ISPIXELFORMAT_ALPHA(format: anytype) bool {
    const f = @as(u32, @intCast(format));
    if (SDL_ISPIXELFORMAT_PACKED(f)) {
        return switch (SDL_PIXELORDER(f)) {
            3, 4, 7, 8 => true,
            else => false,
        };
    }
    if (SDL_ISPIXELFORMAT_ARRAY(f)) {
        return switch (SDL_PIXELORDER(f)) {
            3, 2, 6, 5 => true,
            else => false,
        };
    }
    return false;
}

// Colorspace helper functions (replace C macros)
pub fn SDL_DEFINE_COLORSPACE(colortype: u32, range: u32, chroma: u32, primaries: u32, transfer: u32, matrix: u32) u32 {
    return ((colortype) << 28) | ((range) << 24) | ((chroma) << 20) | ((primaries) << 10) | ((transfer) << 5) | (matrix);
}
pub fn SDL_COLORSPACETYPE(cspace: anytype) SDL_ColorType {
    return @as(SDL_ColorType, @enumFromInt((@as(u32, @intCast(cspace)) >> 28) & 0x0F));
}
pub fn SDL_COLORSPACERANGE(cspace: anytype) SDL_ColorRange {
    return @as(SDL_ColorRange, @enumFromInt((@as(u32, @intCast(cspace)) >> 24) & 0x0F));
}
pub fn SDL_COLORSPACECHROMA(cspace: anytype) SDL_ChromaLocation {
    return @as(SDL_ChromaLocation, @enumFromInt((@as(u32, @intCast(cspace)) >> 20) & 0x0F));
}
pub fn SDL_COLORSPACEPRIMARIES(cspace: anytype) SDL_ColorPrimaries {
    return @as(SDL_ColorPrimaries, @enumFromInt((@as(u32, @intCast(cspace)) >> 10) & 0x1F));
}
pub fn SDL_COLORSPACETRANSFER(cspace: anytype) SDL_TransferCharacteristics {
    return @as(SDL_TransferCharacteristics, @enumFromInt((@as(u32, @intCast(cspace)) >> 5) & 0x1F));
}
pub fn SDL_COLORSPACEMATRIX(cspace: anytype) SDL_MatrixCoefficients {
    return @as(SDL_MatrixCoefficients, @enumFromInt(@as(u32, @intCast(cspace)) & 0x1F));
}
pub fn SDL_ISCOLORSPACE_MATRIX_BT601(cspace: anytype) bool {
    const m = SDL_COLORSPACEMATRIX(cspace);
    return m == .SDL_MATRIX_COEFFICIENTS_BT601 or m == .SDL_MATRIX_COEFFICIENTS_BT470BG;
}
pub fn SDL_ISCOLORSPACE_MATRIX_BT709(cspace: anytype) bool {
    return SDL_COLORSPACEMATRIX(cspace) == .SDL_MATRIX_COEFFICIENTS_BT709;
}
pub fn SDL_ISCOLORSPACE_MATRIX_BT2020_NCL(cspace: anytype) bool {
    return SDL_COLORSPACEMATRIX(cspace) == .SDL_MATRIX_COEFFICIENTS_BT2020_NCL;
}
pub fn SDL_ISCOLORSPACE_LIMITED_RANGE(cspace: anytype) bool {
    return SDL_COLORSPACERANGE(cspace) != .SDL_COLOR_RANGE_FULL;
}
pub fn SDL_ISCOLORSPACE_FULL_RANGE(cspace: anytype) bool {
    return SDL_COLORSPACERANGE(cspace) == .SDL_COLOR_RANGE_FULL;
}

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

pub const SDL_FColor = extern struct {
    r: f32,
    g: f32,
    b: f32,
    a: f32,
};

pub const SDL_ALPHA_OPAQUE: Uint8 = 255;
pub const SDL_ALPHA_OPAQUE_FLOAT: f32 = 1.0;
pub const SDL_ALPHA_TRANSPARENT: Uint8 = 0;
pub const SDL_ALPHA_TRANSPARENT_FLOAT: f32 = 0.0;

// Pixel type
pub const SDL_PixelType = enum(c_int) {
    SDL_PIXELTYPE_UNKNOWN = 0,
    SDL_PIXELTYPE_INDEX1,
    SDL_PIXELTYPE_INDEX4,
    SDL_PIXELTYPE_INDEX8,
    SDL_PIXELTYPE_PACKED8,
    SDL_PIXELTYPE_PACKED16,
    SDL_PIXELTYPE_PACKED32,
    SDL_PIXELTYPE_ARRAYU8,
    SDL_PIXELTYPE_ARRAYU16,
    SDL_PIXELTYPE_ARRAYU32,
    SDL_PIXELTYPE_ARRAYF16,
    SDL_PIXELTYPE_ARRAYF32,
    SDL_PIXELTYPE_INDEX2,
};

pub const SDL_BitmapOrder = enum(c_int) {
    SDL_BITMAPORDER_NONE = 0,
    SDL_BITMAPORDER_4321,
    SDL_BITMAPORDER_1234,
};

pub const SDL_PackedOrder = enum(c_int) {
    SDL_PACKEDORDER_NONE = 0,
    SDL_PACKEDORDER_XRGB,
    SDL_PACKEDORDER_RGBX,
    SDL_PACKEDORDER_ARGB,
    SDL_PACKEDORDER_RGBA,
    SDL_PACKEDORDER_XBGR,
    SDL_PACKEDORDER_BGRX,
    SDL_PACKEDORDER_ABGR,
    SDL_PACKEDORDER_BGRA,
};

pub const SDL_ArrayOrder = enum(c_int) {
    SDL_ARRAYORDER_NONE = 0,
    SDL_ARRAYORDER_RGB,
    SDL_ARRAYORDER_RGBA,
    SDL_ARRAYORDER_ARGB,
    SDL_ARRAYORDER_BGR,
    SDL_ARRAYORDER_BGRA,
    SDL_ARRAYORDER_ABGR,
};

pub const SDL_PackedLayout = enum(c_int) {
    SDL_PACKEDLAYOUT_NONE = 0,
    SDL_PACKEDLAYOUT_332,
    SDL_PACKEDLAYOUT_4444,
    SDL_PACKEDLAYOUT_1555,
    SDL_PACKEDLAYOUT_5551,
    SDL_PACKEDLAYOUT_565,
    SDL_PACKEDLAYOUT_8888,
    SDL_PACKEDLAYOUT_2101010,
    SDL_PACKEDLAYOUT_1010102,
};

pub const SDL_ColorType = enum(c_int) {
    SDL_COLOR_TYPE_UNKNOWN = 0,
    SDL_COLOR_TYPE_RGB,
    SDL_COLOR_TYPE_YCBCR,
};

pub const SDL_ColorRange = enum(c_int) {
    SDL_COLOR_RANGE_UNKNOWN = 0,
    SDL_COLOR_RANGE_LIMITED,
    SDL_COLOR_RANGE_FULL,
};

pub const SDL_ColorPrimaries = enum(c_int) {
    SDL_COLOR_PRIMARIES_UNKNOWN = 0,
    SDL_COLOR_PRIMARIES_BT709,
    SDL_COLOR_PRIMARIES_UNSPECIFIED,
    SDL_COLOR_PRIMARIES_BT470M = 4,
    SDL_COLOR_PRIMARIES_BT470BG,
    SDL_COLOR_PRIMARIES_BT601,
    SDL_COLOR_PRIMARIES_SMPTE240,
    SDL_COLOR_PRIMARIES_GENERIC_FILM,
    SDL_COLOR_PRIMARIES_BT2020,
    SDL_COLOR_PRIMARIES_XYZ,
    SDL_COLOR_PRIMARIES_SMPTE431,
    SDL_COLOR_PRIMARIES_SMPTE432,
    SDL_COLOR_PRIMARIES_EBU3213 = 22,
    SDL_COLOR_PRIMARIES_CUSTOM = 31,
};

pub const SDL_TransferCharacteristics = enum(c_int) {
    SDL_TRANSFER_CHARACTERISTICS_UNKNOWN = 0,
    SDL_TRANSFER_CHARACTERISTICS_BT709,
    SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED,
    SDL_TRANSFER_CHARACTERISTICS_GAMMA22 = 4,
    SDL_TRANSFER_CHARACTERISTICS_GAMMA28,
    SDL_TRANSFER_CHARACTERISTICS_BT601,
    SDL_TRANSFER_CHARACTERISTICS_SMPTE240,
    SDL_TRANSFER_CHARACTERISTICS_LINEAR,
    SDL_TRANSFER_CHARACTERISTICS_LOG100,
    SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10,
    SDL_TRANSFER_CHARACTERISTICS_IEC61966,
    SDL_TRANSFER_CHARACTERISTICS_BT1361,
    SDL_TRANSFER_CHARACTERISTICS_SRGB,
    SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT,
    SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT,
    SDL_TRANSFER_CHARACTERISTICS_PQ,
    SDL_TRANSFER_CHARACTERISTICS_SMPTE428,
    SDL_TRANSFER_CHARACTERISTICS_HLG,
    SDL_TRANSFER_CHARACTERISTICS_CUSTOM = 31,
};

pub const SDL_MatrixCoefficients = enum(c_int) {
    SDL_MATRIX_COEFFICIENTS_IDENTITY = 0,
    SDL_MATRIX_COEFFICIENTS_BT709,
    SDL_MATRIX_COEFFICIENTS_UNSPECIFIED,
    SDL_MATRIX_COEFFICIENTS_FCC = 4,
    SDL_MATRIX_COEFFICIENTS_BT470BG,
    SDL_MATRIX_COEFFICIENTS_BT601,
    SDL_MATRIX_COEFFICIENTS_SMPTE240,
    SDL_MATRIX_COEFFICIENTS_YCGCO,
    SDL_MATRIX_COEFFICIENTS_BT2020_NCL,
    SDL_MATRIX_COEFFICIENTS_BT2020_CL,
    SDL_MATRIX_COEFFICIENTS_SMPTE2085,
    SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL,
    SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL,
    SDL_MATRIX_COEFFICIENTS_ICTCP,
    SDL_MATRIX_COEFFICIENTS_CUSTOM = 31,
};

pub const SDL_ChromaLocation = enum(c_int) {
    SDL_CHROMA_LOCATION_NONE = 0,
    SDL_CHROMA_LOCATION_LEFT,
    SDL_CHROMA_LOCATION_CENTER,
    SDL_CHROMA_LOCATION_TOPLEFT,
};

pub const SDL_Colorspace = enum(c_int) {
    SDL_COLORSPACE_UNKNOWN = 0,
    SDL_COLORSPACE_SRGB = 0x120005a0,
    SDL_COLORSPACE_SRGB_LINEAR = 0x12000500,
    SDL_COLORSPACE_HDR10 = 0x12002600,
    SDL_COLORSPACE_JPEG = 0x220004c6,
    SDL_COLORSPACE_BT601_LIMITED = 0x211018c6,
    SDL_COLORSPACE_BT601_FULL = 0x221018c6,
    SDL_COLORSPACE_BT709_LIMITED = 0x21100421,
    SDL_COLORSPACE_BT709_FULL = 0x22100421,
    SDL_COLORSPACE_BT2020_LIMITED = 0x21102609,
    SDL_COLORSPACE_BT2020_FULL = 0x22102609,
    SDL_COLORSPACE_RGB_DEFAULT = 0x120005a0,
    SDL_COLORSPACE_YUV_DEFAULT = 0x211018c6,
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
extern fn SDL_GetPixelFormatName(format: SDL_PixelFormat) ?[*:0]const u8;
extern fn SDL_GetMasksForPixelFormat(format: SDL_PixelFormat, bpp: ?*c_int, Rmask: ?*Uint32, Gmask: ?*Uint32, Bmask: ?*Uint32, Amask: ?*Uint32) bool;

// Blend mode function
extern fn SDL_ComposeCustomBlendMode(srcColorFactor: SDL_BlendFactor, dstColorFactor: SDL_BlendFactor, colorOperation: SDL_BlendOperation, srcAlphaFactor: SDL_BlendFactor, dstAlphaFactor: SDL_BlendFactor, alphaOperation: SDL_BlendOperation) SDL_BlendMode;

// Color mapping functions
extern fn SDL_MapRGB(format: ?*const SDL_PixelFormatDetails, palette: ?*const SDL_Palette, r: Uint8, g: Uint8, b: Uint8) Uint32;
extern fn SDL_MapRGBA(format: ?*const SDL_PixelFormatDetails, palette: ?*const SDL_Palette, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32;
extern fn SDL_GetRGB(pixel: Uint32, format: ?*const SDL_PixelFormatDetails, palette: ?*const SDL_Palette, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8) void;
extern fn SDL_GetRGBA(pixel: Uint32, format: ?*const SDL_PixelFormatDetails, palette: ?*const SDL_Palette, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8, a: ?*Uint8) void;

// Palette functions
extern fn SDL_SetPaletteColors(palette: ?*SDL_Palette, colors: ?[*]const SDL_Color, firstcolor: c_int, ncolors: c_int) bool;

// Pixel format functions
extern fn SDL_GetPixelFormatForMasks(bpp: c_int, Rmask: Uint32, Gmask: Uint32, Bmask: Uint32, Amask: Uint32) SDL_PixelFormat;
extern fn SDL_GetPixelFormatDetails(format: SDL_PixelFormat) ?*const SDL_PixelFormatDetails;
extern fn SDL_CreatePalette(ncolors: c_int) ?*SDL_Palette;
extern fn SDL_DestroyPalette(palette: ?*SDL_Palette) void;

// Rect functions
extern fn SDL_HasRectIntersection(A: ?*const SDL_Rect, B: ?*const SDL_Rect) bool;
extern fn SDL_GetRectIntersection(A: ?*const SDL_Rect, B: ?*const SDL_Rect, result: ?*SDL_Rect) bool;
extern fn SDL_GetRectUnion(A: ?*const SDL_Rect, B: ?*const SDL_Rect, result: ?*SDL_Rect) bool;
extern fn SDL_GetRectEnclosingPoints(points: ?[*]const SDL_Point, count: c_int, clip: ?*const SDL_Rect, result: ?*SDL_Rect) bool;
extern fn SDL_GetRectAndLineIntersection(rect: ?*const SDL_Rect, X1: ?*c_int, Y1: ?*c_int, X2: ?*c_int, Y2: ?*c_int) bool;
extern fn SDL_HasRectIntersectionFloat(A: ?*const SDL_FRect, B: ?*const SDL_FRect) bool;
extern fn SDL_GetRectIntersectionFloat(A: ?*const SDL_FRect, B: ?*const SDL_FRect, result: ?*SDL_FRect) bool;
extern fn SDL_GetRectUnionFloat(A: ?*const SDL_FRect, B: ?*const SDL_FRect, result: ?*SDL_FRect) bool;
extern fn SDL_GetRectEnclosingPointsFloat(points: ?[*]const SDL_FPoint, count: c_int, clip: ?*const SDL_FRect, result: ?*SDL_FRect) bool;
extern fn SDL_GetRectAndLineIntersectionFloat(rect: ?*const SDL_FRect, X1: ?*f32, Y1: ?*f32, X2: ?*f32, Y2: ?*f32) bool;

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
pub const setPaletteColors = SDL_SetPaletteColors;
pub const getPixelFormatForMasks = SDL_GetPixelFormatForMasks;
pub const getPixelFormatDetails = SDL_GetPixelFormatDetails;
pub const createPalette = SDL_CreatePalette;
pub const destroyPalette = SDL_DestroyPalette;
pub const hasRectIntersection = SDL_HasRectIntersection;
pub const getRectIntersection = SDL_GetRectIntersection;
pub const getRectUnion = SDL_GetRectUnion;
pub const getRectEnclosingPoints = SDL_GetRectEnclosingPoints;
pub const getRectAndLineIntersection = SDL_GetRectAndLineIntersection;
pub const hasRectIntersectionFloat = SDL_HasRectIntersectionFloat;
pub const getRectIntersectionFloat = SDL_GetRectIntersectionFloat;
pub const getRectUnionFloat = SDL_GetRectUnionFloat;
pub const getRectEnclosingPointsFloat = SDL_GetRectEnclosingPointsFloat;
pub const getRectAndLineIntersectionFloat = SDL_GetRectAndLineIntersectionFloat;
