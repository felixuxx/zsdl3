// SDL3 GPU Bindings
// 3D rendering and compute

const core = @import("core.zig");

// Opaque structs
pub const SDL_GPUDevice = opaque {};
pub const SDL_GPUBuffer = opaque {};
pub const SDL_GPUTransferBuffer = opaque {};
pub const SDL_GPUTexture = opaque {};
pub const SDL_GPUSampler = opaque {};
pub const SDL_GPUShader = opaque {};
pub const SDL_GPUComputePipeline = opaque {};
pub const SDL_GPUGraphicsPipeline = opaque {};
pub const SDL_GPUCommandBuffer = opaque {};
pub const SDL_GPURenderPass = opaque {};
pub const SDL_GPUComputePass = opaque {};
pub const SDL_GPUCopyPass = opaque {};
pub const SDL_GPUFence = opaque {};

// Enums
pub const SDL_GPUPrimitiveType = enum(c_int) {
    SDL_GPU_PRIMITIVETYPE_TRIANGLELIST,
    SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP,
    SDL_GPU_PRIMITIVETYPE_LINELIST,
    SDL_GPU_PRIMITIVETYPE_LINESTRIP,
    SDL_GPU_PRIMITIVETYPE_POINTLIST,
};

pub const SDL_GPULoadOp = enum(c_int) {
    SDL_GPU_LOADOP_LOAD,
    SDL_GPU_LOADOP_CLEAR,
    SDL_GPU_LOADOP_DONT_CARE,
};

pub const SDL_GPUStoreOp = enum(c_int) {
    SDL_GPU_STOREOP_STORE,
    SDL_GPU_STOREOP_DONT_CARE,
    SDL_GPU_STOREOP_RESOLVE,
    SDL_GPU_STOREOP_RESOLVE_AND_STORE,
};

pub const SDL_GPUIndexElementSize = enum(c_int) {
    SDL_GPU_INDEXELEMENTSIZE_16BIT,
    SDL_GPU_INDEXELEMENTSIZE_32BIT,
};

// Basic functions
extern fn SDL_CreateGPUDevice(shader_formats: Uint32, debug_mode: bool, name: ?[*:0]const u8) ?*SDL_GPUDevice;
extern fn SDL_DestroyGPUDevice(device: ?*SDL_GPUDevice) void;
extern fn SDL_ClaimWindowForGPUDevice(device: ?*SDL_GPUDevice, window: ?*video.SDL_Window) bool;
extern fn SDL_ReleaseWindowFromGPUDevice(device: ?*SDL_GPUDevice, window: ?*video.SDL_Window) void;
extern fn SDL_AcquireGPUCommandBuffer(device: ?*SDL_GPUDevice) ?*SDL_GPUCommandBuffer;
extern fn SDL_SubmitGPUCommandBuffer(command_buffer: ?*SDL_GPUCommandBuffer) bool;
extern fn SDL_SubmitGPUCommandBufferAndAcquireFence(command_buffer: ?*SDL_GPUCommandBuffer) ?*SDL_GPUFence;
extern fn SDL_WaitForGPUFences(device: ?*SDL_GPUDevice, wait_all: bool, fences: ?[*]?*SDL_GPUFence, num_fences: Uint32) bool;
extern fn SDL_ReleaseGPUFence(device: ?*SDL_GPUDevice, fence: ?*SDL_GPUFence) void;

// GPU structs
pub const SDL_GPUBufferCreateInfo = extern struct {
    usage: SDL_GPUBufferUsageFlags,
    size: Uint32,
    props: core.SDL_PropertiesID,
};

pub const SDL_GPUBufferUsageFlags = Uint32;
pub const SDL_GPU_BUFFERUSAGE_VERTEX = 1 << 0;
pub const SDL_GPU_BUFFERUSAGE_INDEX = 1 << 1;
pub const SDL_GPU_BUFFERUSAGE_INDIRECT = 1 << 2;
pub const SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ = 1 << 3;
pub const SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ = 1 << 4;
pub const SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE = 1 << 5;

pub const SDL_GPUTextureCreateInfo = extern struct {
    type: SDL_GPUTextureType,
    format: SDL_GPUTextureFormat,
    usage: SDL_GPUTextureUsageFlags,
    w: Uint32,
    h: Uint32,
    d: Uint32,
    layer_count_or_depth_plane_count: Uint32,
    num_levels: Uint32,
    sample_count: SDL_GPUSampleCount,
    props: core.SDL_PropertiesID,
};

