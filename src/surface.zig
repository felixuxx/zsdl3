// SDL3 Surface Bindings
// Software surfaces for drawing

const core = @import("core.zig");
pub const Uint8 = core.Uint8;
pub const Uint32 = core.Uint32;
const pixels = @import("pixels.zig");
const render = @import("render.zig");
const dynamic = @import("dynamic.zig");
pub const SDL_PixelFormat = pixels.SDL_PixelFormat;
pub const SDL_Palette = pixels.SDL_Palette;
pub const SDL_Rect = pixels.SDL_Rect;

// Import types
// Placeholder for SDL_IOStream
pub const SDL_IOStream = opaque {};

// Flip mode
pub const SDL_FlipMode = enum(c_int) {
    SDL_FLIP_NONE = 0,
    SDL_FLIP_HORIZONTAL = 1,
    SDL_FLIP_VERTICAL = 2,
    SDL_FLIP_HORIZONTAL_AND_VERTICAL = 3, // SDL_FLIP_HORIZONTAL | SDL_FLIP_VERTICAL
};

// Surface flags
pub const SDL_SurfaceFlags = c_uint;

// Surface struct
pub const SDL_Surface = extern struct {
    flags: SDL_SurfaceFlags,
    format: SDL_PixelFormat,
    w: c_int,
    h: c_int,
    pitch: c_int,
    pixels: ?*anyopaque,
    refcount: c_int,
    reserved: ?*anyopaque,
};

// Pixel format details (re-exported from pixels)
pub const SDL_PixelFormatDetails = pixels.SDL_PixelFormatDetails;

