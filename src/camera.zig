const core = @import("core.zig");

pub const SDL_CameraDeviceID = core.Uint32;

extern fn SDL_GetCameraDevices(count: ?*c_int) ?[*]SDL_CameraDeviceID;
extern fn SDL_GetCameraDeviceName(device_id: SDL_CameraDeviceID) ?[*:0]const u8;
extern fn SDL_OpenCameraDevice(device_id: SDL_CameraDeviceID) ?*SDL_CameraDevice;
extern fn SDL_CloseCameraDevice(device: ?*SDL_CameraDevice) void;

pub const SDL_CameraDevice = opaque {};
