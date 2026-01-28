// SDL3 Sensor Bindings
// Accelerometer and gyroscope input

const core = @import("core.zig");

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
extern fn SDL_GetSensors(count: ?*c_int) ?[*]core.SDL_SensorID;
extern fn SDL_GetSensorNameForID(instance_id: core.SDL_SensorID) ?[*:0]const u8;
extern fn SDL_GetSensorTypeForID(instance_id: core.SDL_SensorID) SDL_SensorType;
extern fn SDL_GetSensorNonPortableTypeForID(instance_id: core.SDL_SensorID) c_int;
extern fn SDL_OpenSensor(instance_id: core.SDL_SensorID) ?*SDL_Sensor;
extern fn SDL_GetSensorFromID(instance_id: core.SDL_SensorID) ?*SDL_Sensor;
extern fn SDL_GetSensorID(sensor: ?*SDL_Sensor) core.SDL_SensorID;
extern fn SDL_GetSensorName(sensor: ?*SDL_Sensor) ?[*:0]const u8;
extern fn SDL_GetSensorType(sensor: ?*SDL_Sensor) SDL_SensorType;
extern fn SDL_GetSensorNonPortableType(sensor: ?*SDL_Sensor) c_int;
extern fn SDL_IsSensorEnabled(sensor: ?*SDL_Sensor) bool;
extern fn SDL_GetSensorData(sensor: ?*SDL_Sensor, data: ?[*]f32, num_values: c_int) bool;
extern fn SDL_GetSensorProperties(sensor: ?*SDL_Sensor) core.SDL_PropertiesID;
extern fn SDL_SetSensorEnabled(sensor: ?*SDL_Sensor, enabled: bool) bool;
extern fn SDL_CloseSensor(sensor: ?*SDL_Sensor) void;
extern fn SDL_UpdateSensors() void;

// Public API
pub const getSensors = SDL_GetSensors;
pub const getSensorNameForID = SDL_GetSensorNameForID;
pub const getSensorTypeForID = SDL_GetSensorTypeForID;
pub const getSensorNonPortableTypeForID = SDL_GetSensorNonPortableTypeForID;
pub const openSensor = SDL_OpenSensor;
pub const getSensorFromID = SDL_GetSensorFromID;
pub const getSensorID = SDL_GetSensorID;
pub const getSensorName = SDL_GetSensorName;
pub const getSensorType = SDL_GetSensorType;
pub const getSensorNonPortableType = SDL_GetSensorNonPortableType;
pub const isSensorEnabled = SDL_IsSensorEnabled;
pub const getSensorData = SDL_GetSensorData;
pub const getSensorProperties = SDL_GetSensorProperties;
pub const setSensorEnabled = SDL_SetSensorEnabled;
pub const closeSensor = SDL_CloseSensor;
pub const updateSensors = SDL_UpdateSensors;
