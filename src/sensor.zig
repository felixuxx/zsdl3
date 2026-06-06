// SDL3 Sensor Bindings
// Accelerometer and gyroscope input

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

// Sensor types
pub const SDL_SensorType = enum(c_int) {
    SDL_SENSOR_INVALID = -1,
    SDL_SENSOR_UNKNOWN,
    SDL_SENSOR_ACCEL,
    SDL_SENSOR_GYRO,
    SDL_SENSOR_ACCEL_L,
    SDL_SENSOR_GYRO_L,
    SDL_SENSOR_ACCEL_R,
    SDL_SENSOR_GYRO_R,
};

// Sensor handle
pub const SDL_Sensor = opaque {};

// Sensor functions
pub const PFN_SDL_GetSensors = *const fn (count: ?*c_int) callconv(.c) ?[*]core.SDL_SensorID;
pub const PFN_SDL_GetSensorNameForID = *const fn (instance_id: core.SDL_SensorID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetSensorTypeForID = *const fn (instance_id: core.SDL_SensorID) callconv(.c) SDL_SensorType;
pub const PFN_SDL_GetSensorNonPortableTypeForID = *const fn (instance_id: core.SDL_SensorID) callconv(.c) c_int;
pub const PFN_SDL_OpenSensor = *const fn (instance_id: core.SDL_SensorID) callconv(.c) ?*SDL_Sensor;
pub const PFN_SDL_GetSensorFromID = *const fn (instance_id: core.SDL_SensorID) callconv(.c) ?*SDL_Sensor;
pub const PFN_SDL_GetSensorID = *const fn (sensor: ?*SDL_Sensor) callconv(.c) core.SDL_SensorID;
pub const PFN_SDL_GetSensorName = *const fn (sensor: ?*SDL_Sensor) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetSensorType = *const fn (sensor: ?*SDL_Sensor) callconv(.c) SDL_SensorType;
pub const PFN_SDL_GetSensorNonPortableType = *const fn (sensor: ?*SDL_Sensor) callconv(.c) c_int;
pub const PFN_SDL_IsSensorEnabled = *const fn (sensor: ?*SDL_Sensor) callconv(.c) bool;
pub const PFN_SDL_GetSensorData = *const fn (sensor: ?*SDL_Sensor, data: ?[*]f32, num_values: c_int) callconv(.c) bool;
pub const PFN_SDL_GetSensorProperties = *const fn (sensor: ?*SDL_Sensor) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_SetSensorEnabled = *const fn (sensor: ?*SDL_Sensor, enabled: bool) callconv(.c) bool;
pub const PFN_SDL_CloseSensor = *const fn (sensor: ?*SDL_Sensor) callconv(.c) void;
pub const PFN_SDL_UpdateSensors = *const fn () callconv(.c) void;

pub const SensorFunctions = struct {
    getSensors: PFN_SDL_GetSensors,
    getSensorNameForID: PFN_SDL_GetSensorNameForID,
    getSensorTypeForID: PFN_SDL_GetSensorTypeForID,
    getSensorNonPortableTypeForID: PFN_SDL_GetSensorNonPortableTypeForID,
    openSensor: PFN_SDL_OpenSensor,
    getSensorFromID: PFN_SDL_GetSensorFromID,
    getSensorID: PFN_SDL_GetSensorID,
    getSensorName: PFN_SDL_GetSensorName,
    getSensorType: PFN_SDL_GetSensorType,
    getSensorNonPortableType: PFN_SDL_GetSensorNonPortableType,
    isSensorEnabled: PFN_SDL_IsSensorEnabled,
    getSensorData: PFN_SDL_GetSensorData,
    getSensorProperties: PFN_SDL_GetSensorProperties,
    setSensorEnabled: PFN_SDL_SetSensorEnabled,
    closeSensor: PFN_SDL_CloseSensor,
    updateSensors: PFN_SDL_UpdateSensors,

    pub fn load(handle: dynamic.LibraryHandle) !SensorFunctions {
        return dynamic.loadFunctions(SensorFunctions, handle, "SDL_", .{}, &.{ "isSensorEnabled", "setSensorEnabled" });
    }
};
