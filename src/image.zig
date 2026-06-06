// SDL3_image Bindings
// Image loading library

const dynamic = @import("dynamic.zig");
const surface = @import("surface.zig");
const render = @import("render.zig");

// Import types
pub const SDL_Surface = surface.SDL_Surface;
pub const SDL_IOStream = surface.SDL_IOStream;
pub const SDL_Texture = render.SDL_Texture;
pub const SDL_Renderer = render.SDL_Renderer;

// Version constants
pub const SDL_IMAGE_MAJOR_VERSION = 3;
pub const SDL_IMAGE_MINOR_VERSION = 2;
pub const SDL_IMAGE_MICRO_VERSION = 6;

// Animation struct
pub const IMG_Animation = extern struct {
    w: c_int,
    h: c_int,
    count: c_int,
    frames: ?[*]?*SDL_Surface,
    delays: ?[*]c_int,
};

// Version function
pub const PFN_IMG_Version = *const fn () callconv(.c) c_int;

// Loading functions - surface
pub const PFN_IMG_LoadTyped_IO = *const fn (src: ?*SDL_IOStream, closeio: bool, type: ?[*:0]const u8) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_Load = *const fn (file: ?[*:0]const u8) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_Load_IO = *const fn (src: ?*SDL_IOStream, closeio: bool) callconv(.c) ?*SDL_Surface;

// Loading functions - texture
pub const PFN_IMG_LoadTexture = *const fn (renderer: ?*SDL_Renderer, file: ?[*:0]const u8) callconv(.c) ?*SDL_Texture;
pub const PFN_IMG_LoadTexture_IO = *const fn (renderer: ?*SDL_Renderer, src: ?*SDL_IOStream, closeio: bool) callconv(.c) ?*SDL_Texture;
pub const PFN_IMG_LoadTextureTyped_IO = *const fn (renderer: ?*SDL_Renderer, src: ?*SDL_IOStream, closeio: bool, type: ?[*:0]const u8) callconv(.c) ?*SDL_Texture;

// Image detection functions
pub const PFN_IMG_isAVIF = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isICO = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isCUR = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isBMP = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isGIF = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isJPG = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isJXL = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isLBM = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isPCX = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isPNG = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isPNM = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isSVG = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isQOI = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isTIF = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isXCF = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isXPM = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isXV = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;
pub const PFN_IMG_isWEBP = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;

// Individual format loaders
pub const PFN_IMG_LoadAVIF_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadICO_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadCUR_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadBMP_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadGIF_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadJPG_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadJXL_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadLBM_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadPCX_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadPNG_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadPNM_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadSVG_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadQOI_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadTGA_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadTIF_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadXCF_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadXPM_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadXV_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_LoadWEBP_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*SDL_Surface;

// SVG loading
pub const PFN_IMG_LoadSizedSVG_IO = *const fn (src: ?*SDL_IOStream, width: c_int, height: c_int) callconv(.c) ?*SDL_Surface;

// XPM from array
pub const PFN_IMG_ReadXPMFromArray = *const fn (xpm: ?[*]?[*:0]u8) callconv(.c) ?*SDL_Surface;
pub const PFN_IMG_ReadXPMFromArrayToRGB888 = *const fn (xpm: ?[*]?[*:0]u8) callconv(.c) ?*SDL_Surface;

// Save functions
pub const PFN_IMG_SaveAVIF = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8, quality: c_int) callconv(.c) bool;
pub const PFN_IMG_SaveAVIF_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool, quality: c_int) callconv(.c) bool;
pub const PFN_IMG_SavePNG = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_IMG_SavePNG_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool;
pub const PFN_IMG_SaveJPG = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8, quality: c_int) callconv(.c) bool;
pub const PFN_IMG_SaveJPG_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool, quality: c_int) callconv(.c) bool;

