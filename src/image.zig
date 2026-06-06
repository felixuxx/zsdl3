// SDL3_image Bindings
// Image loading library

const dynamic = @import("dynamic.zig");
const surface = @import("surface.zig");
const render = @import("render.zig");
const gpu = @import("gpu.zig");
const video = @import("video.zig");
const core = @import("core.zig");

// Import types
pub const SDL_Surface = surface.SDL_Surface;
pub const SDL_IOStream = surface.SDL_IOStream;
pub const SDL_Texture = render.SDL_Texture;
pub const SDL_Renderer = render.SDL_Renderer;
pub const SDL_GPUTexture = gpu.SDL_GPUTexture;
pub const SDL_GPUDevice = gpu.SDL_GPUDevice;
pub const SDL_GPUCopyPass = gpu.SDL_GPUCopyPass;
pub const SDL_Cursor = video.SDL_Cursor;
pub const SDL_PropertiesID = core.SDL_PropertiesID;

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

// Animation decoder/encoder types
pub const IMG_AnimationDecoder = opaque {};
pub const IMG_AnimationEncoder = opaque {};

pub const IMG_AnimationDecoderStatus = enum(c_int) {
    IMG_DECODER_STATUS_INVALID = -1,
    IMG_DECODER_STATUS_OK,
    IMG_DECODER_STATUS_FAILED,
    IMG_DECODER_STATUS_COMPLETE,
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
pub const PFN_IMG_LoadANIAnimation_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*IMG_Animation;
pub const PFN_IMG_LoadAPNGAnimation_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*IMG_Animation;
pub const PFN_IMG_LoadAVIFAnimation_IO = *const fn (src: ?*SDL_IOStream) callconv(.c) ?*IMG_Animation;

// Save functions
pub const PFN_IMG_Save = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_IMG_SaveBMP = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_IMG_SaveBMP_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool;
pub const PFN_IMG_SaveCUR = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_IMG_SaveCUR_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool;
pub const PFN_IMG_SaveGIF = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_IMG_SaveGIF_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool;
pub const PFN_IMG_SaveICO = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_IMG_SaveICO_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool;
pub const PFN_IMG_SaveTGA = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_IMG_SaveTGA_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool;
pub const PFN_IMG_SaveWEBP = *const fn (surface: ?*SDL_Surface, file: ?[*:0]const u8, quality: f32) callconv(.c) bool;
pub const PFN_IMG_SaveWEBP_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool, quality: f32) callconv(.c) bool;
pub const PFN_IMG_SaveTyped_IO = *const fn (surface: ?*SDL_Surface, dst: ?*SDL_IOStream, closeio: bool, type: ?[*:0]const u8) callconv(.c) bool;

// Animated cursor
pub const PFN_IMG_CreateAnimatedCursor = *const fn (anim: ?*IMG_Animation, hot_x: c_int, hot_y: c_int) callconv(.c) ?*SDL_Cursor;

// Image detection
pub const PFN_IMG_isANI = *const fn (src: ?*SDL_IOStream) callconv(.c) bool;

// Animation encoder functions
pub const PFN_IMG_CreateAnimationEncoder = *const fn (file: ?[*:0]const u8) callconv(.c) ?*IMG_AnimationEncoder;
pub const PFN_IMG_CreateAnimationEncoder_IO = *const fn (dst: ?*SDL_IOStream, closeio: bool, type: ?[*:0]const u8) callconv(.c) ?*IMG_AnimationEncoder;
pub const PFN_IMG_CreateAnimationEncoderWithProperties = *const fn (props: SDL_PropertiesID) callconv(.c) ?*IMG_AnimationEncoder;
pub const PFN_IMG_CloseAnimationEncoder = *const fn (encoder: ?*IMG_AnimationEncoder) callconv(.c) bool;
pub const PFN_IMG_AddAnimationEncoderFrame = *const fn (encoder: ?*IMG_AnimationEncoder, surface: ?*SDL_Surface, duration: core.Uint64) callconv(.c) bool;

