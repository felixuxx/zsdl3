// SDL3 Render Bindings
// 2D accelerated rendering

const core = @import("core.zig");
pub const Uint32 = core.Uint32;
pub const Sint64 = core.Sint64;
const pixels = @import("pixels.zig");
pub const SDL_PixelFormat = pixels.SDL_PixelFormat;
pub const SDL_BlendMode = pixels.SDL_BlendMode;
pub const SDL_Rect = pixels.SDL_Rect;
pub const SDL_FRect = pixels.SDL_FRect;
pub const SDL_FPoint = pixels.SDL_FPoint;
const surface = @import("surface.zig");
pub const SDL_FlipMode = surface.SDL_FlipMode;
const video = @import("video.zig");
const dynamic = @import("dynamic.zig");

// Import types
// Render structs
pub const SDL_Renderer = opaque {};
pub const SDL_Texture = opaque {};
pub const SDL_GPURenderState = opaque {};
pub const SDL_Vertex = extern struct {
    position: pixels.SDL_FPoint,
    color: SDL_FColor,
    tex_coord: pixels.SDL_FPoint,
};

// Color struct
pub const SDL_FColor = extern struct {
    r: f32,
    g: f32,
    b: f32,
    a: f32,
};

// Scale mode
pub const SDL_ScaleMode = enum(c_int) {
    SDL_SCALEMODE_INVALID = -1,
    SDL_SCALEMODE_NEAREST,
    SDL_SCALEMODE_LINEAR,
    SDL_SCALEMODE_PIXELART, // Available since SDL 3.4.0
};

// Logical presentation
pub const SDL_RendererLogicalPresentation = enum(c_int) {
    SDL_LOGICAL_PRESENTATION_DISABLED,
    SDL_LOGICAL_PRESENTATION_STRETCH,
    SDL_LOGICAL_PRESENTATION_LETTERBOX,
    SDL_LOGICAL_PRESENTATION_OVERSCAN,
    SDL_LOGICAL_PRESENTATION_INTEGER_SCALE,
};

// Texture access mode
pub const SDL_TextureAccess = enum(c_int) {
    SDL_TEXTUREACCESS_STATIC = 0,
    SDL_TEXTUREACCESS_STREAMING = 1,
    SDL_TEXTUREACCESS_TARGET = 2,
};

// Texture address mode
pub const SDL_TextureAddressMode = enum(c_int) {
    SDL_TEXTURE_ADDRESS_INVALID = -1,
    SDL_TEXTURE_ADDRESS_AUTO,
    SDL_TEXTURE_ADDRESS_CLAMP,
    SDL_TEXTURE_ADDRESS_WRAP,
};

pub const SDL_Colorspace = pixels.SDL_Colorspace;

// Renderer flags
pub const SDL_RENDERER_SOFTWARE: Uint32 = 0x00000001;
pub const SDL_RENDERER_ACCELERATED: Uint32 = 0x00000002;
pub const SDL_RENDERER_PRESENTVSYNC: Uint32 = 0x00000004;
pub const SDL_RENDERER_TARGETTEXTURE: Uint32 = 0x00000008;

// Texture access constants
pub const SDL_TEXTUREACCESS_STATIC: c_int = 0;
pub const SDL_TEXTUREACCESS_STREAMING: c_int = 1;
pub const SDL_TEXTUREACCESS_TARGET: c_int = 2;

// Texture creation property constants
pub const SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER = "format";
pub const SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER = "access";
pub const SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER = "width";
pub const SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER = "height";
pub const SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER = "colorspace";

