// SDL3 HIDAPI Bindings
// HID device access

const core = @import("core.zig");

pub const Uint8 = core.Uint8;
pub const Uint16 = core.Uint16;
pub const Uint32 = core.Uint32;

// Placeholder for c_wchar_t
pub const c_wchar_t = u16;

// HID bus type enum
pub const SDL_hid_bus_type = enum(c_int) {
    SDL_HID_API_BUS_UNKNOWN = 0x00,
    SDL_HID_API_BUS_USB = 0x01,
    SDL_HID_API_BUS_BLUETOOTH = 0x02,
    SDL_HID_API_BUS_I2C = 0x03,
    SDL_HID_API_BUS_SPI = 0x04,
};

// HID property string constants
pub const SDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER = "SDL.hidapi.libusb.device.handle";

// HID device opaque type
pub const SDL_hid_device = opaque {};

// HID functions
extern fn SDL_hid_init() c_int;
extern fn SDL_hid_exit() c_int;
extern fn SDL_hid_device_change_count() Uint32;
extern fn SDL_hid_enumerate(vendor_id: Uint16, product_id: Uint16) ?*SDL_hid_device_info;
extern fn SDL_hid_free_enumeration(devs: ?*SDL_hid_device_info) void;
extern fn SDL_hid_open(vendor_id: Uint16, product_id: Uint16, serial_number: ?*const c_wchar_t) ?*SDL_hid_device;
extern fn SDL_hid_open_path(path: ?[*:0]const u8) ?*SDL_hid_device;
extern fn SDL_hid_write(dev: ?*SDL_hid_device, data: ?*const Uint8, length: usize) c_int;
extern fn SDL_hid_read_timeout(dev: ?*SDL_hid_device, data: ?*Uint8, length: usize, milliseconds: c_int) c_int;
extern fn SDL_hid_read(dev: ?*SDL_hid_device, data: ?*Uint8, length: usize) c_int;
extern fn SDL_hid_set_nonblocking(dev: ?*SDL_hid_device, nonblock: c_int) c_int;
extern fn SDL_hid_send_feature_report(dev: ?*SDL_hid_device, data: ?*const Uint8, length: usize) c_int;
extern fn SDL_hid_get_feature_report(dev: ?*SDL_hid_device, data: ?*Uint8, length: usize) c_int;
extern fn SDL_hid_close(dev: ?*SDL_hid_device) c_int;
extern fn SDL_hid_get_manufacturer_string(dev: ?*SDL_hid_device, string: ?*c_wchar_t, maxlen: usize) c_int;
extern fn SDL_hid_get_product_string(dev: ?*SDL_hid_device, string: ?*c_wchar_t, maxlen: usize) c_int;
extern fn SDL_hid_get_serial_number_string(dev: ?*SDL_hid_device, string: ?*c_wchar_t, maxlen: usize) c_int;
extern fn SDL_hid_get_indexed_string(dev: ?*SDL_hid_device, string_index: c_int, string: ?*c_wchar_t, maxlen: usize) c_int;
extern fn SDL_hid_get_properties(dev: ?*SDL_hid_device) core.SDL_PropertiesID;
extern fn SDL_hid_get_input_report(dev: ?*SDL_hid_device, data: [*]u8, length: usize) c_int;
extern fn SDL_hid_get_device_info(dev: ?*SDL_hid_device) ?*SDL_hid_device_info;
extern fn SDL_hid_get_report_descriptor(dev: ?*SDL_hid_device, buf: [*]u8, buf_size: usize) c_int;
extern fn SDL_hid_ble_scan(scan: bool) void;

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
    bus_type: SDL_hid_bus_type,
    next: ?*SDL_hid_device_info,
};

// Public API
pub const hid_init = SDL_hid_init;
pub const hid_exit = SDL_hid_exit;
pub const hid_device_change_count = SDL_hid_device_change_count;
pub const hid_enumerate = SDL_hid_enumerate;
pub const hid_free_enumeration = SDL_hid_free_enumeration;
pub const hid_open = SDL_hid_open;
pub const hid_open_path = SDL_hid_open_path;
pub const hid_write = SDL_hid_write;
pub const hid_read_timeout = SDL_hid_read_timeout;
pub const hid_read = SDL_hid_read;
pub const hid_set_nonblocking = SDL_hid_set_nonblocking;
pub const hid_send_feature_report = SDL_hid_send_feature_report;
pub const hid_get_feature_report = SDL_hid_get_feature_report;
pub const hid_close = SDL_hid_close;
pub const hid_get_manufacturer_string = SDL_hid_get_manufacturer_string;
pub const hid_get_product_string = SDL_hid_get_product_string;
pub const hid_get_serial_number_string = SDL_hid_get_serial_number_string;
pub const hid_get_indexed_string = SDL_hid_get_indexed_string;
pub const hid_get_properties = SDL_hid_get_properties;
pub const hid_get_input_report = SDL_hid_get_input_report;
pub const hid_get_device_info = SDL_hid_get_device_info;
pub const hid_get_report_descriptor = SDL_hid_get_report_descriptor;
pub const hid_ble_scan = SDL_hid_ble_scan;
