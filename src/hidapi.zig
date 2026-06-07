// SDL3 HIDAPI Bindings
// HID device access

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

// Import types
pub const Uint8 = core.Uint8;
pub const Uint16 = core.Uint16;
pub const Uint32 = core.Uint32;

// Placeholder for c_wchar_t
pub const c_wchar_t = u16;

// HID structs
pub const SDL_hid_device = opaque {};

// HID functions
pub const PFN_SDL_hid_init = *const fn () callconv(.c) c_int;
pub const PFN_SDL_hid_exit = *const fn () callconv(.c) c_int;
pub const PFN_SDL_hid_device_change_count = *const fn () callconv(.c) Uint32;
pub const PFN_SDL_hid_enumerate = *const fn (vendor_id: Uint16, product_id: Uint16) callconv(.c) ?*SDL_hid_device_info;
pub const PFN_SDL_hid_free_enumeration = *const fn (devs: ?*SDL_hid_device_info) callconv(.c) void;
pub const PFN_SDL_hid_open = *const fn (vendor_id: Uint16, product_id: Uint16, serial_number: ?*const c_wchar_t) callconv(.c) ?*SDL_hid_device;
pub const PFN_SDL_hid_open_path = *const fn (path: ?[*:0]const u8) callconv(.c) ?*SDL_hid_device;
pub const PFN_SDL_hid_write = *const fn (dev: ?*SDL_hid_device, data: ?*const Uint8, length: usize) callconv(.c) c_int;
pub const PFN_SDL_hid_read_timeout = *const fn (dev: ?*SDL_hid_device, data: ?*Uint8, length: usize, milliseconds: c_int) callconv(.c) c_int;
pub const PFN_SDL_hid_read = *const fn (dev: ?*SDL_hid_device, data: ?*Uint8, length: usize) callconv(.c) c_int;
pub const PFN_SDL_hid_set_nonblocking = *const fn (dev: ?*SDL_hid_device, nonblock: c_int) callconv(.c) c_int;
pub const PFN_SDL_hid_send_feature_report = *const fn (dev: ?*SDL_hid_device, data: ?*const Uint8, length: usize) callconv(.c) c_int;
pub const PFN_SDL_hid_get_feature_report = *const fn (dev: ?*SDL_hid_device, data: ?*Uint8, length: usize) callconv(.c) c_int;
pub const PFN_SDL_hid_close = *const fn (dev: ?*SDL_hid_device) callconv(.c) void;
pub const PFN_SDL_hid_get_manufacturer_string = *const fn (dev: ?*SDL_hid_device, string: ?*c_wchar_t, maxlen: usize) callconv(.c) c_int;
pub const PFN_SDL_hid_get_product_string = *const fn (dev: ?*SDL_hid_device, string: ?*c_wchar_t, maxlen: usize) callconv(.c) c_int;
pub const PFN_SDL_hid_get_serial_number_string = *const fn (dev: ?*SDL_hid_device, string: ?*c_wchar_t, maxlen: usize) callconv(.c) c_int;
pub const PFN_SDL_hid_get_indexed_string = *const fn (dev: ?*SDL_hid_device, string_index: c_int, string: ?*c_wchar_t, maxlen: usize) callconv(.c) c_int;
pub const PFN_SDL_hid_ble_scan = *const fn (scan: bool) callconv(.c) void;
pub const PFN_SDL_hid_get_device_info = *const fn (dev: ?*SDL_hid_device) callconv(.c) ?*SDL_hid_device_info;
pub const PFN_SDL_hid_get_input_report = *const fn (dev: ?*SDL_hid_device, data: ?*Uint8, length: usize) callconv(.c) c_int;
pub const PFN_SDL_hid_get_properties = *const fn (dev: ?*SDL_hid_device) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_hid_get_report_descriptor = *const fn (dev: ?*SDL_hid_device, buf: ?*?*Uint8) callconv(.c) usize;

