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

// GPU driver functions
extern fn SDL_GetNumGPUDrivers() c_int;
extern fn SDL_GetGPUDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetGPUDeviceDriver(device: ?*SDL_GPUDevice) ?[*:0]const u8;

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

// Additional structs
pub const SDL_GPUGraphicsPipelineCreateInfo = extern struct {
    vertex_shader: ?*SDL_GPUShader,
    fragment_shader: ?*SDL_GPUShader,
    vertex_input_state: SDL_GPUVertexInputState,
    primitive_type: SDL_GPUPrimitiveType,
    rasterizer_state: SDL_GPURasterizerState,
    multisample_state: SDL_GPUMultisampleState,
    depth_stencil_state: SDL_GPUDepthStencilState,
    target_info: SDL_GPUGraphicsPipelineTargetInfo,
    props: core.SDL_PropertiesID,
};

pub const SDL_GPUVertexInputState = extern struct {
    vertex_buffer_descriptions: ?[*]SDL_GPUVertexBufferDescription,
    num_vertex_buffers: Uint32,
    vertex_attributes: ?[*]SDL_GPUVertexAttribute,
    num_vertex_attributes: Uint32,
};

pub const SDL_GPUVertexBufferDescription = extern struct {
    slot: Uint32,
    pitch: Uint32,
    input_rate: SDL_GPUVertexInputRate,
    instance_step_rate: Uint32,
};

pub const SDL_GPUVertexInputRate = enum(c_int) {
    SDL_GPU_VERTEXINPUTRATE_VERTEX,
    SDL_GPU_VERTEXINPUTRATE_INSTANCE,
};

pub const SDL_GPUVertexAttribute = extern struct {
    location: Uint32,
    buffer_slot: Uint32,
    format: SDL_GPUVertexElementFormat,
    offset: Uint32,
};

pub const SDL_GPUVertexElementFormat = enum(c_int) {
    SDL_GPU_VERTEXELEMENTFORMAT_INVALID,
    SDL_GPU_VERTEXELEMENTFORMAT_INT,
    SDL_GPU_VERTEXELEMENTFORMAT_INT2,
    SDL_GPU_VERTEXELEMENTFORMAT_INT3,
    SDL_GPU_VERTEXELEMENTFORMAT_INT4,
    SDL_GPU_VERTEXELEMENTFORMAT_UINT,
    SDL_GPU_VERTEXELEMENTFORMAT_UINT2,
    SDL_GPU_VERTEXELEMENTFORMAT_UINT3,
    SDL_GPU_VERTEXELEMENTFORMAT_UINT4,
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT,
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2,
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3,
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4,
    SDL_GPU_VERTEXELEMENTFORMAT_BYTE2,
    SDL_GPU_VERTEXELEMENTFORMAT_BYTE4,
    SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2,
    SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4,
    SDL_GPU_VERTEXELEMENTFORMAT_SHORT2,
    SDL_GPU_VERTEXELEMENTFORMAT_SHORT4,
    SDL_GPU_VERTEXELEMENTFORMAT_USHORT2,
    SDL_GPU_VERTEXELEMENTFORMAT_USHORT4,
    SDL_GPU_VERTEXELEMENTFORMAT_HALF2,
    SDL_GPU_VERTEXELEMENTFORMAT_HALF4,
};

pub const SDL_GPURasterizerState = extern struct {
    fill_mode: SDL_GPUFillMode,
    cull_mode: SDL_GPUCullMode,
    front_face: SDL_GPUFrontFace,
    depth_bias_constant_factor: f32,
    depth_bias_clamp: f32,
    depth_bias_slope_factor: f32,
    enable_depth_bias: bool,
    enable_depth_clip: bool,
    padding: [2]Uint8,
};

pub const SDL_GPUFillMode = enum(c_int) {
    SDL_GPU_FILLMODE_FILL,
    SDL_GPU_FILLMODE_LINE,
};

pub const SDL_GPUCullMode = enum(c_int) {
    SDL_GPU_CULLMODE_NONE,
    SDL_GPU_CULLMODE_FRONT,
    SDL_GPU_CULLMODE_BACK,
};

pub const SDL_GPUFrontFace = enum(c_int) {
    SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE,
    SDL_GPU_FRONTFACE_CLOCKWISE,
};

pub const SDL_GPUMultisampleState = extern struct {
    sample_count: SDL_GPUSampleCount,
    sample_mask: Uint32,
    enable_mask: bool,
    padding: [3]Uint8,
};

