const core = @import("core.zig");

pub const SDL_CameraDeviceID = core.Uint32;
pub const SDL_CameraDevice = opaque {};

pub const SDL_CameraSpec = extern struct {
    format: core.Uint32,
    width: c_int,
    height: c_int,
    fps: f32,
};

extern fn SDL_GetNumCameraDrivers() c_int;
extern fn SDL_GetCameraDriver(index: c_int) ?[*:0]const u8;
extern fn SDL_GetCameraDevices(count: ?*c_int) ?[*]SDL_CameraDeviceID;
extern fn SDL_GetCameraDeviceName(device_id: SDL_CameraDeviceID) ?[*:0]const u8;
extern fn SDL_OpenCameraDevice(device_id: SDL_CameraDeviceID, spec: ?*const SDL_CameraSpec) ?*SDL_CameraDevice;
extern fn SDL_CloseCameraDevice(device: ?*SDL_CameraDevice) void;
extern fn SDL_GetCameraSpec(device: ?*SDL_CameraDevice, spec: ?*SDL_CameraSpec) bool;
extern fn SDL_StartCamera(device: ?*SDL_CameraDevice) bool;
extern fn SDL_StopCamera(device: ?*SDL_CameraDevice) void;
extern fn SDL_GetCameraFrame(device: ?*SDL_CameraDevice, pixels: ?*anyopaque, pitch: c_int) bool;

// Public API
pub const getNumCameraDrivers = SDL_GetNumCameraDrivers;
pub const getCameraDriver = SDL_GetCameraDriver;
pub const getCameraDevices = SDL_GetCameraDevices;
pub const getCameraDeviceName = SDL_GetCameraDeviceName;
pub const openCameraDevice = SDL_OpenCameraDevice;
pub const closeCameraDevice = SDL_CloseCameraDevice;
pub const getCameraSpec = SDL_GetCameraSpec;
pub const startCamera = SDL_StartCamera;
pub const stopCamera = SDL_StopCamera;
pub const getCameraFrame = SDL_GetCameraFrame;