pub const SDL_GPUTextureType = enum(c_int) {
    SDL_GPU_TEXTURETYPE_2D,
    SDL_GPU_TEXTURETYPE_2D_ARRAY,
    SDL_GPU_TEXTURETYPE_3D,
    SDL_GPU_TEXTURETYPE_CUBE,
    SDL_GPU_TEXTURETYPE_CUBE_ARRAY,
};

pub const SDL_GPUTextureFormat = enum(c_int) {
    SDL_GPU_TEXTUREFORMAT_INVALID = -1,
    SDL_GPU_TEXTUREFORMAT_R8_UNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8_UNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM,
    SDL_GPU_TEXTUREFORMAT_R16_UNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16_UNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM,
    SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM,
    SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM,
    SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM,
    SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM,
    SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT,
    SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT,
    SDL_GPU_TEXTUREFORMAT_R8_SNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8_SNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM,
    SDL_GPU_TEXTUREFORMAT_R16_SNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16_SNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM,
    SDL_GPU_TEXTUREFORMAT_R16_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R32_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT,
    SDL_GPU_TEXTUREFORMAT_R8_UINT,
    SDL_GPU_TEXTUREFORMAT_R8G8_UINT,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT,
    SDL_GPU_TEXTUREFORMAT_R16_UINT,
    SDL_GPU_TEXTUREFORMAT_R16G16_UINT,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT,
    SDL_GPU_TEXTUREFORMAT_R32_UINT,
    SDL_GPU_TEXTUREFORMAT_R32G32_UINT,
    SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT,
    SDL_GPU_TEXTUREFORMAT_R8_INT,
    SDL_GPU_TEXTUREFORMAT_R8G8_INT,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT,
    SDL_GPU_TEXTUREFORMAT_R16_INT,
    SDL_GPU_TEXTUREFORMAT_R16G16_INT,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT,
    SDL_GPU_TEXTUREFORMAT_R32_INT,
    SDL_GPU_TEXTUREFORMAT_R32G32_INT,
    SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SRGB,
    SDL_GPU_TEXTUREFORMAT_B8G8R8A8_SRGB,
    SDL_GPU_TEXTUREFORMAT_BC1_RGBA_SRGB,
    SDL_GPU_TEXTUREFORMAT_BC2_RGBA_SRGB,
    SDL_GPU_TEXTUREFORMAT_BC3_RGBA_SRGB,
    SDL_GPU_TEXTUREFORMAT_BC7_RGBA_SRGB,
    SDL_GPU_TEXTUREFORMAT_D16_UNORM,
    SDL_GPU_TEXTUREFORMAT_D24_UNORM,
    SDL_GPU_TEXTUREFORMAT_D32_FLOAT,
    SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT,
    SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT,
};

pub const SDL_GPUTextureUsageFlags = Uint32;
pub const SDL_GPU_TEXTUREUSAGE_SAMPLER = 1 << 0;
pub const SDL_GPU_TEXTUREUSAGE_COLOR_TARGET = 1 << 1;
pub const SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET = 1 << 2;
pub const SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ = 1 << 3;
pub const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ = 1 << 4;
pub const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE = 1 << 5;
pub const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE = 1 << 6;

pub const SDL_GPUSampleCount = enum(c_int) {
    SDL_GPU_SAMPLECOUNT_1,
    SDL_GPU_SAMPLECOUNT_2,
    SDL_GPU_SAMPLECOUNT_4,
    SDL_GPU_SAMPLECOUNT_8,
};

pub const SDL_GPUSamplerCreateInfo = extern struct {
    min_filter: SDL_GPUFilter,
    mag_filter: SDL_GPUFilter,
    mipmap_mode: SDL_GPUSamplerMipmapMode,
    address_mode_u: SDL_GPUSamplerAddressMode,
    address_mode_v: SDL_GPUSamplerAddressMode,
    address_mode_w: SDL_GPUSamplerAddressMode,
    mip_lod_bias: f32,
    max_anisotropy: f32,
    compare_op: SDL_GPUCompareOp,
    min_lod: f32,
    max_lod: f32,
    enable_anisotropy: bool,
    enable_compare: bool,
    padding: [2]Uint8,
    props: core.SDL_PropertiesID,
};