pub const SDL_GPUDepthStencilState = extern struct {
    enable_depth_test: bool,
    enable_depth_write: bool,
    enable_stencil_test: bool,
    compare_op: SDL_GPUCompareOp,
    back_stencil_state: SDL_GPUStencilOpState,
    front_stencil_state: SDL_GPUStencilOpState,
    depth_bounds_min: f32,
    depth_bounds_max: f32,
    enable_depth_bounds: bool,
    write_mask: Uint8,
    padding: [3]Uint8,
};

pub const SDL_GPUStencilOpState = extern struct {
    fail_op: SDL_GPUStencilOp,
    pass_op: SDL_GPUStencilOp,
    depth_fail_op: SDL_GPUStencilOp,
    compare_op: SDL_GPUCompareOp,
    compare_mask: Uint8,
    write_mask: Uint8,
    reference: Uint8,
    padding: Uint8,
};

pub const SDL_GPUStencilOp = enum(c_int) {
    SDL_GPU_STENCILOP_KEEP,
    SDL_GPU_STENCILOP_ZERO,
    SDL_GPU_STENCILOP_REPLACE,
    SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP,
    SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP,
    SDL_GPU_STENCILOP_INVERT,
    SDL_GPU_STENCILOP_INCREMENT_AND_WRAP,
    SDL_GPU_STENCILOP_DECREMENT_AND_WRAP,
};

pub const SDL_GPUGraphicsPipelineTargetInfo = extern struct {
    color_target_descriptions: ?[*]SDL_GPUColorTargetDescription,
    num_color_targets: Uint32,
    depth_stencil_format: SDL_GPUTextureFormat,
    has_depth_stencil_target: bool,
    padding: [3]Uint8,
};

pub const SDL_GPUColorTargetDescription = extern struct {
    format: SDL_GPUTextureFormat,
    blend_state: SDL_GPUColorTargetBlendState,
};

pub const SDL_GPUColorTargetBlendState = extern struct {
    src_color_blendfactor: SDL_GPUBlendFactor,
    dst_color_blendfactor: SDL_GPUBlendFactor,
    color_blend_op: SDL_GPUBlendOp,
    src_alpha_blendfactor: SDL_GPUBlendFactor,
    dst_alpha_blendfactor: SDL_GPUBlendFactor,
    alpha_blend_op: SDL_GPUBlendOp,
    color_write_mask: SDL_GPUColorComponentFlags,
    enable_blend: bool,
    enable_color_write_mask: bool,
    padding: [2]Uint8,
};

pub const SDL_GPUBlendFactor = enum(c_int) {
    SDL_GPU_BLENDFACTOR_ZERO,
    SDL_GPU_BLENDFACTOR_ONE,
    SDL_GPU_BLENDFACTOR_SRC_COLOR,
    SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR,
    SDL_GPU_BLENDFACTOR_DST_COLOR,
    SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR,
    SDL_GPU_BLENDFACTOR_SRC_ALPHA,
    SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,
    SDL_GPU_BLENDFACTOR_DST_ALPHA,
    SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA,
    SDL_GPU_BLENDFACTOR_CONSTANT_COLOR,
    SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR,
    SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE,
};

pub const SDL_GPUBlendOp = enum(c_int) {
    SDL_GPU_BLENDOP_ADD,
    SDL_GPU_BLENDOP_SUBTRACT,
    SDL_GPU_BLENDOP_REVERSE_SUBTRACT,
    SDL_GPU_BLENDOP_MIN,
    SDL_GPU_BLENDOP_MAX,
};

pub const SDL_GPUColorComponentFlags = Uint8;
pub const SDL_GPU_COLORCOMPONENT_R = 1 << 0;
pub const SDL_GPU_COLORCOMPONENT_G = 1 << 1;
pub const SDL_GPU_COLORCOMPONENT_B = 1 << 2;
pub const SDL_GPU_COLORCOMPONENT_A = 1 << 3;

pub const SDL_GPUComputePipelineCreateInfo = extern struct {
    compute_shader: ?*SDL_GPUShader,
    read_only_storage_texture_count: Uint32,
    read_only_storage_buffer_count: Uint32,
    read_write_storage_texture_count: Uint32,
    read_write_storage_buffer_count: Uint32,
    thread_count_x: Uint32,
    thread_count_y: Uint32,
    thread_count_z: Uint32,
    props: core.SDL_PropertiesID,
};

pub const SDL_GPUBlitInfo = extern struct {
    source: SDL_GPUTextureRegion,
    destination: SDL_GPUTextureRegion,
    load_op: SDL_GPULoadOp,
    clear_color: SDL_FColor,
    flip_mode: SDL_GPUFlipMode,
    filter: SDL_GPUFilter,
    cycle: bool,
    padding: [3]Uint8,
};

