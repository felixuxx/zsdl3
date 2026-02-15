// SDL3_image Bindings
// Image loading library

const core = @import("core.zig");
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
extern fn IMG_Version() c_int;

// Loading functions - surface
extern fn IMG_LoadTyped_IO(src: ?*SDL_IOStream, closeio: bool, type: ?[*:0]const u8) ?*SDL_Surface;
extern fn IMG_Load(file: ?[*:0]const u8) ?*SDL_Surface;
extern fn IMG_Load_IO(src: ?*SDL_IOStream, closeio: bool) ?*SDL_Surface;

// Loading functions - texture
extern fn IMG_LoadTexture(renderer: ?*SDL_Renderer, file: ?[*:0]const u8) ?*SDL_Texture;
extern fn IMG_LoadTexture_IO(renderer: ?*SDL_Renderer, src: ?*SDL_IOStream, closeio: bool) ?*SDL_Texture;
extern fn IMG_LoadTextureTyped_IO(renderer: ?*SDL_Renderer, src: ?*SDL_IOStream, closeio: bool, type: ?[*:0]const u8) ?*SDL_Texture;

// Image detection functions
extern fn IMG_isAVIF(src: ?*SDL_IOStream) bool;
extern fn IMG_isICO(src: ?*SDL_IOStream) bool;
extern fn IMG_isCUR(src: ?*SDL_IOStream) bool;
extern fn IMG_isBMP(src: ?*SDL_IOStream) bool;
extern fn IMG_isGIF(src: ?*SDL_IOStream) bool;
extern fn IMG_isJPG(src: ?*SDL_IOStream) bool;
extern fn IMG_isJXL(src: ?*SDL_IOStream) bool;
extern fn IMG_isLBM(src: ?*SDL_IOStream) bool;
extern fn IMG_isPCX(src: ?*SDL_IOStream) bool;
extern fn IMG_isPNG(src: ?*SDL_IOStream) bool;
extern fn IMG_isPNM(src: ?*SDL_IOStream) bool;
extern fn IMG_isSVG(src: ?*SDL_IOStream) bool;
extern fn IMG_isQOI(src: ?*SDL_IOStream) bool;
extern fn IMG_isTIF(src: ?*SDL_IOStream) bool;
extern fn IMG_isXCF(src: ?*SDL_IOStream) bool;
extern fn IMG_isXPM(src: ?*SDL_IOStream) bool;
extern fn IMG_isXV(src: ?*SDL_IOStream) bool;
extern fn IMG_isWEBP(src: ?*SDL_IOStream) bool;

// Individual format loaders
extern fn IMG_LoadAVIF_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadICO_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadCUR_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadBMP_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadGIF_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadJPG_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadJXL_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadLBM_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadPCX_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadPNG_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadPNM_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadSVG_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadQOI_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadTGA_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadTIF_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadXCF_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadXPM_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadXV_IO(src: ?*SDL_IOStream) ?*SDL_Surface;
extern fn IMG_LoadWEBP_IO(src: ?*SDL_IOStream) ?*SDL_Surface;

// SVG loading
extern fn IMG_LoadSizedSVG_IO(src: ?*SDL_IOStream, width: c_int, height: c_int) ?*SDL_Surface;

// XPM from array
extern fn IMG_ReadXPMFromArray(xpm: ?[*]?[*:0]u8) ?*SDL_Surface;
extern fn IMG_ReadXPMFromArrayToRGB888(xpm: ?[*]?[*:0]u8) ?*SDL_Surface;

// Save functions
extern fn IMG_SaveAVIF(surface: ?*SDL_Surface, file: ?[*:0]const u8, quality: c_int) bool;
extern fn IMG_SaveAVIF_IO(surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool, quality: c_int) bool;
extern fn IMG_SavePNG(surface: ?*SDL_Surface, file: ?[*:0]const u8) bool;
extern fn IMG_SavePNG_IO(surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) bool;
extern fn IMG_SaveJPG(surface: ?*SDL_Surface, file: ?[*:0]const u8, quality: c_int) bool;
extern fn IMG_SaveJPG_IO(surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool, quality: c_int) bool;

