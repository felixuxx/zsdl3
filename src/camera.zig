const core = @import("core.zig");
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

extern fn SDL_GetNumCameraDrivers() c_int;
extern fn SDL_GetCameraDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetCurrentCameraDriver() ?[*:0]const u8;
extern fn SDL_GetCameras(count: ?*c_int) ?[*]SDL_CameraID;
extern fn SDL_GetCameraSupportedFormats(instance_id: SDL_CameraID, count: ?*c_int) ?[*]?*SDL_CameraSpec;
extern fn SDL_GetCameraName(instance_id: SDL_CameraID) ?[*:0]const u8;
extern fn SDL_GetCameraPosition(instance_id: SDL_CameraID) SDL_CameraPosition;
extern fn SDL_OpenCamera(instance_id: SDL_CameraID, spec: ?*const SDL_CameraSpec) ?*SDL_Camera;
extern fn SDL_GetCameraPermissionState(camera: ?*SDL_Camera) SDL_CameraPermissionState;
extern fn SDL_GetCameraID(camera: ?*SDL_Camera) SDL_CameraID;
extern fn SDL_GetCameraProperties(camera: ?*SDL_Camera) core.SDL_PropertiesID;
extern fn SDL_GetCameraFormat(camera: ?*SDL_Camera, spec: ?*SDL_CameraSpec) bool;
extern fn SDL_AcquireCameraFrame(camera: ?*SDL_Camera, timestamp: ?*core.Uint64) ?*surface.SDL_Surface;
extern fn SDL_ReleaseCameraFrame(camera: ?*SDL_Camera, frame: ?*surface.SDL_Surface) void;
extern fn SDL_CloseCamera(camera: ?*SDL_Camera) void;

// Public API
pub const getNumCameraDrivers = SDL_GetNumCameraDrivers;
pub const getCameraDriver = SDL_GetCameraDriver;
pub const getCurrentCameraDriver = SDL_GetCurrentCameraDriver;
pub const getCameras = SDL_GetCameras;
pub const getCameraSupportedFormats = SDL_GetCameraSupportedFormats;
pub const getCameraName = SDL_GetCameraName;
pub const getCameraPosition = SDL_GetCameraPosition;
pub const openCamera = SDL_OpenCamera;
pub const getCameraPermissionState = SDL_GetCameraPermissionState;
pub const getCameraID = SDL_GetCameraID;
pub const getCameraProperties = SDL_GetCameraProperties;
pub const getCameraFormat = SDL_GetCameraFormat;
pub const acquireCameraFrame = SDL_AcquireCameraFrame;
pub const releaseCameraFrame = SDL_ReleaseCameraFrame;
pub const closeCamera = SDL_CloseCamera;
