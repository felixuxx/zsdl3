const core = @import("core.zig");
const dynamic = @import("dynamic.zig");
pub const SDL_CameraID = core.Uint32;
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");

pub const SDL_Camera = opaque {};

pub const SDL_CameraSpec = extern struct {
    format: pixels.SDL_PixelFormat,
    colorspace: core.Uint32, // SDL_Colorspace (Uint32)
    width: c_int,
    height: c_int,
    framerate_numerator: c_int,
    framerate_denominator: c_int,
};

pub const SDL_CameraPosition = enum(c_int) {
    SDL_CAMERA_POSITION_UNKNOWN,
    SDL_CAMERA_POSITION_FRONT_FACING,
    SDL_CAMERA_POSITION_BACK_FACING,
};

pub const SDL_CameraPermissionState = enum(c_int) {
    SDL_CAMERA_PERMISSION_STATE_DENIED = -1,
    SDL_CAMERA_PERMISSION_STATE_PENDING,
    SDL_CAMERA_PERMISSION_STATE_APPROVED,
};

pub const PFN_SDL_GetNumCameraDrivers = *const fn () callconv(.c) c_int;
pub const PFN_SDL_GetCameraDriver = *const fn (index: c_int) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetCurrentCameraDriver = *const fn () callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetCameras = *const fn (count: ?*c_int) callconv(.c) ?[*]SDL_CameraID;
pub const PFN_SDL_GetCameraSupportedFormats = *const fn (instance_id: SDL_CameraID, count: ?*c_int) callconv(.c) ?[*]?*SDL_CameraSpec;
pub const PFN_SDL_GetCameraName = *const fn (instance_id: SDL_CameraID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetCameraPosition = *const fn (instance_id: SDL_CameraID) callconv(.c) SDL_CameraPosition;
pub const PFN_SDL_OpenCamera = *const fn (instance_id: SDL_CameraID, spec: ?*const SDL_CameraSpec) callconv(.c) ?*SDL_Camera;
pub const PFN_SDL_GetCameraPermissionState = *const fn (camera: ?*SDL_Camera) callconv(.c) SDL_CameraPermissionState;
pub const PFN_SDL_GetCameraID = *const fn (camera: ?*SDL_Camera) callconv(.c) SDL_CameraID;
pub const PFN_SDL_GetCameraProperties = *const fn (camera: ?*SDL_Camera) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_GetCameraFormat = *const fn (camera: ?*SDL_Camera, spec: ?*SDL_CameraSpec) callconv(.c) bool;
pub const PFN_SDL_AcquireCameraFrame = *const fn (camera: ?*SDL_Camera, timestamp: ?*core.Uint64) callconv(.c) ?*surface.SDL_Surface;
pub const PFN_SDL_ReleaseCameraFrame = *const fn (camera: ?*SDL_Camera, frame: ?*surface.SDL_Surface) callconv(.c) void;
pub const PFN_SDL_CloseCamera = *const fn (camera: ?*SDL_Camera) callconv(.c) void;

pub const CameraFunctions = struct {
    getNumCameraDrivers: PFN_SDL_GetNumCameraDrivers,
    getCameraDriver: PFN_SDL_GetCameraDriver,
    getCurrentCameraDriver: PFN_SDL_GetCurrentCameraDriver,
    getCameras: PFN_SDL_GetCameras,
    getCameraSupportedFormats: PFN_SDL_GetCameraSupportedFormats,
    getCameraName: PFN_SDL_GetCameraName,
    getCameraPosition: PFN_SDL_GetCameraPosition,
    openCamera: PFN_SDL_OpenCamera,
    getCameraPermissionState: PFN_SDL_GetCameraPermissionState,
    getCameraID: PFN_SDL_GetCameraID,
    getCameraProperties: PFN_SDL_GetCameraProperties,
    getCameraFormat: PFN_SDL_GetCameraFormat,
    acquireCameraFrame: PFN_SDL_AcquireCameraFrame,
    releaseCameraFrame: PFN_SDL_ReleaseCameraFrame,
    closeCamera: PFN_SDL_CloseCamera,

    pub fn load(handle: dynamic.LibraryHandle) !CameraFunctions {
        return dynamic.loadFunctions(CameraFunctions, handle, "SDL_", .{}, &.{});
    }
};
