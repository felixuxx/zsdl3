// SDL3 Platform Bindings
// Platform detection

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

// Platform functions
pub const PFN_SDL_GetPlatform = *const fn () callconv(.c) ?[*:0]const u8;

pub const PFN_SDL_GetAndroidActivity = *const fn () callconv(.c) ?*anyopaque;
pub const PFN_SDL_GetAndroidCachePath = *const fn () callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetAndroidExternalStoragePath = *const fn () callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetAndroidExternalStorageState = *const fn () callconv(.c) core.Uint32;
pub const PFN_SDL_GetAndroidInternalStoragePath = *const fn () callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetAndroidJNIEnv = *const fn () callconv(.c) ?*anyopaque;
pub const PFN_SDL_GetAndroidSDKVersion = *const fn () callconv(.c) c_int;
pub const PFN_SDL_RequestAndroidPermission = *const fn (permission: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_SendAndroidBackButton = *const fn () callconv(.c) void;
pub const PFN_SDL_SendAndroidMessage = *const fn (msg: ?*anyopaque, data: ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_ShowAndroidToast = *const fn (message: ?[*:0]const u8, duration: c_int) callconv(.c) c_int;
pub const PFN_SDL_SetiOSAnimationCallback = *const fn (window: ?*anyopaque, interval: c_int, callback: ?*const fn (?*anyopaque) callconv(.c) void, userdata: ?*anyopaque) callconv(.c) c_int;
pub const PFN_SDL_SetiOSEventPump = *const fn (enabled: bool) callconv(.c) void;
pub const PFN_SDL_GDKResumeGPU = *const fn () callconv(.c) void;
pub const PFN_SDL_GDKSuspendComplete = *const fn () callconv(.c) void;
pub const PFN_SDL_GDKSuspendGPU = *const fn () callconv(.c) void;
pub const PFN_SDL_GetGDKDefaultUser = *const fn () callconv(.c) ?*anyopaque;
pub const PFN_SDL_GetGDKTaskQueue = *const fn () callconv(.c) ?*anyopaque;
pub const PFN_SDL_OnApplicationDidChangeStatusBarOrientation = *const fn () callconv(.c) void;
pub const PFN_SDL_OnApplicationDidEnterBackground = *const fn () callconv(.c) void;
pub const PFN_SDL_OnApplicationDidEnterForeground = *const fn () callconv(.c) void;
pub const PFN_SDL_OnApplicationDidReceiveMemoryWarning = *const fn () callconv(.c) void;
pub const PFN_SDL_OnApplicationWillEnterBackground = *const fn () callconv(.c) void;
pub const PFN_SDL_OnApplicationWillEnterForeground = *const fn () callconv(.c) void;
pub const PFN_SDL_OnApplicationWillTerminate = *const fn () callconv(.c) void;
pub const PFN_SDL_EnterAppMainCallbacks = *const fn (argc: c_int, argv: [*][*:0]u8, appinit: ?*const fn (?*?*anyopaque, c_int, [*][*:0]u8) callconv(.c) bool, appiter: ?*const fn (?*anyopaque) callconv(.c) bool, appevent: ?*const fn (?*anyopaque, ?*core.SDL_Event) callconv(.c) bool) callconv(.c) bool;
pub const PFN_SDL_RunApp = *const fn (argc: c_int, argv: [*][*:0]u8, main_func: ?*const fn (c_int, [*][*:0]u8) callconv(.c) c_int) callconv(.c) c_int;
pub const PFN_SDL_RegisterApp = *const fn (name: ?[*:0]const u8, style: core.Uint32, hinst: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_UnregisterApp = *const fn () callconv(.c) void;
pub const PFN_SDL_SetMainReady = *const fn () callconv(.c) void;
pub const PFN_SDL_ShouldInit = *const fn (flags: core.Uint32) callconv(.c) core.Uint32;
pub const PFN_SDL_ShouldQuit = *const fn (flags: core.Uint32) callconv(.c) core.Uint32;
pub const PFN_SDL_SetInitialized = *const fn (flags: core.Uint32, initialized: bool) callconv(.c) void;
pub const PFN_SDL_GetSandbox = *const fn () callconv(.c) c_int;
pub const PFN_SDL_IsChromebook = *const fn () callconv(.c) bool;
pub const PFN_SDL_IsDeXMode = *const fn () callconv(.c) bool;
pub const PFN_SDL_IsTV = *const fn () callconv(.c) bool;
pub const PFN_SDL_IsTablet = *const fn () callconv(.c) bool;
pub const PFN_SDL_SetWindowsMessageHook = *const fn (callback: ?*const fn (?*anyopaque, ?*anyopaque) callconv(.c) bool, userdata: ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_SetX11EventHook = *const fn (callback: ?*const fn (?*anyopaque, ?*anyopaque) callconv(.c) bool, userdata: ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_GetDXGIOutputInfo = *const fn (display_id: c_int, adapter_index: ?*c_int, output_index: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_GetDirect3D9AdapterIndex = *const fn (display_id: c_int) callconv(.c) c_int;

pub const PlatformFunctions = struct {
    getPlatform: PFN_SDL_GetPlatform,
    getAndroidActivity: ?PFN_SDL_GetAndroidActivity,
    getAndroidCachePath: ?PFN_SDL_GetAndroidCachePath,
    getAndroidExternalStoragePath: ?PFN_SDL_GetAndroidExternalStoragePath,
    getAndroidExternalStorageState: ?PFN_SDL_GetAndroidExternalStorageState,
    getAndroidInternalStoragePath: ?PFN_SDL_GetAndroidInternalStoragePath,
    getAndroidJNIEnv: ?PFN_SDL_GetAndroidJNIEnv,
    getAndroidSDKVersion: ?PFN_SDL_GetAndroidSDKVersion,
    requestAndroidPermission: ?PFN_SDL_RequestAndroidPermission,
    sendAndroidBackButton: ?PFN_SDL_SendAndroidBackButton,
    sendAndroidMessage: ?PFN_SDL_SendAndroidMessage,
    showAndroidToast: ?PFN_SDL_ShowAndroidToast,
    setiOSAnimationCallback: ?PFN_SDL_SetiOSAnimationCallback,
    setiOSEventPump: ?PFN_SDL_SetiOSEventPump,
    gDKResumeGPU: ?PFN_SDL_GDKResumeGPU,
    gDKSuspendComplete: ?PFN_SDL_GDKSuspendComplete,
    gDKSuspendGPU: ?PFN_SDL_GDKSuspendGPU,
    getGDKDefaultUser: ?PFN_SDL_GetGDKDefaultUser,
    getGDKTaskQueue: ?PFN_SDL_GetGDKTaskQueue,
    onApplicationDidChangeStatusBarOrientation: ?PFN_SDL_OnApplicationDidChangeStatusBarOrientation,
    onApplicationDidEnterBackground: ?PFN_SDL_OnApplicationDidEnterBackground,
    onApplicationDidEnterForeground: ?PFN_SDL_OnApplicationDidEnterForeground,
    onApplicationDidReceiveMemoryWarning: ?PFN_SDL_OnApplicationDidReceiveMemoryWarning,
    onApplicationWillEnterBackground: ?PFN_SDL_OnApplicationWillEnterBackground,
    onApplicationWillEnterForeground: ?PFN_SDL_OnApplicationWillEnterForeground,
    onApplicationWillTerminate: ?PFN_SDL_OnApplicationWillTerminate,
    enterAppMainCallbacks: ?PFN_SDL_EnterAppMainCallbacks,
    runApp: ?PFN_SDL_RunApp,
    registerApp: ?PFN_SDL_RegisterApp,
    unregisterApp: ?PFN_SDL_UnregisterApp,
    setMainReady: ?PFN_SDL_SetMainReady,
    shouldInit: ?PFN_SDL_ShouldInit,
    shouldQuit: ?PFN_SDL_ShouldQuit,
    setInitialized: ?PFN_SDL_SetInitialized,
    getSandbox: ?PFN_SDL_GetSandbox,
    isChromebook: ?PFN_SDL_IsChromebook,
    isDeXMode: ?PFN_SDL_IsDeXMode,
    isTV: ?PFN_SDL_IsTV,
    isTablet: ?PFN_SDL_IsTablet,
    setWindowsMessageHook: ?PFN_SDL_SetWindowsMessageHook,
    setX11EventHook: ?PFN_SDL_SetX11EventHook,
    getDXGIOutputInfo: ?PFN_SDL_GetDXGIOutputInfo,
    getDirect3D9AdapterIndex: ?PFN_SDL_GetDirect3D9AdapterIndex,

    pub fn load(handle: dynamic.LibraryHandle) !PlatformFunctions {
        return dynamic.loadFunctions(PlatformFunctions, handle, "SDL_", .{}, &.{
            "getAndroidActivity", "getAndroidCachePath", "getAndroidExternalStoragePath",
            "getAndroidExternalStorageState", "getAndroidInternalStoragePath", "getAndroidJNIEnv",
            "getAndroidSDKVersion", "requestAndroidPermission", "sendAndroidBackButton",
            "sendAndroidMessage", "showAndroidToast", "setiOSAnimationCallback",
            "setiOSEventPump", "gDKResumeGPU", "gDKSuspendComplete", "gDKSuspendGPU",
            "getGDKDefaultUser", "getGDKTaskQueue", "onApplicationDidChangeStatusBarOrientation",
            "onApplicationDidEnterBackground", "onApplicationDidEnterForeground",
            "onApplicationDidReceiveMemoryWarning", "onApplicationWillEnterBackground",
            "onApplicationWillEnterForeground", "onApplicationWillTerminate",
            "enterAppMainCallbacks", "runApp", "registerApp", "unregisterApp",
            "setMainReady", "shouldInit", "shouldQuit", "setInitialized",
            "getSandbox", "isChromebook", "isDeXMode", "isTV", "isTablet",
            "setWindowsMessageHook", "setX11EventHook", "getDXGIOutputInfo",
            "getDirect3D9AdapterIndex",
        });
    }
};