pub const SDL_GPUFilter = enum(c_int) {
    SDL_GPU_FILTER_NEAREST,
    SDL_GPU_FILTER_LINEAR,
};

pub const SDL_GPUSamplerMipmapMode = enum(c_int) {
    SDL_GPU_SAMPLERMIPMAPMODE_NEAREST,
    SDL_GPU_SAMPLERMIPMAPMODE_LINEAR,
};

pub const SDL_GPUSamplerAddressMode = enum(c_int) {
    SDL_GPU_SAMPLERADDRESSMODE_REPEAT,
    SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT,
    SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE,
};

pub const SDL_GPUCompareOp = enum(c_int) {
    SDL_GPU_COMPAREOP_NEVER,
    SDL_GPU_COMPAREOP_LESS,
    SDL_GPU_COMPAREOP_EQUAL,
    SDL_GPU_COMPAREOP_LESS_OR_EQUAL,
    SDL_GPU_COMPAREOP_GREATER,
    SDL_GPU_COMPAREOP_NOT_EQUAL,
    SDL_GPU_COMPAREOP_GREATER_OR_EQUAL,
    SDL_GPU_COMPAREOP_ALWAYS,
};

pub const SDL_GPUShaderCreateInfo = extern struct {
    code_size: usize,
    code: ?[*]const Uint8,
    entrypoint: ?[*:0]const u8,
    format: Uint32,
    stage: SDL_GPUShaderStage,
    num_samplers: Uint32,
    num_storage_textures: Uint32,
    num_storage_buffers: Uint32,
    num_uniform_buffers: Uint32,
    props: core.SDL_PropertiesID,
};

pub const SDL_GPUShaderStage = enum(c_int) {
    SDL_GPU_SHADERSTAGE_VERTEX,
    SDL_GPU_SHADERSTAGE_FRAGMENT,
};

pub const SDL_GPUTransferBufferCreateInfo = extern struct {
    usage: SDL_GPUTransferBufferUsage,
    size: Uint32,
    props: core.SDL_PropertiesID,
};

pub const SDL_GPUTransferBufferUsage = enum(c_int) {
    SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD,
    SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD,
};

pub const SDL_GPUTextureTransferInfo = extern struct {
    transfer_buffer: ?*SDL_GPUTransferBuffer,
    offset: Uint32,
    pixels_per_row: Uint32,
    pixels_per_row_padding: Uint32,
};

pub const SDL_GPUTransferBufferLocation = extern struct {
    transfer_buffer: ?*SDL_GPUTransferBuffer,
    offset: Uint32,
};

pub const SDL_GPUTextureRegion = extern struct {
    texture: ?*SDL_GPUTexture,
    mip_level: Uint32,
    layer: Uint32,
    x: Uint32,
    y: Uint32,
    z: Uint32,
    w: Uint32,
    h: Uint32,
    d: Uint32,
};

pub const SDL_GPUBufferRegion = extern struct {
    buffer: ?*SDL_GPUBuffer,
    offset: Uint32,
    size: Uint32,
};

pub const SDL_GPUColorTargetInfo = extern struct {
    texture: ?*SDL_GPUTexture,
    mip_level: Uint32,
    layer_or_depth_plane: Uint32,
    clear_color: SDL_FColor,
    load_op: SDL_GPULoadOp,
    store_op: SDL_GPUStoreOp,
    cycle: bool,
    cycle_resolve_texture: ?*SDL_GPUTexture,
    padding: [3]Uint8,
};

pub const SDL_GPUDepthStencilTargetInfo = extern struct {
    texture: ?*SDL_GPUTexture,
    clear_depth: f32,
    load_op: SDL_GPULoadOp,
    store_op: SDL_GPUStoreOp,
    stencil_load_op: SDL_GPULoadOp,
    stencil_store_op: SDL_GPUStoreOp,
    cycle: bool,
    clear_stencil: Uint8,
    padding: [3]Uint8,
};

pub const SDL_GPUViewport = extern struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,
    min_depth: f32,
    max_depth: f32,
};

pub const SDL_GPUBufferBinding = extern struct {
    buffer: ?*SDL_GPUBuffer,
    offset: Uint32,
};