// Render functions
pub const PFN_SDL_CreateRenderer = *const fn (window: ?*video.SDL_Window, name: ?[*:0]const u8) callconv(.c) ?*SDL_Renderer;
pub const PFN_SDL_CreateRendererWithProperties = *const fn (props: core.SDL_PropertiesID) callconv(.c) ?*SDL_Renderer;
pub const PFN_SDL_CreateGPURenderer = *const fn (device: ?*anyopaque, window: ?*video.SDL_Window) callconv(.c) ?*SDL_Renderer; // SDL_GPUDevice* - available since SDL 3.4.0
pub const PFN_SDL_GetGPURendererDevice = *const fn (renderer: ?*SDL_Renderer) callconv(.c) ?*anyopaque; // Returns SDL_GPUDevice* - available since SDL 3.4.0
pub const PFN_SDL_CreateSoftwareRenderer = *const fn (surface: ?*video.SDL_Surface) callconv(.c) ?*SDL_Renderer;
pub const PFN_SDL_CreateWindowAndRenderer = *const fn (title: ?[*:0]const u8, width: c_int, height: c_int, window_flags: video.SDL_WindowFlags, window: ?*?*video.SDL_Window, renderer: ?*?*SDL_Renderer) callconv(.c) bool;
pub const PFN_SDL_DestroyRenderer = *const fn (renderer: ?*SDL_Renderer) callconv(.c) void;
pub const PFN_SDL_RenderClear = *const fn (renderer: ?*SDL_Renderer) callconv(.c) bool;
pub const PFN_SDL_RenderPresent = *const fn (renderer: ?*SDL_Renderer) callconv(.c) bool;
pub const PFN_SDL_SetRenderDrawColor = *const fn (renderer: ?*SDL_Renderer, r: core.Uint8, g: core.Uint8, b: core.Uint8, a: core.Uint8) callconv(.c) bool;
pub const PFN_SDL_RenderPoint = *const fn (renderer: ?*SDL_Renderer, x: f32, y: f32) callconv(.c) bool;
pub const PFN_SDL_RenderLine = *const fn (renderer: ?*SDL_Renderer, x1: f32, y1: f32, x2: f32, y2: f32) callconv(.c) bool;
pub const PFN_SDL_RenderFillRect = *const fn (renderer: ?*SDL_Renderer, rect: ?*const SDL_FRect) callconv(.c) bool;
pub const PFN_SDL_CreateTexture = *const fn (renderer: ?*SDL_Renderer, format: Uint32, access: c_int, w: c_int, h: c_int) callconv(.c) ?*SDL_Texture;
pub const PFN_SDL_CreateTextureWithProperties = *const fn (renderer: ?*SDL_Renderer, props: core.SDL_PropertiesID) callconv(.c) ?*SDL_Texture;
pub const PFN_SDL_DestroyTexture = *const fn (texture: ?*SDL_Texture) callconv(.c) void;
pub const PFN_SDL_UpdateTexture = *const fn (texture: ?*SDL_Texture, rect: ?*const pixels.SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool;
pub const PFN_SDL_RenderTexture = *const fn (renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, dstrect: ?*const SDL_FRect) callconv(.c) bool;
pub const PFN_SDL_RenderGeometry = *const fn (renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, vertices: ?[*]const SDL_Vertex, num_vertices: c_int, indices: ?[*]const c_int, num_indices: c_int) callconv(.c) bool;

// Renderer properties
pub const PFN_SDL_GetRendererName = *const fn (renderer: ?*SDL_Renderer) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetRendererProperties = *const fn (renderer: ?*SDL_Renderer) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_GetRenderOutputSize = *const fn (renderer: ?*SDL_Renderer, w: ?*c_int, h: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_GetCurrentRenderOutputSize = *const fn (renderer: ?*SDL_Renderer, w: ?*c_int, h: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_GetRenderViewport = *const fn (renderer: ?*SDL_Renderer, rect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_SetRenderViewport = *const fn (renderer: ?*SDL_Renderer, rect: ?*const SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetRenderSafeArea = *const fn (renderer: ?*SDL_Renderer, rect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetRenderWindow = *const fn (renderer: ?*SDL_Renderer) callconv(.c) ?*video.SDL_Window;
pub const PFN_SDL_GetRendererFromTexture = *const fn (texture: ?*SDL_Texture) callconv(.c) ?*SDL_Renderer;

// Draw operations
pub const PFN_SDL_RenderPoints = *const fn (renderer: ?*SDL_Renderer, points: ?[*]const pixels.SDL_FPoint, count: c_int) callconv(.c) bool;
pub const PFN_SDL_RenderLines = *const fn (renderer: ?*SDL_Renderer, points: ?[*]const pixels.SDL_FPoint, count: c_int) callconv(.c) bool;
pub const PFN_SDL_RenderRect = *const fn (renderer: ?*SDL_Renderer, rect: ?*const SDL_FRect) callconv(.c) bool;
pub const PFN_SDL_RenderRects = *const fn (renderer: ?*SDL_Renderer, rects: ?[*]const SDL_FRect, count: c_int) callconv(.c) bool;
pub const PFN_SDL_RenderFillRects = *const fn (renderer: ?*SDL_Renderer, rects: ?[*]const SDL_FRect, count: c_int) callconv(.c) bool;

// Target rendering
pub const PFN_SDL_SetRenderTarget = *const fn (renderer: ?*SDL_Renderer, texture: ?*SDL_Texture) callconv(.c) bool;
pub const PFN_SDL_GetRenderTarget = *const fn (renderer: ?*SDL_Renderer) callconv(.c) ?*SDL_Texture;

// Color and blend
pub const PFN_SDL_GetRenderDrawColor = *const fn (renderer: ?*SDL_Renderer, r: ?*core.Uint8, g: ?*core.Uint8, b: ?*core.Uint8, a: ?*core.Uint8) callconv(.c) bool;
pub const PFN_SDL_GetRenderDrawBlendMode = *const fn (renderer: ?*SDL_Renderer, blendMode: ?*SDL_BlendMode) callconv(.c) bool;
pub const PFN_SDL_SetRenderDrawBlendMode = *const fn (renderer: ?*SDL_Renderer, blendMode: SDL_BlendMode) callconv(.c) bool;

// Texture operations
pub const PFN_SDL_CreateTextureFromSurface = *const fn (renderer: ?*SDL_Renderer, surface: ?*surface.SDL_Surface) callconv(.c) ?*SDL_Texture;
pub const PFN_SDL_LockTexture = *const fn (texture: ?*SDL_Texture, rect: ?*const pixels.SDL_Rect, pixels: ?*?*anyopaque, pitch: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_LockTextureToSurface = *const fn (texture: ?*SDL_Texture, rect: ?*const pixels.SDL_Rect, surface: ?*?*surface.SDL_Surface) callconv(.c) bool;
pub const PFN_SDL_UnlockTexture = *const fn (texture: ?*SDL_Texture) callconv(.c) void;
pub const PFN_SDL_UpdateNVTexture = *const fn (texture: ?*SDL_Texture, rect: ?*const pixels.SDL_Rect, y_plane: ?[*]const u8, y_pitch: c_int, uv_plane: ?[*]const u8, uv_pitch: c_int) callconv(.c) bool;
pub const PFN_SDL_UpdateYUVTexture = *const fn (texture: ?*SDL_Texture, rect: ?*const pixels.SDL_Rect, y_plane: ?[*]const u8, y_pitch: c_int, u_plane: ?[*]const u8, u_pitch: c_int, v_plane: ?[*]const u8, v_pitch: c_int) callconv(.c) bool;
pub const PFN_SDL_SetTextureColorMod = *const fn (texture: ?*SDL_Texture, r: core.Uint8, g: core.Uint8, b: core.Uint8) callconv(.c) bool;
pub const PFN_SDL_GetTextureColorMod = *const fn (texture: ?*SDL_Texture, r: ?*core.Uint8, g: ?*core.Uint8, b: ?*core.Uint8) callconv(.c) bool;
pub const PFN_SDL_SetTextureAlphaMod = *const fn (texture: ?*SDL_Texture, alpha: core.Uint8) callconv(.c) bool;
pub const PFN_SDL_GetTextureAlphaMod = *const fn (texture: ?*SDL_Texture, alpha: ?*core.Uint8) callconv(.c) bool;
pub const PFN_SDL_SetTextureBlendMode = *const fn (texture: ?*SDL_Texture, blendMode: SDL_BlendMode) callconv(.c) bool;
pub const PFN_SDL_GetTextureBlendMode = *const fn (texture: ?*SDL_Texture, blendMode: ?*SDL_BlendMode) callconv(.c) bool;
pub const PFN_SDL_SetTextureScaleMode = *const fn (texture: ?*SDL_Texture, scaleMode: SDL_ScaleMode) callconv(.c) bool;
pub const PFN_SDL_GetTextureScaleMode = *const fn (texture: ?*SDL_Texture, scaleMode: ?*SDL_ScaleMode) callconv(.c) bool;
pub const PFN_SDL_GetTexturePalette = *const fn (texture: ?*SDL_Texture) callconv(.c) ?*pixels.SDL_Palette;
pub const PFN_SDL_SetTexturePalette = *const fn (texture: ?*SDL_Texture, palette: ?*pixels.SDL_Palette) callconv(.c) bool;

// Clipping
pub const PFN_SDL_SetRenderClipRect = *const fn (renderer: ?*SDL_Renderer, rect: ?*const SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_GetRenderClipRect = *const fn (renderer: ?*SDL_Renderer, rect: ?*SDL_Rect) callconv(.c) bool;
pub const PFN_SDL_RenderClipEnabled = *const fn (renderer: ?*SDL_Renderer) callconv(.c) bool;

// Logical presentation
pub const PFN_SDL_SetRenderLogicalPresentation = *const fn (renderer: ?*SDL_Renderer, w: c_int, h: c_int, mode: SDL_RendererLogicalPresentation) callconv(.c) bool;
pub const PFN_SDL_GetRenderLogicalPresentation = *const fn (renderer: ?*SDL_Renderer, w: ?*c_int, h: ?*c_int, mode: ?*SDL_RendererLogicalPresentation) callconv(.c) bool;

// Debug
pub const PFN_SDL_RenderDebugText = *const fn (renderer: ?*SDL_Renderer, x: f32, y: f32, str: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_RenderDebugTextFormat = *const fn (renderer: ?*SDL_Renderer, x: f32, y: f32, fmt: ?[*:0]const u8, ...) callconv(.c) bool;
pub const PFN_SDL_RenderGeometryRaw = *const fn (renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, xy: ?[*]const f32, xy_stride: c_int, color: ?[*]const SDL_FColor, color_stride: c_int, uv: ?[*]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, size_indices: c_int) callconv(.c) bool;
pub const PFN_SDL_RenderReadPixels = *const fn (renderer: ?*SDL_Renderer, rect: ?*const pixels.SDL_Rect) callconv(.c) ?*video.SDL_Surface;
pub const PFN_SDL_FlushRenderer = *const fn (renderer: ?*SDL_Renderer) callconv(.c) bool;

// Query functions
pub const PFN_SDL_GetNumRenderDrivers = *const fn () callconv(.c) c_int;
pub const PFN_SDL_GetRenderDriver = *const fn (index: c_int) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetRenderer = *const fn (window: ?*video.SDL_Window) callconv(.c) ?*SDL_Renderer;

// Coordinate system functions
pub const PFN_SDL_RenderCoordinatesFromWindow = *const fn (renderer: ?*SDL_Renderer, window_x: f32, window_y: f32, render_x: ?*f32, render_y: ?*f32) callconv(.c) bool;
pub const PFN_SDL_RenderCoordinatesToWindow = *const fn (renderer: ?*SDL_Renderer, render_x: f32, render_y: f32, window_x: ?*f32, window_y: ?*f32) callconv(.c) bool;
pub const PFN_SDL_ConvertEventToRenderCoordinates = *const fn (renderer: ?*SDL_Renderer, event: ?*core.SDL_Event) callconv(.c) bool;

// Scale and color functions
pub const PFN_SDL_SetRenderScale = *const fn (renderer: ?*SDL_Renderer, scale_x: f32, scale_y: f32) callconv(.c) bool;
pub const PFN_SDL_GetRenderScale = *const fn (renderer: ?*SDL_Renderer, scale_x: ?*f32, scale_y: ?*f32) callconv(.c) bool;
pub const PFN_SDL_SetRenderDrawColorFloat = *const fn (renderer: ?*SDL_Renderer, r: f32, g: f32, b: f32, a: f32) callconv(.c) bool;
pub const PFN_SDL_GetRenderDrawColorFloat = *const fn (renderer: ?*SDL_Renderer, r: ?*f32, g: ?*f32, b: ?*f32, a: ?*f32) callconv(.c) bool;

// Float texture modulation
pub const PFN_SDL_SetTextureColorModFloat = *const fn (texture: ?*SDL_Texture, r: f32, g: f32, b: f32) callconv(.c) bool;
pub const PFN_SDL_GetTextureColorModFloat = *const fn (texture: ?*SDL_Texture, r: ?*f32, g: ?*f32, b: ?*f32) callconv(.c) bool;
pub const PFN_SDL_SetTextureAlphaModFloat = *const fn (texture: ?*SDL_Texture, alpha: f32) callconv(.c) bool;
pub const PFN_SDL_GetTextureAlphaModFloat = *const fn (texture: ?*SDL_Texture, alpha: ?*f32) callconv(.c) bool;

// Address modes
pub const PFN_SDL_SetRenderTextureAddressMode = *const fn (renderer: ?*SDL_Renderer, u_mode: SDL_TextureAddressMode, v_mode: SDL_TextureAddressMode) callconv(.c) bool;
pub const PFN_SDL_GetRenderTextureAddressMode = *const fn (renderer: ?*SDL_Renderer, u_mode: ?*SDL_TextureAddressMode, v_mode: ?*SDL_TextureAddressMode) callconv(.c) bool;

// Advanced texture rendering
pub const PFN_SDL_RenderTexture9Grid = *const fn (renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, left_width: f32, right_width: f32, top_height: f32, bottom_height: f32, scale: f32, dstrect: ?*const SDL_FRect) callconv(.c) bool;
pub const PFN_SDL_RenderTexture9GridTiled = *const fn (renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, left_width: f32, right_width: f32, top_height: f32, bottom_height: f32, scale: f32, dstrect: ?*const SDL_FRect, tileScale: f32) callconv(.c) bool;
pub const PFN_SDL_RenderTextureAffine = *const fn (renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, origin: ?*const SDL_FPoint, right: ?*const SDL_FPoint, down: ?*const SDL_FPoint) callconv(.c) bool;
pub const PFN_SDL_RenderTextureRotated = *const fn (renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, dstrect: ?*const SDL_FRect, angle: f64, center: ?*const SDL_FPoint, flip: SDL_FlipMode) callconv(.c) bool;
pub const PFN_SDL_RenderTextureTiled = *const fn (renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, scale: f32, dstrect: ?*const SDL_FRect) callconv(.c) bool;

// Utility functions
pub const PFN_SDL_GetDefaultTextureScaleMode = *const fn (renderer: ?*SDL_Renderer, scale_mode: ?*SDL_ScaleMode) callconv(.c) bool;
pub const PFN_SDL_SetDefaultTextureScaleMode = *const fn (renderer: ?*SDL_Renderer, scale_mode: SDL_ScaleMode) callconv(.c) bool;
pub const PFN_SDL_GetRenderLogicalPresentationRect = *const fn (renderer: ?*SDL_Renderer, rect: ?*SDL_FRect) callconv(.c) bool;

// Additional render functions
pub const PFN_SDL_GetTextureProperties = *const fn (texture: ?*SDL_Texture) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_RenderViewportSet = *const fn (renderer: ?*SDL_Renderer) callconv(.c) bool;
pub const PFN_SDL_SetRenderColorScale = *const fn (renderer: ?*SDL_Renderer, scale: f32) callconv(.c) bool;
pub const PFN_SDL_GetRenderColorScale = *const fn (renderer: ?*SDL_Renderer, scale: ?*f32) callconv(.c) bool;

// Texture operations
pub const PFN_SDL_GetTextureSize = *const fn (texture: ?*SDL_Texture, w: ?*f32, h: ?*f32) callconv(.c) bool;
pub const PFN_SDL_GetRenderVSync = *const fn (renderer: ?*SDL_Renderer, vsync: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_SetRenderVSync = *const fn (renderer: ?*SDL_Renderer, vsync: c_int) callconv(.c) bool;

// GPU render state (via SDL_Renderer)
pub const PFN_SDL_AddVulkanRenderSemaphores = *const fn (renderer: ?*SDL_Renderer, wait_stage_mask: Uint32, wait_semaphore: Sint64, signal_semaphore: Sint64) callconv(.c) bool;
pub const PFN_SDL_CreateGPURenderState = *const fn (renderer: ?*SDL_Renderer, createinfo: ?*const anyopaque) callconv(.c) ?*SDL_GPURenderState;
pub const PFN_SDL_DestroyGPURenderState = *const fn (state: ?*SDL_GPURenderState) callconv(.c) void;
pub const PFN_SDL_SetGPURenderState = *const fn (renderer: ?*SDL_Renderer, state: ?*SDL_GPURenderState) callconv(.c) bool;
pub const PFN_SDL_SetGPURenderStateFragmentUniforms = *const fn (state: ?*SDL_GPURenderState, slot_index: Uint32, data: ?*const anyopaque, length: Uint32) callconv(.c) bool;

// Metal-specific functions (platform-locked)
pub const PFN_SDL_GetRenderMetalCommandEncoder = *const fn (renderer: ?*SDL_Renderer) callconv(.c) ?*anyopaque;
pub const PFN_SDL_GetRenderMetalLayer = *const fn (renderer: ?*SDL_Renderer) callconv(.c) ?*anyopaque;

pub const RenderFunctions = struct {
    createRenderer: PFN_SDL_CreateRenderer,
    createRendererWithProperties: PFN_SDL_CreateRendererWithProperties,
    createGPURenderer: PFN_SDL_CreateGPURenderer,
    getGPURendererDevice: PFN_SDL_GetGPURendererDevice,
    createSoftwareRenderer: PFN_SDL_CreateSoftwareRenderer,
    createWindowAndRenderer: PFN_SDL_CreateWindowAndRenderer,
    destroyRenderer: PFN_SDL_DestroyRenderer,
    renderClear: PFN_SDL_RenderClear,
    renderPresent: PFN_SDL_RenderPresent,
    setRenderDrawColor: PFN_SDL_SetRenderDrawColor,
    renderPoint: PFN_SDL_RenderPoint,
    renderLine: PFN_SDL_RenderLine,
    renderFillRect: PFN_SDL_RenderFillRect,
    createTexture: PFN_SDL_CreateTexture,
    createTextureWithProperties: PFN_SDL_CreateTextureWithProperties,
    destroyTexture: PFN_SDL_DestroyTexture,
    updateTexture: PFN_SDL_UpdateTexture,
    renderTexture: PFN_SDL_RenderTexture,
    renderGeometry: PFN_SDL_RenderGeometry,
    getRendererName: PFN_SDL_GetRendererName,
    getRendererProperties: PFN_SDL_GetRendererProperties,
    getRenderOutputSize: PFN_SDL_GetRenderOutputSize,
    getCurrentRenderOutputSize: PFN_SDL_GetCurrentRenderOutputSize,
    getRenderViewport: PFN_SDL_GetRenderViewport,
    setRenderViewport: PFN_SDL_SetRenderViewport,
    getRenderSafeArea: PFN_SDL_GetRenderSafeArea,
    getRenderWindow: PFN_SDL_GetRenderWindow,
    getRendererFromTexture: PFN_SDL_GetRendererFromTexture,
    renderPoints: PFN_SDL_RenderPoints,
    renderLines: PFN_SDL_RenderLines,
    renderRect: PFN_SDL_RenderRect,
    renderRects: PFN_SDL_RenderRects,
    renderFillRects: PFN_SDL_RenderFillRects,
    setRenderTarget: PFN_SDL_SetRenderTarget,
    getRenderTarget: PFN_SDL_GetRenderTarget,
    getRenderDrawColor: PFN_SDL_GetRenderDrawColor,
    getRenderDrawBlendMode: PFN_SDL_GetRenderDrawBlendMode,
    setRenderDrawBlendMode: PFN_SDL_SetRenderDrawBlendMode,
    createTextureFromSurface: PFN_SDL_CreateTextureFromSurface,
    lockTexture: PFN_SDL_LockTexture,
    lockTextureToSurface: PFN_SDL_LockTextureToSurface,
    unlockTexture: PFN_SDL_UnlockTexture,
    updateNVTexture: PFN_SDL_UpdateNVTexture,
    updateYUVTexture: PFN_SDL_UpdateYUVTexture,
    setTextureColorMod: PFN_SDL_SetTextureColorMod,
    getTextureColorMod: PFN_SDL_GetTextureColorMod,
    setTextureAlphaMod: PFN_SDL_SetTextureAlphaMod,
    getTextureAlphaMod: PFN_SDL_GetTextureAlphaMod,
    setTextureBlendMode: PFN_SDL_SetTextureBlendMode,
    getTextureBlendMode: PFN_SDL_GetTextureBlendMode,
    setTextureScaleMode: PFN_SDL_SetTextureScaleMode,
    getTextureScaleMode: PFN_SDL_GetTextureScaleMode,
    getTexturePalette: PFN_SDL_GetTexturePalette,
    setTexturePalette: PFN_SDL_SetTexturePalette,
    setRenderClipRect: PFN_SDL_SetRenderClipRect,
    getRenderClipRect: PFN_SDL_GetRenderClipRect,
    renderClipEnabled: PFN_SDL_RenderClipEnabled,
    setRenderLogicalPresentation: PFN_SDL_SetRenderLogicalPresentation,
    getRenderLogicalPresentation: PFN_SDL_GetRenderLogicalPresentation,
    renderDebugText: PFN_SDL_RenderDebugText,
    renderDebugTextFormat: PFN_SDL_RenderDebugTextFormat,
    renderGeometryRaw: PFN_SDL_RenderGeometryRaw,
    renderReadPixels: PFN_SDL_RenderReadPixels,
    flushRenderer: PFN_SDL_FlushRenderer,
    textureSize: PFN_SDL_GetTextureSize,
    getRenderVSync: PFN_SDL_GetRenderVSync,
    setRenderVSync: PFN_SDL_SetRenderVSync,
    getNumRenderDrivers: PFN_SDL_GetNumRenderDrivers,
    getRenderDriver: PFN_SDL_GetRenderDriver,
    getRenderer: PFN_SDL_GetRenderer,
    renderCoordinatesFromWindow: PFN_SDL_RenderCoordinatesFromWindow,
    renderCoordinatesToWindow: PFN_SDL_RenderCoordinatesToWindow,
    convertEventToRenderCoordinates: PFN_SDL_ConvertEventToRenderCoordinates,
    setRenderScale: PFN_SDL_SetRenderScale,
    getRenderScale: PFN_SDL_GetRenderScale,
    setRenderDrawColorFloat: PFN_SDL_SetRenderDrawColorFloat,
    getRenderDrawColorFloat: PFN_SDL_GetRenderDrawColorFloat,
    setTextureColorModFloat: PFN_SDL_SetTextureColorModFloat,
    getTextureColorModFloat: PFN_SDL_GetTextureColorModFloat,
    setTextureAlphaModFloat: PFN_SDL_SetTextureAlphaModFloat,
    getTextureAlphaModFloat: PFN_SDL_GetTextureAlphaModFloat,
    setRenderTextureAddressMode: PFN_SDL_SetRenderTextureAddressMode,
    getRenderTextureAddressMode: PFN_SDL_GetRenderTextureAddressMode,
    renderTexture9Grid: PFN_SDL_RenderTexture9Grid,
    renderTexture9GridTiled: PFN_SDL_RenderTexture9GridTiled,
    renderTextureAffine: PFN_SDL_RenderTextureAffine,
    renderTextureRotated: PFN_SDL_RenderTextureRotated,
    renderTextureTiled: PFN_SDL_RenderTextureTiled,
    getDefaultTextureScaleMode: PFN_SDL_GetDefaultTextureScaleMode,
    setDefaultTextureScaleMode: PFN_SDL_SetDefaultTextureScaleMode,
    getRenderLogicalPresentationRect: PFN_SDL_GetRenderLogicalPresentationRect,
    getTextureProperties: PFN_SDL_GetTextureProperties,
    renderViewportSet: PFN_SDL_RenderViewportSet,
    setRenderColorScale: PFN_SDL_SetRenderColorScale,
    getRenderColorScale: PFN_SDL_GetRenderColorScale,
    addVulkanRenderSemaphores: PFN_SDL_AddVulkanRenderSemaphores,
    createGPURenderState: PFN_SDL_CreateGPURenderState,
    destroyGPURenderState: PFN_SDL_DestroyGPURenderState,
    setGPURenderState: PFN_SDL_SetGPURenderState,
    setGPURenderStateFragmentUniforms: PFN_SDL_SetGPURenderStateFragmentUniforms,
    getRenderMetalCommandEncoder: ?PFN_SDL_GetRenderMetalCommandEncoder,
    getRenderMetalLayer: ?PFN_SDL_GetRenderMetalLayer,

    pub fn load(handle: dynamic.LibraryHandle) !RenderFunctions {
        return dynamic.loadFunctions(RenderFunctions, handle, "SDL_", .{
            .{ "textureSize", "SDL_GetTextureSize" },
        }, &.{ "getRenderMetalCommandEncoder", "getRenderMetalLayer" });
    }
};