// Animation decoder functions
pub const PFN_IMG_CreateAnimationDecoder = *const fn (file: ?[*:0]const u8) callconv(.c) ?*IMG_AnimationDecoder;
pub const PFN_IMG_CreateAnimationDecoder_IO = *const fn (src: ?*SDL_IOStream, closeio: bool, type: ?[*:0]const u8) callconv(.c) ?*IMG_AnimationDecoder;
pub const PFN_IMG_CreateAnimationDecoderWithProperties = *const fn (props: SDL_PropertiesID) callconv(.c) ?*IMG_AnimationDecoder;
pub const PFN_IMG_CloseAnimationDecoder = *const fn (decoder: ?*IMG_AnimationDecoder) callconv(.c) bool;
pub const PFN_IMG_GetAnimationDecoderFrame = *const fn (decoder: ?*IMG_AnimationDecoder, frame: ?*?*SDL_Surface, duration: ?*core.Uint64) callconv(.c) bool;
pub const PFN_IMG_GetAnimationDecoderProperties = *const fn (decoder: ?*IMG_AnimationDecoder) callconv(.c) SDL_PropertiesID;
pub const PFN_IMG_GetAnimationDecoderStatus = *const fn (decoder: ?*IMG_AnimationDecoder) callconv(.c) IMG_AnimationDecoderStatus;
pub const PFN_IMG_ResetAnimationDecoder = *const fn (decoder: ?*IMG_AnimationDecoder) callconv(.c) bool;

