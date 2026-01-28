// SDL3 Render Bindings
// 2D accelerated rendering

const core = @import("core.zig");
pub const Uint32 = core.Uint32;
const pixels = @import("pixels.zig");
pub const SDL_PixelFormat = pixels.SDL_PixelFormat;
pub const SDL_BlendMode = pixels.SDL_BlendMode;
pub const SDL_FRect = pixels.SDL_FRect;
const video = @import("video.zig");

// Import types
// Render structs
pub const SDL_Renderer = opaque {};
pub const SDL_Texture = opaque {};
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
    SDL_SCALEMODE_NEAREST,
    SDL_SCALEMODE_LINEAR,
    SDL_SCALEMODE_BEST,
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

// Colorspace support
pub const SDL_Colorspace = enum(c_int) {
    SDL_COLORSPACE_UNKNOWN = 0,
    SDL_COLORSPACE_SRGB = 1,
    SDL_COLORSPACE_SRGB_LINEAR = 2,
};

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
extern fn SDL_CreateRenderer(window: ?*video.SDL_Window, name: ?[*:0]const u8, flags: Uint32) ?*SDL_Renderer;
extern fn SDL_CreateRendererWithProperties(props: core.SDL_PropertiesID) ?*SDL_Renderer;
extern fn SDL_CreateSoftwareRenderer(surface: ?*pixels.SDL_Surface) ?*SDL_Renderer;
extern fn SDL_CreateWindowAndRenderer(title: ?[*:0]const u8, width: c_int, height: c_int, window_flags: video.SDL_WindowFlags, window: ?*?*video.SDL_Window, renderer: ?*?*SDL_Renderer) bool;
extern fn SDL_DestroyRenderer(renderer: ?*SDL_Renderer) void;
extern fn SDL_RenderClear(renderer: ?*SDL_Renderer) bool;
extern fn SDL_RenderPresent(renderer: ?*SDL_Renderer) void;
extern fn SDL_SetRenderDrawColor(renderer: ?*SDL_Renderer, r: core.Uint8, g: core.Uint8, b: core.Uint8, a: core.Uint8) bool;
extern fn SDL_RenderPoint(renderer: ?*SDL_Renderer, x: f32, y: f32) bool;
extern fn SDL_RenderLine(renderer: ?*SDL_Renderer, x1: f32, y1: f32, x2: f32, y2: f32) bool;
extern fn SDL_RenderFillRect(renderer: ?*SDL_Renderer, rect: ?*const SDL_FRect) bool;
extern fn SDL_CreateTexture(renderer: ?*SDL_Renderer, format: Uint32, access: c_int, w: c_int, h: c_int) ?*SDL_Texture;
extern fn SDL_CreateTextureWithProperties(renderer: ?*SDL_Renderer, props: core.SDL_PropertiesID) ?*SDL_Texture;
extern fn SDL_DestroyTexture(texture: ?*SDL_Texture) void;
extern fn SDL_UpdateTexture(texture: ?*SDL_Texture, rect: ?*const pixels.SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) bool;
extern fn SDL_RenderTexture(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, dstrect: ?*const SDL_FRect) bool;
extern fn SDL_RenderGeometry(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, vertices: ?[*]const SDL_Vertex, num_vertices: c_int, indices: ?[*]const c_int, num_indices: c_int) bool;