// Surface functions
pub const PFN_SDL_CreateSurface = *const fn (width: c_int, height: c_int, format: SDL_PixelFormat) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_CreateSurfaceFrom = *const fn (width: c_int, height: c_int, format: SDL_PixelFormat, pixels: ?*anyopaque, pitch: c_int) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_DestroySurface = *const fn (surface: ?*SDL_Surface) callconv(.c) void;
pub const PFN_SDL_GetSurfaceProperties = *const fn (surface: ?*SDL_Surface) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_SetSurfaceColorspace = *const fn (surface: ?*SDL_Surface, colorspace: render.SDL_Colorspace) callconv(.c) bool;
pub const PFN_SDL_GetSurfaceColorspace = *const fn (surface: ?*SDL_Surface) callconv(.c) c_uint;
pub const PFN_SDL_CreateSurfacePalette = *const fn (surface: ?*SDL_Surface) callconv(.c) ?*SDL_Palette;
pub const PFN_SDL_SetSurfacePalette = *const fn (surface: ?*SDL_Surface, palette: ?*SDL_Palette) callconv(.c) bool;
pub const PFN_SDL_GetSurfacePalette = *const fn (surface: ?*SDL_Surface) callconv(.c) ?*SDL_Palette;
pub const PFN_SDL_AddSurfaceAlternateImage = *const fn (surface: ?*SDL_Surface, image: ?*SDL_Surface) callconv(.c) bool;
pub const PFN_SDL_SurfaceHasAlternateImages = *const fn (surface: ?*SDL_Surface) callconv(.c) bool;
pub const PFN_SDL_GetSurfaceImages = *const fn (surface: ?*SDL_Surface, count: ?*c_int) callconv(.c) ?[*]?*SDL_Surface;
pub const PFN_SDL_RemoveSurfaceAlternateImages = *const fn (surface: ?*SDL_Surface) callconv(.c) void;
pub const PFN_SDL_LockSurface = *const fn (surface: ?*SDL_Surface) callconv(.c) bool;
pub const PFN_SDL_UnlockSurface = *const fn (surface: ?*SDL_Surface) callconv(.c) void;
pub const PFN_SDL_LoadBMP = *const fn (file: ?[*:0]const u8) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_LoadBMP_IO = *const fn (src: ?*SDL_IOStream, closeio: bool) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_SaveBMP = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_SaveBMP_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool;
pub const PFN_SDL_SetSurfaceRLE = *const fn (surface: ?*SDL_Surface, enabled: bool) callconv(.c) bool;
pub const PFN_SDL_SurfaceHasRLE = *const fn (surface: ?*SDL_Surface) callconv(.c) bool;
pub const PFN_SDL_SetSurfaceColorKey = *const fn (surface: ?*SDL_Surface, enabled: bool, key: Uint32) callconv(.c) bool;
pub const PFN_SDL_SurfaceHasColorKey = *const fn (surface: ?*SDL_Surface) callconv(.c) bool;
pub const PFN_SDL_GetSurfaceColorKey = *const fn (surface: ?*SDL_Surface, key: ?*Uint32) callconv(.c) bool;
pub const PFN_SDL_SetSurfaceColorMod = *const fn (surface: ?*SDL_Surface, r: Uint8, g: Uint8, b: Uint8) callconv(.c) bool;
pub const PFN_SDL_GetSurfaceColorMod = *const fn (surface: ?*SDL_Surface, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8) callconv(.c) bool;
pub const PFN_SDL_SetSurfaceAlphaMod = *const fn (surface: ?*SDL_Surface, alpha: Uint8) callconv(.c) bool;
pub const PFN_SDL_GetSurfaceAlphaMod = *const fn (surface: ?*SDL_Surface, alpha: ?*Uint8) callconv(.c) bool;
pub const PFN_SDL_SetSurfaceBlendMode = *const fn (surface: ?*SDL_Surface, blendMode: pixels.SDL_BlendMode) callconv(.c) bool;
pub const PFN_SDL_GetSurfaceBlendMode = *const fn (surface: ?*SDL_Surface, blendMode: ?*pixels.SDL_BlendMode) callconv(.c) bool;
pub const PFN_SDL_SetSurfaceClipRect = *const fn (surface: ?*SDL_Surface, rect: ?*const SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetSurfaceClipRect = *const fn (surface: ?*SDL_Surface, rect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_FlipSurface = *const fn (surface: ?*SDL_Surface, flip: SDL_FlipMode) callconv(.c) bool;
pub const PFN_SDL_DuplicateSurface = *const fn (surface: ?*SDL_Surface) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_ScaleSurface = *const fn (surface: ?*SDL_Surface, width: c_int, height: c_int, scaleMode: c_int) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_ConvertSurface = *const fn (surface: ?*SDL_Surface, format: SDL_PixelFormat) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_ConvertSurfaceAndColorspace = *const fn (surface: ?*SDL_Surface, format: SDL_PixelFormat, palette: ?*SDL_Palette, colorspace: render.SDL_Colorspace, props: core.SDL_PropertiesID) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_PremultiplySurfaceAlpha = *const fn (surface: ?*SDL_Surface, linear: bool) callconv(.c) bool;
pub const PFN_SDL_ClearSurface = *const fn (surface: ?*SDL_Surface, r: f32, g: f32, b: f32, a: f32) callconv(.c) bool;
pub const PFN_SDL_FillSurfaceRect = *const fn (surface: ?*SDL_Surface, rect: ?*const SDL_Rect, color: Uint32) callconv(.c) bool;
pub const PFN_SDL_FillSurfaceRects = *const fn (surface: ?*SDL_Surface, rects: ?[*]const SDL_Rect, count: c_int, color: Uint32) callconv(.c) bool;
pub const PFN_SDL_BlitSurface = *const fn (src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_BlitSurfaceUnchecked = *const fn (src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_BlitSurfaceScaled = *const fn (src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect, scaleMode: c_int) callconv(.c) bool;
pub const PFN_SDL_BlitSurfaceUncheckedScaled = *const fn (src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect, scaleMode: c_int) callconv(.c) bool;
pub const PFN_SDL_BlitSurfaceTiled = *const fn (src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_BlitSurfaceTiledWithScale = *const fn (src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, scale: f32, scaleMode: c_int, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_BlitSurface9Grid = *const fn (src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, left_width: c_int, right_width: c_int, top_height: c_int, bottom_height: c_int, scale: f32, scaleMode: c_int, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_MapSurfaceRGB = *const fn (surface: ?*SDL_Surface, r: Uint8, g: Uint8, b: Uint8) callconv(.c) Uint32;
pub const PFN_SDL_MapSurfaceRGBA = *const fn (surface: ?*SDL_Surface, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) Uint32;
pub const PFN_SDL_ReadSurfacePixel = *const fn (surface: ?*SDL_Surface, x: c_int, y: c_int, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8, a: ?*Uint8) callconv(.c) bool;
pub const PFN_SDL_PremultiplyAlpha = *const fn (width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int, linear: bool) callconv(.c) bool;
pub const PFN_SDL_LoadSurface = *const fn (file: ?[*:0]const u8) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_LoadSurface_IO = *const fn (src: ?*SDL_IOStream, closeio: bool) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_LoadPNG = *const fn (file: ?[*:0]const u8) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_LoadPNG_IO = *const fn (src: ?*SDL_IOStream, closeio: bool) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_SavePNG = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_SavePNG_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool;
pub const PFN_SDL_RotateSurface = *const fn (surface: ?*SDL_Surface, angle: f32) callconv(.c) ?*SDL_Surface;
pub const PFN_SDL_ConvertPixels = *const fn (width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool;
pub const PFN_SDL_StretchSurface = *const fn (src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, dst: ?*SDL_Surface, dstrect: ?*const SDL_Rect, scaleMode: render.SDL_ScaleMode) callconv(.c) bool;
pub const PFN_SDL_ReadSurfacePixelFloat = *const fn (surface: ?*SDL_Surface, x: c_int, y: c_int, r: ?*f32, g: ?*f32, b: ?*f32, a: ?*f32) callconv(.c) bool;
pub const PFN_SDL_WriteSurfacePixel = *const fn (surface: ?*SDL_Surface, x: c_int, y: c_int, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool;
pub const PFN_SDL_WriteSurfacePixelFloat = *const fn (surface: ?*SDL_Surface, x: c_int, y: c_int, r: f32, g: f32, b: f32, a: f32) callconv(.c) bool;

pub const SurfaceFunctions = struct {
    createSurface: PFN_SDL_CreateSurface,
    createSurfaceFrom: PFN_SDL_CreateSurfaceFrom,
    destroySurface: PFN_SDL_DestroySurface,
    getSurfaceProperties: PFN_SDL_GetSurfaceProperties,
    setSurfaceColorspace: PFN_SDL_SetSurfaceColorspace,
    getSurfaceColorspace: PFN_SDL_GetSurfaceColorspace,
    createSurfacePalette: PFN_SDL_CreateSurfacePalette,
    setSurfacePalette: PFN_SDL_SetSurfacePalette,
    getSurfacePalette: PFN_SDL_GetSurfacePalette,
    addSurfaceAlternateImage: PFN_SDL_AddSurfaceAlternateImage,
    surfaceHasAlternateImages: PFN_SDL_SurfaceHasAlternateImages,
    getSurfaceImages: PFN_SDL_GetSurfaceImages,
    removeSurfaceAlternateImages: PFN_SDL_RemoveSurfaceAlternateImages,
    lockSurface: PFN_SDL_LockSurface,
    unlockSurface: PFN_SDL_UnlockSurface,
    loadBMP: PFN_SDL_LoadBMP,
    loadBMP_IO: PFN_SDL_LoadBMP_IO,
    saveBMP: PFN_SDL_SaveBMP,
    saveBMP_IO: PFN_SDL_SaveBMP_IO,
    setSurfaceRLE: PFN_SDL_SetSurfaceRLE,
    surfaceHasRLE: PFN_SDL_SurfaceHasRLE,
    setSurfaceColorKey: PFN_SDL_SetSurfaceColorKey,
    surfaceHasColorKey: PFN_SDL_SurfaceHasColorKey,
    getSurfaceColorKey: PFN_SDL_GetSurfaceColorKey,
    setSurfaceColorMod: PFN_SDL_SetSurfaceColorMod,
    getSurfaceColorMod: PFN_SDL_GetSurfaceColorMod,
    setSurfaceAlphaMod: PFN_SDL_SetSurfaceAlphaMod,
    getSurfaceAlphaMod: PFN_SDL_GetSurfaceAlphaMod,
    setSurfaceBlendMode: PFN_SDL_SetSurfaceBlendMode,
    getSurfaceBlendMode: PFN_SDL_GetSurfaceBlendMode,
    setSurfaceClipRect: PFN_SDL_SetSurfaceClipRect,
    getSurfaceClipRect: PFN_SDL_GetSurfaceClipRect,
    flipSurface: PFN_SDL_FlipSurface,
    duplicateSurface: PFN_SDL_DuplicateSurface,
    scaleSurface: PFN_SDL_ScaleSurface,
    convertSurface: PFN_SDL_ConvertSurface,
    convertSurfaceAndColorspace: PFN_SDL_ConvertSurfaceAndColorspace,
    premultiplySurfaceAlpha: PFN_SDL_PremultiplySurfaceAlpha,
    clearSurface: PFN_SDL_ClearSurface,
    fillSurfaceRect: PFN_SDL_FillSurfaceRect,
    fillSurfaceRects: PFN_SDL_FillSurfaceRects,
    blitSurface: PFN_SDL_BlitSurface,
    blitSurfaceUnchecked: PFN_SDL_BlitSurfaceUnchecked,
    blitSurfaceScaled: PFN_SDL_BlitSurfaceScaled,
    blitSurfaceUncheckedScaled: PFN_SDL_BlitSurfaceUncheckedScaled,
    blitSurfaceTiled: PFN_SDL_BlitSurfaceTiled,
    blitSurfaceTiledWithScale: PFN_SDL_BlitSurfaceTiledWithScale,
    blitSurface9Grid: PFN_SDL_BlitSurface9Grid,
    mapSurfaceRGB: PFN_SDL_MapSurfaceRGB,
    mapSurfaceRGBA: PFN_SDL_MapSurfaceRGBA,
    readSurfacePixel: PFN_SDL_ReadSurfacePixel,
    premultiplyAlpha: PFN_SDL_PremultiplyAlpha,
    loadSurface: PFN_SDL_LoadSurface,
    loadSurface_IO: PFN_SDL_LoadSurface_IO,
    loadPNG: PFN_SDL_LoadPNG,
    loadPNG_IO: PFN_SDL_LoadPNG_IO,
    savePNG: PFN_SDL_SavePNG,
    savePNG_IO: PFN_SDL_SavePNG_IO,
    rotateSurface: PFN_SDL_RotateSurface,
    convertPixels: PFN_SDL_ConvertPixels,
    stretchSurface: PFN_SDL_StretchSurface,
    readSurfacePixelFloat: PFN_SDL_ReadSurfacePixelFloat,
    writeSurfacePixel: PFN_SDL_WriteSurfacePixel,
    writeSurfacePixelFloat: PFN_SDL_WriteSurfacePixelFloat,

    pub fn load(handle: dynamic.LibraryHandle) !SurfaceFunctions {
        return dynamic.loadFunctions(SurfaceFunctions, handle, "SDL_", .{}, &.{});
    }
};