// Animation save functions
pub const PFN_IMG_SaveAnimation = *const fn (anim: ?*IMG_Animation, file: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_IMG_SaveAnimationTyped_IO = *const fn (anim: ?*IMG_Animation, dst: ?*SDL_IOStream, closeio: bool, type: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_IMG_SaveANIAnimation_IO = *const fn (anim: ?*IMG_Animation, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool;
pub const PFN_IMG_SaveAPNGAnimation_IO = *const fn (anim: ?*IMG_Animation, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool;
pub const PFN_IMG_SaveAVIFAnimation_IO = *const fn (anim: ?*IMG_Animation, dst: ?*SDL_IOStream, closeio: bool, quality: c_int) callconv(.c) bool;
pub const PFN_IMG_SaveGIFAnimation_IO = *const fn (anim: ?*IMG_Animation, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool;
pub const PFN_IMG_SaveWEBPAnimation_IO = *const fn (anim: ?*IMG_Animation, dst: ?*SDL_IOStream, closeio: bool, quality: c_int) callconv(.c) bool;

// GPU texture loading
pub const PFN_IMG_LoadGPUTexture = *const fn (device: ?*SDL_GPUDevice, copy_pass: ?*SDL_GPUCopyPass, file: ?[*:0]const u8, width: ?*c_int, height: ?*c_int) callconv(.c) ?*SDL_GPUTexture;
pub const PFN_IMG_LoadGPUTexture_IO = *const fn (device: ?*SDL_GPUDevice, copy_pass: ?*SDL_GPUCopyPass, src: ?*SDL_IOStream, closeio: bool, width: ?*c_int, height: ?*c_int) callconv(.c) ?*SDL_GPUTexture;
pub const PFN_IMG_LoadGPUTextureTyped_IO = *const fn (device: ?*SDL_GPUDevice, copy_pass: ?*SDL_GPUCopyPass, src: ?*SDL_IOStream, closeio: bool, type: ?[*:0]const u8, width: ?*c_int, height: ?*c_int) callconv(.c) ?*SDL_GPUTexture;

// Clipboard
pub const PFN_IMG_GetClipboardImage = *const fn () callconv(.c) ?*SDL_Surface;

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
    loadANIAnimationIO: PFN_IMG_LoadANIAnimation_IO,
    loadAPNGAnimationIO: PFN_IMG_LoadAPNGAnimation_IO,
    loadAVIFAnimationIO: PFN_IMG_LoadAVIFAnimation_IO,
    save: PFN_IMG_Save,
    saveBMP: PFN_IMG_SaveBMP,
    saveBMPIO: PFN_IMG_SaveBMP_IO,
    saveCUR: PFN_IMG_SaveCUR,
    saveCURIO: PFN_IMG_SaveCUR_IO,
    saveGIF: PFN_IMG_SaveGIF,
    saveGIFIO: PFN_IMG_SaveGIF_IO,
    saveICO: PFN_IMG_SaveICO,
    saveICOIO: PFN_IMG_SaveICO_IO,
    saveTGA: PFN_IMG_SaveTGA,
    saveTGAIO: PFN_IMG_SaveTGA_IO,
    saveWEBP: PFN_IMG_SaveWEBP,
    saveWEBPIO: PFN_IMG_SaveWEBP_IO,
    saveTypedIO: PFN_IMG_SaveTyped_IO,
    createAnimatedCursor: PFN_IMG_CreateAnimatedCursor,
    isANI: PFN_IMG_isANI,
    createAnimationEncoder: PFN_IMG_CreateAnimationEncoder,
    createAnimationEncoderIO: PFN_IMG_CreateAnimationEncoder_IO,
    createAnimationEncoderWithProperties: PFN_IMG_CreateAnimationEncoderWithProperties,
    closeAnimationEncoder: PFN_IMG_CloseAnimationEncoder,
    addAnimationEncoderFrame: PFN_IMG_AddAnimationEncoderFrame,
    createAnimationDecoder: PFN_IMG_CreateAnimationDecoder,
    createAnimationDecoderIO: PFN_IMG_CreateAnimationDecoder_IO,
    createAnimationDecoderWithProperties: PFN_IMG_CreateAnimationDecoderWithProperties,
    closeAnimationDecoder: PFN_IMG_CloseAnimationDecoder,
    getAnimationDecoderFrame: PFN_IMG_GetAnimationDecoderFrame,
    getAnimationDecoderProperties: PFN_IMG_GetAnimationDecoderProperties,
    getAnimationDecoderStatus: PFN_IMG_GetAnimationDecoderStatus,
    resetAnimationDecoder: PFN_IMG_ResetAnimationDecoder,
    saveAnimation: PFN_IMG_SaveAnimation,
    saveAnimationTypedIO: PFN_IMG_SaveAnimationTyped_IO,
    saveANIAnimationIO: PFN_IMG_SaveANIAnimation_IO,
    saveAPNGAnimationIO: PFN_IMG_SaveAPNGAnimation_IO,
    saveAVIFAnimationIO: PFN_IMG_SaveAVIFAnimation_IO,
    saveGIFAnimationIO: PFN_IMG_SaveGIFAnimation_IO,
    saveWEBPAnimationIO: PFN_IMG_SaveWEBPAnimation_IO,
    loadGPUTexture: PFN_IMG_LoadGPUTexture,
    loadGPUTextureIO: PFN_IMG_LoadGPUTexture_IO,
    loadGPUTextureTypedIO: PFN_IMG_LoadGPUTextureTyped_IO,
    getClipboardImage: PFN_IMG_GetClipboardImage,

    pub fn loadFunctions(handle: dynamic.LibraryHandle) !ImageFunctions {
        return dynamic.loadFunctions(ImageFunctions, handle, "IMG_", .{
            .{ "loadTypedIO", "IMG_LoadTyped_IO" },
            .{ "loadIO", "IMG_Load_IO" },
            .{ "loadTextureIO", "IMG_LoadTexture_IO" },
            .{ "loadTextureTypedIO", "IMG_LoadTextureTyped_IO" },
            .{ "isANI", "IMG_isANI" },
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
            .{ "loadANIAnimationIO", "IMG_LoadANIAnimation_IO" },
            .{ "loadAPNGAnimationIO", "IMG_LoadAPNGAnimation_IO" },
            .{ "loadAVIFAnimationIO", "IMG_LoadAVIFAnimation_IO" },
            .{ "saveBMPIO", "IMG_SaveBMP_IO" },
            .{ "saveCURIO", "IMG_SaveCUR_IO" },
            .{ "saveGIFIO", "IMG_SaveGIF_IO" },
            .{ "saveICOIO", "IMG_SaveICO_IO" },
            .{ "saveTGAIO", "IMG_SaveTGA_IO" },
            .{ "saveWEBPIO", "IMG_SaveWEBP_IO" },
            .{ "saveTypedIO", "IMG_SaveTyped_IO" },
            .{ "createAnimationEncoderIO", "IMG_CreateAnimationEncoder_IO" },
            .{ "createAnimationDecoderIO", "IMG_CreateAnimationDecoder_IO" },
            .{ "saveAnimationTypedIO", "IMG_SaveAnimationTyped_IO" },
            .{ "saveANIAnimationIO", "IMG_SaveANIAnimation_IO" },
            .{ "saveAPNGAnimationIO", "IMG_SaveAPNGAnimation_IO" },
            .{ "saveAVIFAnimationIO", "IMG_SaveAVIFAnimation_IO" },
            .{ "saveGIFAnimationIO", "IMG_SaveGIFAnimation_IO" },
            .{ "saveWEBPAnimationIO", "IMG_SaveWEBPAnimation_IO" },
            .{ "loadGPUTextureIO", "IMG_LoadGPUTexture_IO" },
            .{ "loadGPUTextureTypedIO", "IMG_LoadGPUTextureTyped_IO" },
        }, &.{});
    }
};
