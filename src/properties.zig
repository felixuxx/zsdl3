// SDL3 Properties Bindings
// Key-value storage

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

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
pub const PFN_SDL_CreateProperties = *const fn () callconv(.c) SDL_PropertiesID;
pub const PFN_SDL_DestroyProperties = *const fn (props: SDL_PropertiesID) callconv(.c) void;
pub const SDL_CleanupPropertyCallback = ?*const fn (?*anyopaque, ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_SetPointerProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8, value: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_SetPointerPropertyWithCleanup = *const fn (props: SDL_PropertiesID, name: [*:0]const u8, value: ?*anyopaque, cleanup: SDL_CleanupPropertyCallback, userdata: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_SetStringProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8, value: ?[*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_SetNumberProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8, value: Sint64) callconv(.c) bool;
pub const PFN_SDL_SetFloatProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8, value: f32) callconv(.c) bool;
pub const PFN_SDL_SetBooleanProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8, value: bool) callconv(.c) bool;
pub const PFN_SDL_GetPointerProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8, default_value: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const PFN_SDL_GetStringProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8, default_value: ?[*:0]const u8) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetNumberProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8, default_value: Sint64) callconv(.c) Sint64;
pub const PFN_SDL_GetFloatProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8, default_value: f32) callconv(.c) f32;
pub const PFN_SDL_GetBooleanProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8, default_value: bool) callconv(.c) bool;
pub const PFN_SDL_GetPropertyType = *const fn (props: SDL_PropertiesID, name: [*:0]const u8) callconv(.c) SDL_PropertyType;
pub const SDL_EnumeratePropertiesCallback = ?*const fn (?*anyopaque, SDL_PropertiesID, [*:0]const u8) callconv(.c) void;
pub const PFN_SDL_ClearProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_EnumerateProperties = *const fn (props: SDL_PropertiesID, callback: SDL_EnumeratePropertiesCallback, userdata: ?*anyopaque) callconv(.c) bool;
pub const PFN_SDL_LockProperties = *const fn (props: SDL_PropertiesID) callconv(.c) bool;
pub const PFN_SDL_UnlockProperties = *const fn (props: SDL_PropertiesID) callconv(.c) void;
pub const PFN_SDL_HasProperty = *const fn (props: SDL_PropertiesID, name: [*:0]const u8) callconv(.c) bool;
pub const PFN_SDL_CopyProperties = *const fn (src: SDL_PropertiesID, dst: SDL_PropertiesID) callconv(.c) bool;
pub const PFN_SDL_GetGlobalProperties = *const fn () callconv(.c) SDL_PropertiesID;

pub const PropertyFunctions = struct {
    createProperties: PFN_SDL_CreateProperties,
    destroyProperties: PFN_SDL_DestroyProperties,
    setPointerProperty: PFN_SDL_SetPointerProperty,
    setPointerPropertyWithCleanup: PFN_SDL_SetPointerPropertyWithCleanup,
    setStringProperty: PFN_SDL_SetStringProperty,
    setNumberProperty: PFN_SDL_SetNumberProperty,
    setFloatProperty: PFN_SDL_SetFloatProperty,
    setBooleanProperty: PFN_SDL_SetBooleanProperty,
    getPointerProperty: PFN_SDL_GetPointerProperty,
    getStringProperty: PFN_SDL_GetStringProperty,
    getNumberProperty: PFN_SDL_GetNumberProperty,
    getFloatProperty: PFN_SDL_GetFloatProperty,
    getBooleanProperty: PFN_SDL_GetBooleanProperty,
    getPropertyType: PFN_SDL_GetPropertyType,
    clearProperty: PFN_SDL_ClearProperty,
    enumerateProperties: PFN_SDL_EnumerateProperties,
    lockProperties: PFN_SDL_LockProperties,
    unlockProperties: PFN_SDL_UnlockProperties,
    hasProperty: PFN_SDL_HasProperty,
    copyProperties: PFN_SDL_CopyProperties,
    getGlobalProperties: PFN_SDL_GetGlobalProperties,

    pub fn load(handle: dynamic.LibraryHandle) !PropertyFunctions {
        return dynamic.loadFunctions(PropertyFunctions, handle, "SDL_", .{}, &.{});
    }
};
