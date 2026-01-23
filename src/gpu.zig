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

// Placeholder for video import
const video = @import("video.zig");

// Import types
pub const Uint32 = core.Uint32;

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