// Renderer properties
extern fn SDL_GetRendererName(renderer: ?*SDL_Renderer) ?[*:0]const u8;
extern fn SDL_GetRendererProperties(renderer: ?*SDL_Renderer) core.SDL_PropertiesID;
extern fn SDL_GetRenderOutputSize(renderer: ?*SDL_Renderer, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_GetCurrentRenderOutputSize(renderer: ?*SDL_Renderer, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_GetRenderViewport(renderer: ?*SDL_Renderer, rect: ?*SDL_FRect) bool;
extern fn SDL_SetRenderViewport(renderer: ?*SDL_Renderer, rect: ?*const SDL_FRect) bool;
extern fn SDL_GetRenderSafeArea(renderer: ?*SDL_Renderer, rect: ?*SDL_FRect) bool;
extern fn SDL_GetRenderWindow(renderer: ?*SDL_Renderer) ?*video.SDL_Window;
extern fn SDL_GetRendererFromTexture(texture: ?*SDL_Texture) ?*SDL_Renderer;

// Draw operations
extern fn SDL_RenderPoints(renderer: ?*SDL_Renderer, points: ?[*]const pixels.SDL_FPoint, count: c_int) bool;
extern fn SDL_RenderLines(renderer: ?*SDL_Renderer, points: ?[*]const pixels.SDL_FPoint, count: c_int) bool;
extern fn SDL_RenderRect(renderer: ?*SDL_Renderer, rect: ?*const SDL_FRect) bool;
extern fn SDL_RenderRects(renderer: ?*SDL_Renderer, rects: ?[*]const SDL_FRect, count: c_int) bool;
extern fn SDL_RenderFillRects(renderer: ?*SDL_Renderer, rects: ?[*]const SDL_FRect, count: c_int) bool;

// Target rendering
extern fn SDL_SetRenderTarget(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture) bool;
extern fn SDL_GetRenderTarget(renderer: ?*SDL_Renderer) ?*SDL_Texture;

// Color and blend
extern fn SDL_GetRenderDrawColor(renderer: ?*SDL_Renderer, r: ?*core.Uint8, g: ?*core.Uint8, b: ?*core.Uint8, a: ?*core.Uint8) bool;
extern fn SDL_GetRenderDrawBlendMode(renderer: ?*SDL_Renderer, blendMode: ?*SDL_BlendMode) bool;
extern fn SDL_SetRenderDrawBlendMode(renderer: ?*SDL_Renderer, blendMode: SDL_BlendMode) bool;

// Texture operations
extern fn SDL_CreateTextureFromSurface(renderer: ?*SDL_Renderer, surface: ?*pixels.SDL_Surface) ?*SDL_Texture;
extern fn SDL_QueryTexture(texture: ?*SDL_Texture, format: ?*Uint32, access: ?*c_int, w: ?*c_int, h: ?*c_int) bool;
extern fn SDL_LockTexture(texture: ?*SDL_Texture, rect: ?*const pixels.SDL_Rect, pixels: ?*?*anyopaque, pitch: ?*c_int) bool;
extern fn SDL_LockTextureToSurface(texture: ?*SDL_Texture, rect: ?*const pixels.SDL_Rect) ?*pixels.SDL_Surface;
extern fn SDL_UnlockTexture(texture: ?*SDL_Texture) void;
extern fn SDL_UpdateNVTexture(texture: ?*SDL_Texture, rect: ?*const pixels.SDL_Rect, y_plane: ?[*]const u8, uv_plane: ?[*]const u8, pitch: c_int) bool;
extern fn SDL_UpdateYUVTexture(texture: ?*SDL_Texture, rect: ?*const pixels.SDL_Rect, y_plane: ?[*]const u8, u_plane: ?[*]const u8, v_plane: ?[*]const u8, y_pitch: c_int, uv_pitch: c_int) bool;
extern fn SDL_SetTextureColorMod(texture: ?*SDL_Texture, r: core.Uint8, g: core.Uint8, b: core.Uint8) bool;
extern fn SDL_GetTextureColorMod(texture: ?*SDL_Texture, r: ?*core.Uint8, g: ?*core.Uint8, b: ?*core.Uint8) bool;
extern fn SDL_SetTextureAlphaMod(texture: ?*SDL_Texture, alpha: core.Uint8) bool;
extern fn SDL_GetTextureAlphaMod(texture: ?*SDL_Texture, alpha: ?*core.Uint8) bool;
extern fn SDL_SetTextureBlendMode(texture: ?*SDL_Texture, blendMode: SDL_BlendMode) bool;
extern fn SDL_GetTextureBlendMode(texture: ?*SDL_Texture, blendMode: ?*SDL_BlendMode) bool;
extern fn SDL_SetTextureScaleMode(texture: ?*SDL_Texture, scaleMode: SDL_ScaleMode) bool;
extern fn SDL_GetTextureScaleMode(texture: ?*SDL_Texture, scaleMode: ?*SDL_ScaleMode) bool;
extern fn SDL_GetTexturePalette(texture: ?*SDL_Texture) ?*pixels.SDL_Palette;
extern fn SDL_SetTexturePalette(texture: ?*SDL_Texture, palette: ?*pixels.SDL_Palette) bool;

// Clipping
extern fn SDL_SetRenderClipRect(renderer: ?*SDL_Renderer, rect: ?*const SDL_FRect) bool;
extern fn SDL_GetRenderClipRect(renderer: ?*SDL_Renderer, rect: ?*SDL_FRect) bool;
extern fn SDL_RenderClipEnabled(renderer: ?*SDL_Renderer) bool;

// Logical presentation
extern fn SDL_SetRenderLogicalPresentation(renderer: ?*SDL_Renderer, w: c_int, h: c_int, mode: SDL_RendererLogicalPresentation, scale_mode: SDL_ScaleMode) bool;
extern fn SDL_GetRenderLogicalPresentation(renderer: ?*SDL_Renderer, w: ?*c_int, h: ?*c_int, mode: ?*SDL_RendererLogicalPresentation, scale_mode: ?*SDL_ScaleMode) bool;
extern fn SDL_SetRenderLogicalSize(renderer: ?*SDL_Renderer, w: c_int, h: c_int) bool;
extern fn SDL_GetRenderLogicalSize(renderer: ?*SDL_Renderer, w: ?*c_int, h: ?*c_int) bool;

// Debug
extern fn SDL_RenderDebugText(renderer: ?*SDL_Renderer, x: f32, y: f32, str: ?[*:0]const u8) bool;
extern fn SDL_RenderDebugTextFormat(renderer: ?*SDL_Renderer, x: f32, y: f32, fmt: ?[*:0]const u8, ...) bool;
extern fn SDL_RenderGeometryRaw(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, xy: ?[*]const f32, xy_stride: c_int, color: ?[*]const SDL_FColor, color_stride: c_int, uv: ?[*]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?[*]const c_int, num_indices: c_int, size_indices: c_int) bool;
extern fn SDL_RenderReadPixels(renderer: ?*SDL_Renderer, rect: ?*const SDL_FRect) ?*pixels.SDL_Surface;
extern fn SDL_RenderFlush(renderer: ?*SDL_Renderer) bool;
extern fn SDL_FlushRenderer(renderer: ?*SDL_Renderer) bool;

// Query functions
extern fn SDL_GetNumRenderDrivers() c_int;
extern fn SDL_GetRenderDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetRenderer(window: ?*video.SDL_Window) ?*SDL_Renderer;

// Coordinate system functions
extern fn SDL_RenderCoordinatesFromWindow(renderer: ?*SDL_Renderer, window_x: f32, window_y: f32, render_x: ?*f32, render_y: ?*f32) bool;
extern fn SDL_RenderCoordinatesToWindow(renderer: ?*SDL_Renderer, render_x: f32, render_y: f32, window_x: ?*f32, window_y: ?*f32) bool;
extern fn SDL_ConvertEventToRenderCoordinates(renderer: ?*SDL_Renderer, event: ?*core.SDL_Event, render_x: ?*f32, render_y: ?*f32) bool;

// Scale and color functions
extern fn SDL_SetRenderScale(renderer: ?*SDL_Renderer, scale_x: f32, scale_y: f32) bool;
extern fn SDL_GetRenderScale(renderer: ?*SDL_Renderer, scale_x: ?*f32, scale_y: ?*f32) bool;
extern fn SDL_SetRenderDrawColorFloat(renderer: ?*SDL_Renderer, r: f32, g: f32, b: f32, a: f32) bool;
extern fn SDL_GetRenderDrawColorFloat(renderer: ?*SDL_Renderer, r: ?*f32, g: ?*f32, b: ?*f32, a: ?*f32) bool;

// Float texture modulation
extern fn SDL_SetTextureColorModFloat(texture: ?*SDL_Texture, r: f32, g: f32, b: f32) bool;
extern fn SDL_GetTextureColorModFloat(texture: ?*SDL_Texture, r: ?*f32, g: ?*f32, b: ?*f32) bool;
extern fn SDL_SetTextureAlphaModFloat(texture: ?*SDL_Texture, alpha: f32) bool;
extern fn SDL_GetTextureAlphaModFloat(texture: ?*SDL_Texture, alpha: ?*f32) bool;

// Address modes
extern fn SDL_SetRenderTextureAddressMode(renderer: ?*SDL_Renderer, address_mode: SDL_TextureAddressMode) bool;
extern fn SDL_GetRenderTextureAddressMode(renderer: ?*SDL_Renderer, address_mode: ?*SDL_TextureAddressMode) bool;

// Advanced texture rendering
extern fn SDL_RenderTexture9Grid(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, dstrect: ?*const SDL_FRect, scale_w: f32, scale_h: f32) bool;
extern fn SDL_RenderTexture9GridTiled(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, dstrect: ?*const SDL_FRect, scale_w: f32, scale_h: f32, tile_w: f32, tile_h: f32) bool;
extern fn SDL_RenderTextureAffine(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, dstrect: ?*const SDL_FRect, angle: f32, center_x: f32, center_y: f32, scale_x: f32, scale_y: f32) bool;
extern fn SDL_RenderTextureRotated(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, dstrect: ?*const SDL_FRect, angle: f32, center_x: f32, center_y: f32) bool;
extern fn SDL_RenderTextureTiled(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, dstrect: ?*const SDL_FRect, tile_w: f32, tile_h: f32) bool;

// Utility functions
extern fn SDL_GetDefaultTextureScaleMode() SDL_ScaleMode;
extern fn SDL_SetDefaultTextureScaleMode(scale_mode: SDL_ScaleMode) void;
extern fn SDL_GetRenderLogicalPresentationRect(renderer: ?*SDL_Renderer, rect: ?*SDL_FRect) bool;

// Texture operations
extern fn SDL_TextureSize(texture: ?*SDL_Texture, w: ?*f32, h: ?*f32) bool;
extern fn SDL_GetRenderVSync(renderer: ?*SDL_Renderer, vsync: ?*c_int) bool;
extern fn SDL_SetRenderVSync(renderer: ?*SDL_Renderer, vsync: c_int) bool;

// Public API - Creation
pub const createRenderer = SDL_CreateRenderer;
pub const createRendererWithProperties = SDL_CreateRendererWithProperties;
pub const createSoftwareRenderer = SDL_CreateSoftwareRenderer;
pub const createWindowAndRenderer = SDL_CreateWindowAndRenderer;
pub const destroyRenderer = SDL_DestroyRenderer;

// Public API - Drawing primitives
pub const renderClear = SDL_RenderClear;
pub const renderPresent = SDL_RenderPresent;
pub const setRenderDrawColor = SDL_SetRenderDrawColor;
pub const renderPoint = SDL_RenderPoint;
pub const renderLine = SDL_RenderLine;
pub const renderFillRect = SDL_RenderFillRect;

// Public API - Texture creation
pub const createTexture = SDL_CreateTexture;
pub const createTextureWithProperties = SDL_CreateTextureWithProperties;
pub const destroyTexture = SDL_DestroyTexture;
pub const renderTexture = SDL_RenderTexture;
pub const renderGeometry = SDL_RenderGeometry;

// Renderer properties
pub const getRendererName = SDL_GetRendererName;
pub const getRendererProperties = SDL_GetRendererProperties;
pub const getRenderOutputSize = SDL_GetRenderOutputSize;
pub const getCurrentRenderOutputSize = SDL_GetCurrentRenderOutputSize;
pub const getRenderViewport = SDL_GetRenderViewport;
pub const setRenderViewport = SDL_SetRenderViewport;
pub const getRenderSafeArea = SDL_GetRenderSafeArea;
pub const getRenderWindow = SDL_GetRenderWindow;
pub const getRendererFromTexture = SDL_GetRendererFromTexture;

// Draw operations
pub const renderPoints = SDL_RenderPoints;
pub const renderLines = SDL_RenderLines;
pub const renderRect = SDL_RenderRect;
pub const renderRects = SDL_RenderRects;
pub const renderFillRects = SDL_RenderFillRects;

// Target rendering
pub const setRenderTarget = SDL_SetRenderTarget;
pub const getRenderTarget = SDL_GetRenderTarget;

// Color and blend
pub const getRenderDrawColor = SDL_GetRenderDrawColor;
pub const getRenderDrawBlendMode = SDL_GetRenderDrawBlendMode;
pub const setRenderDrawBlendMode = SDL_SetRenderDrawBlendMode;

// Texture operations
pub const createTextureFromSurface = SDL_CreateTextureFromSurface;
pub const queryTexture = SDL_QueryTexture;
pub const lockTexture = SDL_LockTexture;
pub const lockTextureToSurface = SDL_LockTextureToSurface;
pub const unlockTexture = SDL_UnlockTexture;
pub const updateTexture = SDL_UpdateTexture;
pub const updateNVTexture = SDL_UpdateNVTexture;
pub const updateYUVTexture = SDL_UpdateYUVTexture;
pub const setTextureColorMod = SDL_SetTextureColorMod;
pub const getTextureColorMod = SDL_GetTextureColorMod;
pub const setTextureAlphaMod = SDL_SetTextureAlphaMod;
pub const getTextureAlphaMod = SDL_GetTextureAlphaMod;
pub const setTextureBlendMode = SDL_SetTextureBlendMode;
pub const getTextureBlendMode = SDL_GetTextureBlendMode;
pub const setTextureScaleMode = SDL_SetTextureScaleMode;
pub const getTextureScaleMode = SDL_GetTextureScaleMode;
pub const getTexturePalette = SDL_GetTexturePalette;
pub const setTexturePalette = SDL_SetTexturePalette;

// Clipping
pub const setRenderClipRect = SDL_SetRenderClipRect;
pub const getRenderClipRect = SDL_GetRenderClipRect;
pub const renderClipEnabled = SDL_RenderClipEnabled;

// Logical presentation
pub const setRenderLogicalPresentation = SDL_SetRenderLogicalPresentation;
pub const getRenderLogicalPresentation = SDL_GetRenderLogicalPresentation;
pub const setRenderLogicalSize = SDL_SetRenderLogicalSize;
pub const getRenderLogicalSize = SDL_GetRenderLogicalSize;

// Debug
pub const renderDebugText = SDL_RenderDebugText;
pub const renderDebugTextFormat = SDL_RenderDebugTextFormat;
pub const renderGeometryRaw = SDL_RenderGeometryRaw;
pub const renderReadPixels = SDL_RenderReadPixels;
pub const renderFlush = SDL_RenderFlush;
pub const flushRenderer = SDL_FlushRenderer;
pub const textureSize = SDL_TextureSize;
pub const getRenderVSync = SDL_GetRenderVSync;
pub const setRenderVSync = SDL_SetRenderVSync;

// Query functions
pub const getNumRenderDrivers = SDL_GetNumRenderDrivers;
pub const getRenderDriver = SDL_GetRenderDriver;
pub const getRenderer = SDL_GetRenderer;

// Coordinate system functions
pub const renderCoordinatesFromWindow = SDL_RenderCoordinatesFromWindow;
pub const renderCoordinatesToWindow = SDL_RenderCoordinatesToWindow;
pub const convertEventToRenderCoordinates = SDL_ConvertEventToRenderCoordinates;

// Scale and color functions
pub const setRenderScale = SDL_SetRenderScale;
pub const getRenderScale = SDL_GetRenderScale;
pub const setRenderDrawColorFloat = SDL_SetRenderDrawColorFloat;
pub const getRenderDrawColorFloat = SDL_GetRenderDrawColorFloat;

// Float texture modulation
pub const setTextureColorModFloat = SDL_SetTextureColorModFloat;
pub const getTextureColorModFloat = SDL_GetTextureColorModFloat;
pub const setTextureAlphaModFloat = SDL_SetTextureAlphaModFloat;
pub const getTextureAlphaModFloat = SDL_GetTextureAlphaModFloat;

// Address modes
pub const setRenderTextureAddressMode = SDL_SetRenderTextureAddressMode;
pub const getRenderTextureAddressMode = SDL_GetRenderTextureAddressMode;

// Advanced texture rendering
pub const renderTexture9Grid = SDL_RenderTexture9Grid;
pub const renderTexture9GridTiled = SDL_RenderTexture9GridTiled;
pub const renderTextureAffine = SDL_RenderTextureAffine;
pub const renderTextureRotated = SDL_RenderTextureRotated;
pub const renderTextureTiled = SDL_RenderTextureTiled;

// Utility functions
pub const getDefaultTextureScaleMode = SDL_GetDefaultTextureScaleMode;
pub const setDefaultTextureScaleMode = SDL_SetDefaultTextureScaleMode;
pub const getRenderLogicalPresentationRect = SDL_GetRenderLogicalPresentationRect;