// Animation functions
pub const PFN_IMG_LoadAnimation = *const fn (file: ?[*:0]const u8) callconv(.c) ?*IMG_Animation;
pub const PFN_IMG_LoadAnimation_IO = *const fn (src: ?*SDL_IOStream, closeio: bool) callconv(.c) ?*IMG_Animation;
pub const PFN_IMG_LoadAnimationTyped_IO = *const fn (src: ?*SDL_IOStream, closeio: bool, type: ?[*:0]const u8) callconv(.c) ?*IMG_Animation;
pub const PFN_IMG_FreeAnimation = *const fn (anim: ?*IMG_Animation) callconv(.c) void;
pub const PFN_IMG_LoadGIFAnimation_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*IMG_Animation;
pub const PFN_IMG_LoadWEBPAnimation_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*IMG_Animation;

pub const ImageFunctions = struct {
    version: PFN_IMG_Version,
    loadTypedIO: PFN_IMG_LoadTyped_IO,
    load: PFN_IMG_Load,
    loadIO: PFN_IMG_Load_IO,
    loadTexture: PFN_IMG_LoadTexture,
    loadTextureIO: PFN_IMG_LoadTexture_IO,
    loadTextureTypedIO: PFN_IMG_LoadTextureTyped_IO,
    isAVIF: PFN_IMG_isAVIF,
    isICO: PFN_IMG_isICO,
    isCUR: PFN_IMG_isCUR,
    isBMP: PFN_IMG_isBMP,
    isGIF: PFN_IMG_isGIF,
    isJPG: PFN_IMG_isJPG,
    isJXL: PFN_IMG_isJXL,
    isLBM: PFN_IMG_isLBM,
    isPCX: PFN_IMG_isPCX,
    isPNG: PFN_IMG_isPNG,
    isPNM: PFN_IMG_isPNM,
    isSVG: PFN_IMG_isSVG,
    isQOI: PFN_IMG_isQOI,
    isTIF: PFN_IMG_isTIF,
    isXCF: PFN_IMG_isXCF,
    isXPM: PFN_IMG_isXPM,
    isXV: PFN_IMG_isXV,
    isWEBP: PFN_IMG_isWEBP,
    loadAVIFIO: PFN_IMG_LoadAVIF_IO,
    loadICOIO: PFN_IMG_LoadICO_IO,
    loadCURIO: PFN_IMG_LoadCUR_IO,
    loadBMPIO: PFN_IMG_LoadBMP_IO,
    loadGIFIO: PFN_IMG_LoadGIF_IO,
    loadJPGIO: PFN_IMG_LoadJPG_IO,
    loadJXLIO: PFN_IMG_LoadJXL_IO,
    loadLBMIO: PFN_IMG_LoadLBM_IO,
    loadPCXIO: PFN_IMG_LoadPCX_IO,
    loadPNGIO: PFN_IMG_LoadPNG_IO,
    loadPNMIO: PFN_IMG_LoadPNM_IO,
    loadSVGIO: PFN_IMG_LoadSVG_IO,
    loadQOIIO: PFN_IMG_LoadQOI_IO,
    loadTGAIO: PFN_IMG_LoadTGA_IO,
    loadTIFIO: PFN_IMG_LoadTIF_IO,
    loadXCFIOW: PFN_IMG_LoadXCF_IO,
    loadXPMIO: PFN_IMG_LoadXPM_IO,
    loadXVIO: PFN_IMG_LoadXV_IO,
    loadWEBPIO: PFN_IMG_LoadWEBP_IO,
    loadSizedSVGIO: PFN_IMG_LoadSizedSVG_IO,
    readXPMFromArray: PFN_IMG_ReadXPMFromArray,
    readXPMFromArrayToRGB888: PFN_IMG_ReadXPMFromArrayToRGB888,
    saveAVIF: PFN_IMG_SaveAVIF,
    saveAVIFIO: PFN_IMG_SaveAVIF_IO,
    savePNG: PFN_IMG_SavePNG,
    savePNGIO: PFN_IMG_SavePNG_IO,
    saveJPG: PFN_IMG_SaveJPG,
    saveJPGIO: PFN_IMG_SaveJPG_IO,
    loadAnimation: PFN_IMG_LoadAnimation,
    loadAnimationIO: PFN_IMG_LoadAnimation_IO,
    loadAnimationTypedIO: PFN_IMG_LoadAnimationTyped_IO,
    freeAnimation: PFN_IMG_FreeAnimation,
    loadGIFAnimationIO: PFN_IMG_LoadGIFAnimation_IO,
    loadWEBPAnimationIO: PFN_IMG_LoadWEBPAnimation_IO,

    pub fn loadFunctions(handle: dynamic.LibraryHandle) !ImageFunctions {
        return dynamic.loadFunctions(ImageFunctions, handle, "IMG_", .{
            .{ "loadTypedIO", "IMG_LoadTyped_IO" },
            .{ "loadIO", "IMG_Load_IO" },
            .{ "loadTextureIO", "IMG_LoadTexture_IO" },
            .{ "loadTextureTypedIO", "IMG_LoadTextureTyped_IO" },
            .{ "isAVIF", "IMG_isAVIF" },
            .{ "isICO", "IMG_isICO" },
            .{ "isCUR", "IMG_isCUR" },
            .{ "isBMP", "IMG_isBMP" },
            .{ "isGIF", "IMG_isGIF" },
            .{ "isJPG", "IMG_isJPG" },
            .{ "isJXL", "IMG_isJXL" },
            .{ "isLBM", "IMG_isLBM" },
            .{ "isPCX", "IMG_isPCX" },
            .{ "isPNG", "IMG_isPNG" },
            .{ "isPNM", "IMG_isPNM" },
            .{ "isSVG", "IMG_isSVG" },
            .{ "isQOI", "IMG_isQOI" },
            .{ "isTIF", "IMG_isTIF" },
            .{ "isXCF", "IMG_isXCF" },
            .{ "isXPM", "IMG_isXPM" },
            .{ "isXV", "IMG_isXV" },
            .{ "isWEBP", "IMG_isWEBP" },
            .{ "loadAVIFIO", "IMG_LoadAVIF_IO" },
            .{ "loadICOIO", "IMG_LoadICO_IO" },
            .{ "loadCURIO", "IMG_LoadCUR_IO" },
            .{ "loadBMPIO", "IMG_LoadBMP_IO" },
            .{ "loadGIFIO", "IMG_LoadGIF_IO" },
            .{ "loadJPGIO", "IMG_LoadJPG_IO" },
            .{ "loadJXLIO", "IMG_LoadJXL_IO" },
            .{ "loadLBMIO", "IMG_LoadLBM_IO" },
            .{ "loadPCXIO", "IMG_LoadPCX_IO" },
            .{ "loadPNGIO", "IMG_LoadPNG_IO" },
            .{ "loadPNMIO", "IMG_LoadPNM_IO" },
            .{ "loadSVGIO", "IMG_LoadSVG_IO" },
            .{ "loadQOIIO", "IMG_LoadQOI_IO" },
            .{ "loadTGAIO", "IMG_LoadTGA_IO" },
            .{ "loadTIFIO", "IMG_LoadTIF_IO" },
            .{ "loadXCFIOW", "IMG_LoadXCF_IO" },
            .{ "loadXPMIO", "IMG_LoadXPM_IO" },
            .{ "loadXVIO", "IMG_LoadXV_IO" },
            .{ "loadWEBPIO", "IMG_LoadWEBP_IO" },
            .{ "loadSizedSVGIO", "IMG_LoadSizedSVG_IO" },
            .{ "saveAVIFIO", "IMG_SaveAVIF_IO" },
            .{ "savePNGIO", "IMG_SavePNG_IO" },
            .{ "saveJPGIO", "IMG_SaveJPG_IO" },
            .{ "loadAnimationIO", "IMG_LoadAnimation_IO" },
            .{ "loadAnimationTypedIO", "IMG_LoadAnimationTyped_IO" },
            .{ "loadGIFAnimationIO", "IMG_LoadGIFAnimation_IO" },
            .{ "loadWEBPAnimationIO", "IMG_LoadWEBPAnimation_IO" },
        }, &.{});
    }
};