// Buffer functions
extern fn SDL_CreateGPUBuffer(device: ?*SDL_GPUDevice, create_info: ?*const SDL_GPUBufferCreateInfo) ?*SDL_GPUBuffer;
extern fn SDL_SetGPUBufferName(device: ?*SDL_GPUDevice, buffer: ?*SDL_GPUBuffer, text: ?[*:0]const u8) void;
extern fn SDL_GetGPUBufferSizeInBytes(device: ?*SDL_GPUDevice, buffer: ?*SDL_GPUBuffer) Uint32;
extern fn SDL_ReleaseGPUBuffer(device: ?*SDL_GPUDevice, buffer: ?*SDL_GPUBuffer) void;

// Texture functions
extern fn SDL_CreateGPUTexture(device: ?*SDL_GPUDevice, create_info: ?*const SDL_GPUTextureCreateInfo) ?*SDL_GPUTexture;
extern fn SDL_SetGPUTextureName(device: ?*SDL_GPUDevice, texture: ?*SDL_GPUTexture, text: ?[*:0]const u8) void;
extern fn SDL_GetGPUTextureSize(device: ?*SDL_GPUDevice, texture: ?*SDL_GPUTexture, w: ?*Uint32, h: ?*Uint32, d: ?*Uint32) void;
extern fn SDL_ReleaseGPUTexture(device: ?*SDL_GPUDevice, texture: ?*SDL_GPUTexture) void;

// Sampler functions
extern fn SDL_CreateGPUSampler(device: ?*SDL_GPUDevice, create_info: ?*const SDL_GPUSamplerCreateInfo) ?*SDL_GPUSampler;
extern fn SDL_ReleaseGPUSampler(device: ?*SDL_GPUDevice, sampler: ?*SDL_GPUSampler) void;

// Shader functions
extern fn SDL_CreateGPUShader(device: ?*SDL_GPUDevice, create_info: ?*const SDL_GPUShaderCreateInfo) ?*SDL_GPUShader;
extern fn SDL_ReleaseGPUShader(device: ?*SDL_GPUDevice, shader: ?*SDL_GPUShader) void;

// Transfer buffer functions
extern fn SDL_CreateGPUTransferBuffer(device: ?*SDL_GPUDevice, create_info: ?*const SDL_GPUTransferBufferCreateInfo) ?*SDL_GPUTransferBuffer;
extern fn SDL_MapGPUTransferBuffer(device: ?*SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer, cycle: bool) ?*anyopaque;
extern fn SDL_UnmapGPUTransferBuffer(device: ?*SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer) void;
extern fn SDL_ReleaseGPUTransferBuffer(device: ?*SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer) void;

// Upload/Download functions
extern fn SDL_BeginGPUCopyPass(cmdbuf: ?*SDL_GPUCommandBuffer) ?*SDL_GPUCopyPass;
extern fn SDL_UploadToGPUTexture(cmdbuf: ?*SDL_GPUCommandBuffer, copy_pass: ?*SDL_GPUCopyPass, source: ?*const SDL_GPUTextureTransferInfo, destination: ?*const SDL_GPUTextureRegion, cycle: bool) bool;
extern fn SDL_UploadToGPUBuffer(cmdbuf: ?*SDL_GPUCommandBuffer, copy_pass: ?*SDL_GPUCopyPass, source: ?*const SDL_GPUTransferBufferLocation, destination: ?*const SDL_GPUBufferRegion, cycle: bool) bool;
extern fn SDL_EndGPUCopyPass(copy_pass: ?*SDL_GPUCopyPass) void;

// Render pass functions
extern fn SDL_BeginGPURenderPass(cmdbuf: ?*SDL_GPUCommandBuffer, color_target_infos: ?[*]const SDL_GPUColorTargetInfo, num_color_targets: Uint32, depth_stencil_target_info: ?*const SDL_GPUDepthStencilTargetInfo) ?*SDL_GPURenderPass;
extern fn SDL_BindGPUGraphicsPipeline(render_pass: ?*SDL_GPURenderPass, graphics_pipeline: ?*SDL_GPUGraphicsPipeline) void;
extern fn SDL_SetGPUViewport(render_pass: ?*SDL_GPURenderPass, viewport: ?*const SDL_GPUViewport) void;
extern fn SDL_SetGPUScissor(render_pass: ?*SDL_GPURenderPass, scissor: ?*const SDL_Rect) void;
extern fn SDL_BindGPUVertexBuffers(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, bindings: ?[*]const SDL_GPUBufferBinding, num_bindings: Uint32) void;
extern fn SDL_BindGPUIndexBuffer(render_pass: ?*SDL_GPURenderPass, binding: ?*const SDL_GPUBufferBinding, index_element_size: SDL_GPUIndexElementSize) void;
extern fn SDL_DrawGPUIndexedPrimitives(render_pass: ?*SDL_GPURenderPass, num_indices: Uint32, num_instances: Uint32, first_index: Uint32, vertex_offset: Sint32, first_instance: Uint32) void;
extern fn SDL_EndGPURenderPass(render_pass: ?*SDL_GPURenderPass) void;

