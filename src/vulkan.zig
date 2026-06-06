// SDL3 Vulkan Bindings
// Vulkan graphics interop

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");
const video = @import("video.zig");

// Import types
pub const Uint32 = core.Uint32;

// Vulkan function pointer type for vkGetInstanceProcAddr
pub const PFN_vkGetInstanceProcAddr = ?*const fn (?*anyopaque, ?[*:0]const u8) callconv(.c) ?*anyopaque;

// Vulkan functions
pub const PFN_SDL_Vulkan_LoadLibrary = *const fn (path: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_Vulkan_GetVkGetInstanceProcAddr = *const fn () callconv(.c) ?PFN_vkGetInstanceProcAddr;
pub const PFN_SDL_Vulkan_UnloadLibrary = *const fn () callconv(.c) void;
pub const PFN_SDL_Vulkan_GetInstanceExtensions = *const fn (count: ?*Uint32) callconv(.c) ?[*]const [*:0]const u8;
pub const PFN_SDL_Vulkan_CreateSurface = *const fn (window: ?*video.SDL_Window, instance: ?*anyopaque, allocator: ?*const anyopaque, surface: *?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_Vulkan_DestroySurface = *const fn (instance: ?*anyopaque, surface: ?*anyopaque, allocator: ?*const anyopaque) callconv(.c) void;
pub const PFN_SDL_Vulkan_GetPresentationSupport = *const fn (instance: ?*anyopaque, physicalDevice: ?*anyopaque, queueFamilyIndex: Uint32) callconv(.c) bool;

pub const VulkanFunctions = struct {
    loadLibrary: PFN_SDL_Vulkan_LoadLibrary,
    getVkGetInstanceProcAddr: PFN_SDL_Vulkan_GetVkGetInstanceProcAddr,
    unloadLibrary: PFN_SDL_Vulkan_UnloadLibrary,
    getInstanceExtensions: PFN_SDL_Vulkan_GetInstanceExtensions,
    createSurface: PFN_SDL_Vulkan_CreateSurface,
    destroySurface: PFN_SDL_Vulkan_DestroySurface,
    getPresentationSupport: PFN_SDL_Vulkan_GetPresentationSupport,

    pub fn load(handle: dynamic.LibraryHandle) !VulkanFunctions {
        return dynamic.loadFunctions(VulkanFunctions, handle, "SDL_", .{
            .{ "loadLibrary", "SDL_Vulkan_LoadLibrary" },
            .{ "getVkGetInstanceProcAddr", "SDL_Vulkan_GetVkGetInstanceProcAddr" },
            .{ "unloadLibrary", "SDL_Vulkan_UnloadLibrary" },
            .{ "getInstanceExtensions", "SDL_Vulkan_GetInstanceExtensions" },
            .{ "createSurface", "SDL_Vulkan_CreateSurface" },
            .{ "destroySurface", "SDL_Vulkan_DestroySurface" },
            .{ "getPresentationSupport", "SDL_Vulkan_GetPresentationSupport" },
        }, &.{});
    }
};
