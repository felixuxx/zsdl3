// SDL3 Surface Bindings
// Software surfaces for drawing

const core = @import("core.zig");
const pixels = @import("pixels.zig");

// Import types
pub const Uint8 = core.Uint8;
pub const Uint32 = core.Uint32;
pub const SDL_PixelFormat = pixels.SDL_PixelFormat;
pub const SDL_Palette = pixels.SDL_Palette;
pub const SDL_Rect = pixels.SDL_Rect;

// Placeholder for SDL_IOStream
pub const SDL_IOStream = opaque {};

// Surface struct
pub const SDL_Surface = extern struct {
    flags: Uint32,
    format: ?*SDL_PixelFormatDetails,
    w: c_int,
    h: c_int,
    pitch: c_int,
    pixels: ?*anyopaque,
    refcount: c_int,
    locked: c_int,
    lock_data: ?*anyopaque,
    clip_rect: SDL_Rect,
    map: ?*anyopaque,
    ref: ?*anyopaque,
    internal: ?*anyopaque,
};

// Placeholder for pixel format details
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

// Surface functions
extern fn SDL_CreateSurface(width: c_int, height: c_int, format: SDL_PixelFormat) ?*SDL_Surface;
extern fn SDL_CreateSurfaceFrom(pixels: ?*anyopaque, width: c_int, height: c_int, pitch: c_int, format: SDL_PixelFormat) ?*SDL_Surface;
extern fn SDL_DestroySurface(surface: ?*SDL_Surface) void;
extern fn SDL_GetSurfaceProperties(surface: ?*SDL_Surface) core.SDL_PropertiesID;
extern fn SDL_SetSurfaceColorspace(surface: ?*SDL_Surface, colorspace: c_uint) bool;
extern fn SDL_GetSurfaceColorspace(surface: ?*SDL_Surface) c_uint;
extern fn SDL_CreateSurfacePalette(surface: ?*SDL_Surface) ?*SDL_Palette;
extern fn SDL_SetSurfacePalette(surface: ?*SDL_Surface, palette: ?*SDL_Palette) bool;
extern fn SDL_GetSurfacePalette(surface: ?*SDL_Surface) ?*SDL_Palette;
extern fn SDL_AddSurfaceAlternateImage(surface: ?*SDL_Surface, image: ?*SDL_Surface) bool;
extern fn SDL_SurfaceHasAlternateImages(surface: ?*SDL_Surface) bool;
extern fn SDL_GetSurfaceImages(surface: ?*SDL_Surface, count: ?*c_int) ?[*]?*SDL_Surface;
extern fn SDL_RemoveSurfaceAlternateImages(surface: ?*SDL_Surface) void;
extern fn SDL_LockSurface(surface: ?*SDL_Surface) bool;
extern fn SDL_UnlockSurface(surface: ?*SDL_Surface) void;
extern fn SDL_LoadBMP(file: ?[*:0]const u8) ?*SDL_Surface;
extern fn SDL_LoadBMP_IO(src: ?*SDL_IOStream, closeio: bool) ?*SDL_Surface;
extern fn SDL_SaveBMP(surface: ?*SDL_Surface, file: ?[*:0]const u8) bool;
extern fn SDL_SaveBMP_IO(surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) bool;
extern fn SDL_SetSurfaceRLE(surface: ?*SDL_Surface, enabled: bool) bool;
extern fn SDL_SurfaceHasRLE(surface: ?*SDL_Surface) bool;
extern fn SDL_SetSurfaceColorKey(surface: ?*SDL_Surface, enabled: bool, key: Uint32) bool;
extern fn SDL_SurfaceHasColorKey(surface: ?*SDL_Surface) bool;
extern fn SDL_GetSurfaceColorKey(surface: ?*SDL_Surface, key: ?*Uint32) bool;
extern fn SDL_SetSurfaceColorMod(surface: ?*SDL_Surface, r: Uint8, g: Uint8, b: Uint8) bool;
extern fn SDL_GetSurfaceColorMod(surface: ?*SDL_Surface, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8) bool;
extern fn SDL_SetSurfaceAlphaMod(surface: ?*SDL_Surface, alpha: Uint8) bool;
extern fn SDL_GetSurfaceAlphaMod(surface: ?*SDL_Surface, alpha: ?*Uint8) bool;
extern fn SDL_SetSurfaceBlendMode(surface: ?*SDL_Surface, blendMode: pixels.SDL_BlendMode) bool;
extern fn SDL_GetSurfaceBlendMode(surface: ?*SDL_Surface, blendMode: ?*pixels.SDL_BlendMode) bool;
extern fn SDL_SetSurfaceClipRect(surface: ?*SDL_Surface, rect: ?*const SDL_Rect) bool;
extern fn SDL_GetSurfaceClipRect(surface: ?*SDL_Surface, rect: ?*SDL_Rect) bool;
extern fn SDL_FlipSurface(surface: ?*SDL_Surface, flip: c_int) bool;
extern fn SDL_DuplicateSurface(surface: ?*SDL_Surface) ?*SDL_Surface;
extern fn SDL_ScaleSurface(surface: ?*SDL_Surface, width: c_int, height: c_int, scaleMode: c_int) ?*SDL_Surface;
extern fn SDL_ConvertSurface(surface: ?*SDL_Surface, format: SDL_PixelFormat) ?*SDL_Surface;
extern fn SDL_ConvertSurfaceAndColorspace(surface: ?*SDL_Surface, format: SDL_PixelFormat, colorspace: c_uint, props: core.SDL_PropertiesID) ?*SDL_Surface;
extern fn SDL_PremultiplyAlpha(surface: ?*SDL_Surface, linear: bool) bool;
extern fn SDL_ClearSurface(surface: ?*SDL_Surface, r: f32, g: f32, b: f32, a: f32) bool;
extern fn SDL_FillSurfaceRect(surface: ?*SDL_Surface, rect: ?*const SDL_Rect, color: Uint32) bool;
extern fn SDL_FillSurfaceRects(surface: ?*SDL_Surface, rects: ?[*]const SDL_Rect, count: c_int, color: Uint32) bool;
extern fn SDL_BlitSurface(src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect) bool;
extern fn SDL_BlitSurfaceUnchecked(src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect) bool;
extern fn SDL_BlitSurfaceScaled(src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect, scaleMode: c_int) bool;
extern fn SDL_BlitSurfaceUncheckedScaled(src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect, scaleMode: c_int) bool;
extern fn SDL_BlitSurfaceTiled(src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect) bool;
extern fn SDL_BlitSurfaceTiledWithScale(src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, scale: f32, scaleMode: c_int, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect) bool;
extern fn SDL_BlitSurface9Grid(src: ?*SDL_Surface, srcrect: ?*const SDL_Rect, left_width: c_int, right_width: c_int, top_height: c_int, bottom_height: c_int, scale: f32, scaleMode: c_int, dst: ?*SDL_Surface, dstrect: ?*SDL_Rect) bool;
extern fn SDL_MapSurfaceRGB(surface: ?*SDL_Surface, r: Uint8, g: Uint8, b: Uint8) Uint32;
extern fn SDL_MapSurfaceRGBA(surface: ?*SDL_Surface, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32;
extern fn SDL_ReadSurfacePixel(surface: ?*SDL_Surface, x: c_int, y: c_int, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8, a: ?*Uint8) bool;

// Public API
pub const createSurface = SDL_CreateSurface;
pub const createSurfaceFrom = SDL_CreateSurfaceFrom;
pub const destroySurface = SDL_DestroySurface;
pub const getSurfaceProperties = SDL_GetSurfaceProperties;
pub const setSurfaceColorspace = SDL_SetSurfaceColorspace;
pub const getSurfaceColorspace = SDL_GetSurfaceColorspace;
pub const createSurfacePalette = SDL_CreateSurfacePalette;
pub const setSurfacePalette = SDL_SetSurfacePalette;
pub const getSurfacePalette = SDL_GetSurfacePalette;
pub const addSurfaceAlternateImage = SDL_AddSurfaceAlternateImage;
pub const surfaceHasAlternateImages = SDL_SurfaceHasAlternateImages;
pub const getSurfaceImages = SDL_GetSurfaceImages;
pub const removeSurfaceAlternateImages = SDL_RemoveSurfaceAlternateImages;
pub const lockSurface = SDL_LockSurface;
pub const unlockSurface = SDL_UnlockSurface;
pub const loadBMP = SDL_LoadBMP;
pub const loadBMP_IO = SDL_LoadBMP_IO;
pub const saveBMP = SDL_SaveBMP;
pub const saveBMP_IO = SDL_SaveBMP_IO;
pub const setSurfaceRLE = SDL_SetSurfaceRLE;
pub const surfaceHasRLE = SDL_SurfaceHasRLE;
pub const setSurfaceColorKey = SDL_SetSurfaceColorKey;
pub const surfaceHasColorKey = SDL_SurfaceHasColorKey;
pub const getSurfaceColorKey = SDL_GetSurfaceColorKey;
pub const setSurfaceColorMod = SDL_SetSurfaceColorMod;
pub const getSurfaceColorMod = SDL_GetSurfaceColorMod;
pub const setSurfaceAlphaMod = SDL_SetSurfaceAlphaMod;
pub const getSurfaceAlphaMod = SDL_GetSurfaceAlphaMod;
pub const setSurfaceBlendMode = SDL_SetSurfaceBlendMode;
pub const getSurfaceBlendMode = SDL_GetSurfaceBlendMode;
pub const setSurfaceClipRect = SDL_SetSurfaceClipRect;
pub const getSurfaceClipRect = SDL_GetSurfaceClipRect;
pub const flipSurface = SDL_FlipSurface;
pub const duplicateSurface = SDL_DuplicateSurface;
pub const scaleSurface = SDL_ScaleSurface;
pub const convertSurface = SDL_ConvertSurface;
pub const convertSurfaceAndColorspace = SDL_ConvertSurfaceAndColorspace;
pub const premultiplyAlpha = SDL_PremultiplyAlpha;
pub const clearSurface = SDL_ClearSurface;
pub const fillSurfaceRect = SDL_FillSurfaceRect;
pub const fillSurfaceRects = SDL_FillSurfaceRects;
pub const blitSurface = SDL_BlitSurface;
pub const blitSurfaceUnchecked = SDL_BlitSurfaceUnchecked;
pub const blitSurfaceScaled = SDL_BlitSurfaceScaled;
pub const blitSurfaceUncheckedScaled = SDL_BlitSurfaceUncheckedScaled;
pub const blitSurfaceTiled = SDL_BlitSurfaceTiled;
pub const blitSurfaceTiledWithScale = SDL_BlitSurfaceTiledWithScale;
pub const blitSurface9Grid = SDL_BlitSurface9Grid;
pub const mapSurfaceRGB = SDL_MapSurfaceRGB;
pub const mapSurfaceRGBA = SDL_MapSurfaceRGBA;
pub const readSurfacePixel = SDL_ReadSurfacePixel;
