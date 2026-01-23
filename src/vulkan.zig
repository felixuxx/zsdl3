// SDL3 Vulkan Bindings
// Vulkan graphics interop

const core = @import("core.zig");
const video = @import("video.zig");

// Import types
pub const Uint32 = core.Uint32;

// Vulkan functions
extern fn SDL_Vulkan_LoadLibrary(path: ?[*:0]const u8) bool;
extern fn SDL_Vulkan_GetVkGetInstanceProcAddr() ?*const fn () callconv(.C) void;
extern fn SDL_Vulkan_UnloadLibrary() void;
extern fn SDL_Vulkan_GetInstanceExtensions(count: ?*Uint32) ?[*]const ?[*:0]const u8;
extern fn SDL_Vulkan_CreateSurface(window: ?*video.SDL_Window, instance: ?*anyopaque, surface: ?*?*anyopaque) bool;
extern fn SDL_Vulkan_DestroySurface(instance: ?*anyopaque, surface: ?*anyopaque, allocator: ?*const anyopaque) void;
extern fn SDL_Vulkan_GetPresentationSupport(instance: ?*anyopaque, physicalDevice: ?*anyopaque, queueFamilyIndex: Uint32) bool;

// Public API
pub const loadLibrary = SDL_Vulkan_LoadLibrary;
pub const getVkGetInstanceProcAddr = SDL_Vulkan_GetVkGetInstanceProcAddr;
pub const unloadLibrary = SDL_Vulkan_UnloadLibrary;
pub const getInstanceExtensions = SDL_Vulkan_GetInstanceExtensions;
pub const createSurface = SDL_Vulkan_CreateSurface;
pub const destroySurface = SDL_Vulkan_DestroySurface;
pub const getPresentationSupport = SDL_Vulkan_GetPresentationSupport;