// video import
const video = @import("video.zig");
const render = @import("render.zig");
const pixels = @import("pixels.zig");

// Import types
pub const SDL_FColor = render.SDL_FColor;
pub const SDL_Rect = pixels.SDL_Rect;

// Import types
pub const Uint8 = core.Uint8;
pub const Uint32 = core.Uint32;
pub const Sint32 = core.Sint32;

// Shader formats
pub const SDL_GPU_SHADERFORMAT_INVALID = 0;
pub const SDL_GPU_SHADERFORMAT_PRIVATE = 1 << 0;
pub const SDL_GPU_SHADERFORMAT_SPIRV = 1 << 1;
pub const SDL_GPU_SHADERFORMAT_DXBC = 1 << 2;
pub const SDL_GPU_SHADERFORMAT_DXIL = 1 << 3;
pub const SDL_GPU_SHADERFORMAT_MSL = 1 << 4;
pub const SDL_GPU_SHADERFORMAT_METALLIB = 1 << 5;

// Public API
pub const createGPUDevice = SDL_CreateGPUDevice;
pub const destroyGPUDevice = SDL_DestroyGPUDevice;
pub const claimWindowForGPUDevice = SDL_ClaimWindowForGPUDevice;
pub const releaseWindowFromGPUDevice = SDL_ReleaseWindowFromGPUDevice;
pub const acquireGPUCommandBuffer = SDL_AcquireGPUCommandBuffer;
pub const submitGPUCommandBuffer = SDL_SubmitGPUCommandBuffer;
pub const submitGPUCommandBufferAndAcquireFence = SDL_SubmitGPUCommandBufferAndAcquireFence;
pub const waitForGPUFences = SDL_WaitForGPUFences;
pub const releaseGPUFence = SDL_ReleaseGPUFence;
pub const createGPUBuffer = SDL_CreateGPUBuffer;
pub const setGPUBufferName = SDL_SetGPUBufferName;
pub const getGPUBufferSizeInBytes = SDL_GetGPUBufferSizeInBytes;
pub const releaseGPUBuffer = SDL_ReleaseGPUBuffer;
pub const createGPUTexture = SDL_CreateGPUTexture;
pub const setGPUTextureName = SDL_SetGPUTextureName;
pub const getGPUTextureSize = SDL_GetGPUTextureSize;
pub const releaseGPUTexture = SDL_ReleaseGPUTexture;
pub const createGPUSampler = SDL_CreateGPUSampler;
pub const releaseGPUSampler = SDL_ReleaseGPUSampler;
pub const createGPUShader = SDL_CreateGPUShader;
pub const releaseGPUShader = SDL_ReleaseGPUShader;
pub const createGPUTransferBuffer = SDL_CreateGPUTransferBuffer;
pub const mapGPUTransferBuffer = SDL_MapGPUTransferBuffer;
pub const unmapGPUTransferBuffer = SDL_UnmapGPUTransferBuffer;
pub const releaseGPUTransferBuffer = SDL_ReleaseGPUTransferBuffer;
pub const beginGPUCopyPass = SDL_BeginGPUCopyPass;
pub const uploadToGPUTexture = SDL_UploadToGPUTexture;
pub const uploadToGPUBuffer = SDL_UploadToGPUBuffer;
pub const endGPUCopyPass = SDL_EndGPUCopyPass;
pub const beginGPURenderPass = SDL_BeginGPURenderPass;
pub const bindGPUGraphicsPipeline = SDL_BindGPUGraphicsPipeline;
pub const setGPUViewport = SDL_SetGPUViewport;
pub const setGPUScissor = SDL_SetGPUScissor;
pub const bindGPUVertexBuffers = SDL_BindGPUVertexBuffers;
pub const bindGPUIndexBuffer = SDL_BindGPUIndexBuffer;
pub const drawGPUIndexedPrimitives = SDL_DrawGPUIndexedPrimitives;
pub const endGPURenderPass = SDL_EndGPURenderPass;