// Animation functions
extern fn IMG_LoadAnimation(file: ?[*:0]const u8) ?*IMG_Animation;
extern fn IMG_LoadAnimation_IO(src: ?*SDL_IOStream, closeio: bool) ?*IMG_Animation;
extern fn IMG_LoadAnimationTyped_IO(src: ?*SDL_IOStream, closeio: bool, type: ?[*:0]const u8) ?*IMG_Animation;
extern fn IMG_FreeAnimation(anim: ?*IMG_Animation) void;
extern fn IMG_LoadGIFAnimation_IO(src: ?*SDL_IOStream) ?*IMG_Animation;
extern fn IMG_LoadWEBPAnimation_IO(src: ?*SDL_IOStream) ?*IMG_Animation;

// Public API
pub const version = IMG_Version;
pub const loadTypedIO = IMG_LoadTyped_IO;
pub const load = IMG_Load;
pub const loadIO = IMG_Load_IO;
pub const loadTexture = IMG_LoadTexture;
pub const loadTextureIO = IMG_LoadTexture_IO;
pub const loadTextureTypedIO = IMG_LoadTextureTyped_IO;
pub const isAVIF = IMG_isAVIF;
pub const isICO = IMG_isICO;
pub const isCUR = IMG_isCUR;
pub const isBMP = IMG_isBMP;
pub const isGIF = IMG_isGIF;
pub const isJPG = IMG_isJPG;
pub const isJXL = IMG_isJXL;
pub const isLBM = IMG_isLBM;
pub const isPCX = IMG_isPCX;
pub const isPNG = IMG_isPNG;
pub const isPNM = IMG_isPNM;
pub const isSVG = IMG_isSVG;
pub const isQOI = IMG_isQOI;
pub const isTIF = IMG_isTIF;
pub const isXCF = IMG_isXCF;
pub const isXPM = IMG_isXPM;
pub const isXV = IMG_isXV;
pub const isWEBP = IMG_isWEBP;
pub const loadAVIFIO = IMG_LoadAVIF_IO;
pub const loadICOIO = IMG_LoadICO_IO;
pub const loadCURIO = IMG_LoadCUR_IO;
pub const loadBMPIO = IMG_LoadBMP_IO;
pub const loadGIFIO = IMG_LoadGIF_IO;
pub const loadJPGIO = IMG_LoadJPG_IO;
pub const loadJXLIO = IMG_LoadJXL_IO;
pub const loadLBMIO = IMG_LoadLBM_IO;
pub const loadPCXIO = IMG_LoadPCX_IO;
pub const loadPNGIO = IMG_LoadPNG_IO;
pub const loadPNMIO = IMG_LoadPNM_IO;
pub const loadSVGIO = IMG_LoadSVG_IO;
pub const loadQOIIO = IMG_LoadQOI_IO;
pub const loadTGAIO = IMG_LoadTGA_IO;
pub const loadTIFIO = IMG_LoadTIF_IO;
pub const loadXCFIOW = IMG_LoadXCF_IO;
pub const loadXPMIO = IMG_LoadXPM_IO;
pub const loadXVIO = IMG_LoadXV_IO;
pub const loadWEBPIO = IMG_LoadWEBP_IO;
pub const loadSizedSVGIO = IMG_LoadSizedSVG_IO;
pub const readXPMFromArray = IMG_ReadXPMFromArray;
pub const readXPMFromArrayToRGB888 = IMG_ReadXPMFromArrayToRGB888;
pub const saveAVIF = IMG_SaveAVIF;
pub const saveAVIFIO = IMG_SaveAVIF_IO;
pub const savePNG = IMG_SavePNG;
pub const savePNGIO = IMG_SavePNG_IO;
pub const saveJPG = IMG_SaveJPG;
pub const saveJPGIO = IMG_SaveJPG_IO;
pub const loadAnimation = IMG_LoadAnimation;
pub const loadAnimationIO = IMG_LoadAnimation_IO;
pub const loadAnimationTypedIO = IMG_LoadAnimationTyped_IO;
pub const freeAnimation = IMG_FreeAnimation;
pub const loadGIFAnimationIO = IMG_LoadGIFAnimation_IO;
pub const loadWEBPAnimationIO = IMG_LoadWEBPAnimation_IO;