// HID device info struct
pub const SDL_hid_device_info = extern struct {
    path: ?[*:0]const u8,
    vendor_id: Uint16,
    product_id: Uint16,
    serial_number: ?*const c_wchar_t,
    release_number: Uint16,
    manufacturer_string: ?*const c_wchar_t,
    product_string: ?*const c_wchar_t,
    usage_page: Uint16,
    usage: Uint16,
    interface_number: c_int,
    interface_class: c_int,
    interface_subclass: c_int,
    interface_protocol: c_int,
    next: ?*SDL_hid_device_info,
};

pub const HidapiFunctions = struct {
    hidInit: PFN_SDL_hid_init,
    hidExit: PFN_SDL_hid_exit,
    hidDeviceChangeCount: PFN_SDL_hid_device_change_count,
    hidEnumerate: PFN_SDL_hid_enumerate,
    hidFreeEnumeration: PFN_SDL_hid_free_enumeration,
    hidOpen: PFN_SDL_hid_open,
    hidOpenPath: PFN_SDL_hid_open_path,
    hidWrite: PFN_SDL_hid_write,
    hidReadTimeout: PFN_SDL_hid_read_timeout,
    hidRead: PFN_SDL_hid_read,
    hidSetNonblocking: PFN_SDL_hid_set_nonblocking,
    hidSendFeatureReport: PFN_SDL_hid_send_feature_report,
    hidGetFeatureReport: PFN_SDL_hid_get_feature_report,
    hidClose: PFN_SDL_hid_close,
    hidGetManufacturerString: PFN_SDL_hid_get_manufacturer_string,
    hidGetProductString: PFN_SDL_hid_get_product_string,
    hidGetSerialNumberString: PFN_SDL_hid_get_serial_number_string,
    hidGetIndexedString: PFN_SDL_hid_get_indexed_string,
    hidBleScan: PFN_SDL_hid_ble_scan,
    hidGetDeviceInfo: PFN_SDL_hid_get_device_info,
    hidGetInputReport: PFN_SDL_hid_get_input_report,
    hidGetProperties: PFN_SDL_hid_get_properties,
    hidGetReportDescriptor: PFN_SDL_hid_get_report_descriptor,

    pub fn load(handle: dynamic.LibraryHandle) !HidapiFunctions {
        return dynamic.loadFunctions(HidapiFunctions, handle, "SDL_", .{
            .{ "hidInit", "SDL_hid_init" },
            .{ "hidExit", "SDL_hid_exit" },
            .{ "hidDeviceChangeCount", "SDL_hid_device_change_count" },
            .{ "hidEnumerate", "SDL_hid_enumerate" },
            .{ "hidFreeEnumeration", "SDL_hid_free_enumeration" },
            .{ "hidOpen", "SDL_hid_open" },
            .{ "hidOpenPath", "SDL_hid_open_path" },
            .{ "hidWrite", "SDL_hid_write" },
            .{ "hidReadTimeout", "SDL_hid_read_timeout" },
            .{ "hidRead", "SDL_hid_read" },
            .{ "hidSetNonblocking", "SDL_hid_set_nonblocking" },
            .{ "hidSendFeatureReport", "SDL_hid_send_feature_report" },
            .{ "hidGetFeatureReport", "SDL_hid_get_feature_report" },
            .{ "hidClose", "SDL_hid_close" },
            .{ "hidGetManufacturerString", "SDL_hid_get_manufacturer_string" },
            .{ "hidGetProductString", "SDL_hid_get_product_string" },
            .{ "hidGetSerialNumberString", "SDL_hid_get_serial_number_string" },
            .{ "hidGetIndexedString", "SDL_hid_get_indexed_string" },
            .{ "hidBleScan", "SDL_hid_ble_scan" },
            .{ "hidGetDeviceInfo", "SDL_hid_get_device_info" },
            .{ "hidGetInputReport", "SDL_hid_get_input_report" },
            .{ "hidGetProperties", "SDL_hid_get_properties" },
            .{ "hidGetReportDescriptor", "SDL_hid_get_report_descriptor" },
        }, &.{});
    }
};