pub const SDL_GPUFlipMode = enum(c_int) {
    SDL_GPU_FLIPMODE_NONE,
    SDL_GPU_FLIPMODE_HORIZONTAL,
    SDL_GPU_FLIPMODE_VERTICAL,
    SDL_GPU_FLIPMODE_BOTH,
};

pub const SDL_GPUStorageTextureReadWriteBinding = extern struct {
    texture: ?*SDL_GPUTexture,
    mip_level: Uint32,
    layer: Uint32,
    cycle: bool,
    padding: [3]Uint8,
};

pub const SDL_GPUStorageBufferReadWriteBinding = extern struct {
    buffer: ?*SDL_GPUBuffer,
    cycle: bool,
    padding: [3]Uint8,
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
extern fn SDL_CreateGPUVertexBuffer(device: ?*SDL_GPUDevice, create_info: ?*const SDL_GPUBufferCreateInfo) ?*SDL_GPUBuffer;
extern fn SDL_CreateGPUIndexBuffer(device: ?*SDL_GPUDevice, create_info: ?*const SDL_GPUBufferCreateInfo) ?*SDL_GPUBuffer;

// Pipeline functions
extern fn SDL_CreateGPUGraphicsPipeline(device: ?*SDL_GPUDevice, create_info: ?*const SDL_GPUGraphicsPipelineCreateInfo) ?*SDL_GPUGraphicsPipeline;
extern fn SDL_CreateGPUComputePipeline(device: ?*SDL_GPUDevice, create_info: ?*const SDL_GPUComputePipelineCreateInfo) ?*SDL_GPUComputePipeline;
extern fn SDL_ReleaseGPUGraphicsPipeline(device: ?*SDL_GPUDevice, graphics_pipeline: ?*SDL_GPUGraphicsPipeline) void;
extern fn SDL_ReleaseGPUComputePipeline(device: ?*SDL_GPUDevice, compute_pipeline: ?*SDL_GPUComputePipeline) void;

// Compute pass functions
extern fn SDL_BeginGPUComputePass(cmdbuf: ?*SDL_GPUCommandBuffer, storage_texture_bindings: ?[*]const SDL_GPUStorageTextureReadWriteBinding, num_storage_texture_bindings: Uint32, storage_buffer_bindings: ?[*]const SDL_GPUStorageBufferReadWriteBinding, num_storage_buffer_bindings: Uint32) ?*SDL_GPUComputePass;
extern fn SDL_BindGPUComputePipeline(compute_pass: ?*SDL_GPUComputePass, compute_pipeline: ?*SDL_GPUComputePipeline) void;
extern fn SDL_BindGPUComputeStorageTextures(compute_pass: ?*SDL_GPUComputePass, first_slot: Uint32, storage_texture_bindings: ?[*]const SDL_GPUStorageTextureReadWriteBinding, num_bindings: Uint32) void;
extern fn SDL_BindGPUComputeStorageBuffers(compute_pass: ?*SDL_GPUComputePass, first_slot: Uint32, storage_buffer_bindings: ?[*]const SDL_GPUStorageBufferReadWriteBinding, num_bindings: Uint32) void;
extern fn SDL_PushGPUComputeUniformData(cmdbuf: ?*SDL_GPUCommandBuffer, slot_index: Uint32, data: ?*const anyopaque, length: Uint32) void;
extern fn SDL_DispatchGPUCompute(compute_pass: ?*SDL_GPUComputePass, groupcount_x: Uint32, groupcount_y: Uint32, groupcount_z: Uint32) void;
extern fn SDL_DispatchGPUComputeIndirect(compute_pass: ?*SDL_GPUComputePass, buffer: ?*SDL_GPUBuffer, offset: Uint32) void;
extern fn SDL_EndGPUComputePass(compute_pass: ?*SDL_GPUComputePass) void;

// Additional rendering functions
extern fn SDL_BindGPUVertexSamplers(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, samplers: ?[*]?*SDL_GPUSampler) void;
extern fn SDL_BindGPUFragmentSamplers(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, samplers: ?[*]?*SDL_GPUSampler) void;
extern fn SDL_PushGPUVertexUniformData(cmdbuf: ?*SDL_GPUCommandBuffer, slot_index: Uint32, data: ?*const anyopaque, length: Uint32) void;
extern fn SDL_PushGPUFragmentUniformData(cmdbuf: ?*SDL_GPUCommandBuffer, slot_index: Uint32, data: ?*const anyopaque, length: Uint32) void;
extern fn SDL_BlitGPUTexture(cmdbuf: ?*SDL_GPUCommandBuffer, info: ?*const SDL_GPUBlitInfo) bool;
extern fn SDL_GenerateMipmapsForGPUTexture(cmdbuf: ?*SDL_GPUCommandBuffer, texture: ?*SDL_GPUTexture) void;

// Debug functions
extern fn SDL_InsertGPUDebugLabel(cmdbuf: ?*SDL_GPUCommandBuffer, text: ?[*:0]const u8) void;
extern fn SDL_PushGPUDebugGroup(cmdbuf: ?*SDL_GPUCommandBuffer, name: ?[*:0]const u8) void;
extern fn SDL_PopGPUDebugGroup(cmdbuf: ?*SDL_GPUCommandBuffer) void;
extern fn SDL_SetGPUAllowedFramesInFlight(device: ?*SDL_GPUDevice, allowed_frames_in_flight: Uint32) bool;
extern fn SDL_GPUSupportsShaderFormats(device: ?*SDL_GPUDevice, format_flags: Uint32, name: ?[*:0]const u8) bool;
extern fn SDL_GPUSupportsProperties(props: core.SDL_PropertiesID) bool;
extern fn SDL_GPUTextureSupportsFormat(device: ?*SDL_GPUDevice, format: SDL_GPUTextureFormat, type: SDL_GPUTextureType, usage: SDL_GPUTextureUsageFlags) bool;
extern fn SDL_GPUBufferSize(buffer: ?*SDL_GPUBuffer) Uint32;
extern fn SDL_GPUTextureFormatTexelBlockSize(format: SDL_GPUTextureFormat) Uint32;
extern fn SDL_GPUTextureSupportsSampleCount(device: ?*SDL_GPUDevice, format: SDL_GPUTextureFormat, sample_count: SDL_GPUSampleCount) bool;

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
pub const createGPUVertexBuffer = SDL_CreateGPUVertexBuffer;
pub const createGPUIndexBuffer = SDL_CreateGPUIndexBuffer;
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
pub const createGPUGraphicsPipeline = SDL_CreateGPUGraphicsPipeline;
pub const createGPUComputePipeline = SDL_CreateGPUComputePipeline;
pub const releaseGPUGraphicsPipeline = SDL_ReleaseGPUGraphicsPipeline;
pub const releaseGPUComputePipeline = SDL_ReleaseGPUComputePipeline;
pub const beginGPUComputePass = SDL_BeginGPUComputePass;
pub const bindGPUComputePipeline = SDL_BindGPUComputePipeline;
pub const bindGPUComputeStorageTextures = SDL_BindGPUComputeStorageTextures;
pub const bindGPUComputeStorageBuffers = SDL_BindGPUComputeStorageBuffers;
pub const pushGPUComputeUniformData = SDL_PushGPUComputeUniformData;
pub const dispatchGPUCompute = SDL_DispatchGPUCompute;
pub const dispatchGPUComputeIndirect = SDL_DispatchGPUComputeIndirect;
pub const endGPUComputePass = SDL_EndGPUComputePass;
pub const bindGPUVertexSamplers = SDL_BindGPUVertexSamplers;
pub const bindGPUFragmentSamplers = SDL_BindGPUFragmentSamplers;
pub const pushGPUVertexUniformData = SDL_PushGPUVertexUniformData;
pub const pushGPUFragmentUniformData = SDL_PushGPUFragmentUniformData;
pub const blitGPUTexture = SDL_BlitGPUTexture;
pub const generateMipmapsForGPUTexture = SDL_GenerateMipmapsForGPUTexture;
pub const insertGPUDebugLabel = SDL_InsertGPUDebugLabel;
pub const pushGPUDebugGroup = SDL_PushGPUDebugGroup;
pub const popGPUDebugGroup = SDL_PopGPUDebugGroup;
pub const setGPUAllowedFramesInFlight = SDL_SetGPUAllowedFramesInFlight;
pub const gpuSupportsShaderFormats = SDL_GPUSupportsShaderFormats;
pub const gpuSupportsProperties = SDL_GPUSupportsProperties;
pub const gpuTextureSupportsFormat = SDL_GPUTextureSupportsFormat;
pub const gpuBufferSize = SDL_GPUBufferSize;
pub const gpuTextureFormatTexelBlockSize = SDL_GPUTextureFormatTexelBlockSize;
pub const gpuTextureSupportsSampleCount = SDL_GPUTextureSupportsSampleCount;

// GPU driver functions
pub const getNumGPUDrivers = SDL_GetNumGPUDrivers;
pub const getGPUDriver = SDL_GetGPUDriver;
pub const getGPUDeviceDriver = SDL_GetGPUDeviceDriver;

// GPU device properties
pub const SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING = "SDL.gpu.device.driver_name";
pub const SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING = "SDL.gpu.device.driver_version";
pub const SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING = "SDL.gpu.device.driver_info";
