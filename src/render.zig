// SDL3 Render Bindings
// 2D accelerated rendering

const core = @import("core.zig");
const video = @import("video.zig");
const pixels = @import("pixels.zig");

// Import types
pub const Uint32 = core.Uint32;
pub const SDL_PixelFormat = pixels.SDL_PixelFormat;
pub const SDL_BlendMode = pixels.SDL_BlendMode;
pub const SDL_FRect = pixels.SDL_FRect;

// Render structs
pub const SDL_Renderer = opaque {};
pub const SDL_Texture = opaque {};
pub const SDL_Vertex = extern struct {
    position: pixels.SDL_FPoint,
    color: pixels.SDL_FColor,
    tex_coord: pixels.SDL_FPoint,
};

// Placeholder for SDL_FColor
pub const SDL_FColor = extern struct {
    r: f32,
    g: f32,
    b: f32,
    a: f32,
};

// Render functions
extern fn SDL_CreateRenderer(window: ?*video.SDL_Window, name: ?[*:0]const u8, flags: Uint32) ?*SDL_Renderer;
extern fn SDL_DestroyRenderer(renderer: ?*SDL_Renderer) void;
extern fn SDL_RenderClear(renderer: ?*SDL_Renderer) bool;
extern fn SDL_RenderPresent(renderer: ?*SDL_Renderer) void;
extern fn SDL_SetRenderDrawColor(renderer: ?*SDL_Renderer, r: core.Uint8, g: core.Uint8, b: core.Uint8, a: core.Uint8) bool;
extern fn SDL_RenderLine(renderer: ?*SDL_Renderer, x1: f32, y1: f32, x2: f32, y2: f32) bool;
extern fn SDL_RenderFillRect(renderer: ?*SDL_Renderer, rect: ?*const SDL_FRect) bool;
extern fn SDL_CreateTexture(renderer: ?*SDL_Renderer, format: Uint32, access: c_int, w: c_int, h: c_int) ?*SDL_Texture;
extern fn SDL_DestroyTexture(texture: ?*SDL_Texture) void;
extern fn SDL_UpdateTexture(texture: ?*SDL_Texture, rect: ?*const pixels.SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) bool;
extern fn SDL_RenderTexture(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: ?*const SDL_FRect, dstrect: ?*const SDL_FRect) bool;
extern fn SDL_RenderGeometry(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, vertices: ?[*]const SDL_Vertex, num_vertices: c_int, indices: ?[*]const c_int, num_indices: c_int) bool;

// Public API
pub const createRenderer = SDL_CreateRenderer;
pub const destroyRenderer = SDL_DestroyRenderer;
pub const renderClear = SDL_RenderClear;
pub const renderPresent = SDL_RenderPresent;
pub const setRenderDrawColor = SDL_SetRenderDrawColor;
pub const renderLine = SDL_RenderLine;
pub const renderFillRect = SDL_RenderFillRect;
pub const createTexture = SDL_CreateTexture;
pub const destroyTexture = SDL_DestroyTexture;
pub const updateTexture = SDL_UpdateTexture;
pub const renderTexture = SDL_RenderTexture;
pub const renderGeometry = SDL_RenderGeometry;
