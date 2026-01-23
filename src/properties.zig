// SDL3 Properties Bindings
// Key-value storage

const core = @import("core.zig");

// Import types
pub const Sint64 = core.Sint64;

// Properties ID
pub const SDL_PropertiesID = core.SDL_PropertiesID;

// Property types
pub const SDL_PropertyType = enum(c_int) {
    SDL_PROPERTY_TYPE_INVALID,
    SDL_PROPERTY_TYPE_POINTER,
    SDL_PROPERTY_TYPE_STRING,
    SDL_PROPERTY_TYPE_NUMBER,
    SDL_PROPERTY_TYPE_FLOAT,
    SDL_PROPERTY_TYPE_BOOLEAN,
};

// Properties functions
extern fn SDL_CreateProperties() SDL_PropertiesID;
extern fn SDL_DestroyProperties(props: SDL_PropertiesID) void;
extern fn SDL_SetProperty(props: SDL_PropertiesID, name: [*:0]const u8, value: ?*anyopaque) bool;
extern fn SDL_SetStringProperty(props: SDL_PropertiesID, name: [*:0]const u8, value: ?[*:0]const u8) bool;
extern fn SDL_SetNumberProperty(props: SDL_PropertiesID, name: [*:0]const u8, value: Sint64) bool;
extern fn SDL_SetFloatProperty(props: SDL_PropertiesID, name: [*:0]const u8, value: f32) bool;
extern fn SDL_SetBooleanProperty(props: SDL_PropertiesID, name: [*:0]const u8, value: bool) bool;
extern fn SDL_GetProperty(props: SDL_PropertiesID, name: [*:0]const u8) ?*anyopaque;
extern fn SDL_GetStringProperty(props: SDL_PropertiesID, name: [*:0]const u8, default_value: ?[*:0]const u8) ?[*:0]const u8;
extern fn SDL_GetNumberProperty(props: SDL_PropertiesID, name: [*:0]const u8, default_value: Sint64) Sint64;
extern fn SDL_GetFloatProperty(props: SDL_PropertiesID, name: [*:0]const u8, default_value: f32) f32;
extern fn SDL_GetBooleanProperty(props: SDL_PropertiesID, name: [*:0]const u8, default_value: bool) bool;
extern fn SDL_GetPropertyType(props: SDL_PropertiesID, name: [*:0]const u8) SDL_PropertyType;
extern fn SDL_PropertyIterator(props: SDL_PropertiesID, callback: ?*const fn (?*anyopaque, SDL_PropertiesID, [*:0]const u8) callconv(.C) void, userdata: ?*anyopaque) void;
extern fn SDL_ClearProperty(props: SDL_PropertiesID, name: [*:0]const u8) bool;
extern fn SDL_EnumerateProperties(props: SDL_PropertiesID, callback: ?*const fn (?*anyopaque, SDL_PropertiesID, [*:0]const u8) callconv(.C) void, userdata: ?*anyopaque) void;
extern fn SDL_LockProperties(props: SDL_PropertiesID) void;
extern fn SDL_UnlockProperties(props: SDL_PropertiesID) void;

// Public API
pub const createProperties = SDL_CreateProperties;
pub const destroyProperties = SDL_DestroyProperties;
pub const setProperty = SDL_SetProperty;
pub const setStringProperty = SDL_SetStringProperty;
pub const setNumberProperty = SDL_SetNumberProperty;
pub const setFloatProperty = SDL_SetFloatProperty;
pub const setBooleanProperty = SDL_SetBooleanProperty;
pub const getProperty = SDL_GetProperty;
pub const getStringProperty = SDL_GetStringProperty;
pub const getNumberProperty = SDL_GetNumberProperty;
pub const getFloatProperty = SDL_GetFloatProperty;
pub const getBooleanProperty = SDL_GetBooleanProperty;
pub const getPropertyType = SDL_GetPropertyType;
pub const propertyIterator = SDL_PropertyIterator;
pub const clearProperty = SDL_ClearProperty;
pub const enumerateProperties = SDL_EnumerateProperties;
pub const lockProperties = SDL_LockProperties;
pub const unlockProperties = SDL_UnlockProperties;
