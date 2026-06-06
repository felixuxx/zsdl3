// SDL3 Tray Bindings
// System tray icons

const dynamic = @import("dynamic.zig");
const video = @import("video.zig");

// Tray structs
pub const SDL_Tray = opaque {};
pub const SDL_TrayMenu = opaque {};
pub const SDL_TrayEntry = opaque {};

// Tray functions
pub const PFN_SDL_CreateTray = *const fn (icon: ?*video.SDL_Surface, tooltip: ?[*:0]const u8) callconv(.c) ?*SDL_Tray;
pub const PFN_SDL_SetTrayIcon = *const fn (tray: ?*SDL_Tray, icon: ?*video.SDL_Surface) callconv(.c) void;
pub const PFN_SDL_SetTrayTooltip = *const fn (tray: ?*SDL_Tray, tooltip: ?[*:0]const u8) callconv(.c) void;
pub const PFN_SDL_CreateTrayMenu = *const fn (tray: ?*SDL_Tray) callconv(.c) ?*SDL_TrayMenu;
pub const PFN_SDL_CreateTraySubmenu = *const fn (entry: ?*SDL_TrayEntry) callconv(.c) ?*SDL_TrayMenu;
pub const PFN_SDL_GetTrayMenu = *const fn (tray: ?*SDL_Tray) callconv(.c) ?*SDL_TrayMenu;
pub const PFN_SDL_GetTraySubmenu = *const fn (entry: ?*SDL_TrayEntry) callconv(.c) ?*SDL_TrayMenu;
pub const PFN_SDL_GetTrayEntries = *const fn (menu: ?*SDL_TrayMenu, count: ?*c_int) callconv(.c) ?[*]?*const SDL_TrayEntry;
pub const PFN_SDL_RemoveTrayEntry = *const fn (entry: ?*SDL_TrayEntry) callconv(.c) void;
pub const PFN_SDL_InsertTrayEntryAt = *const fn (menu: ?*SDL_TrayMenu, pos: c_int, label: ?[*:0]const u8, flags: c_uint) callconv(.c) ?*SDL_TrayEntry;
pub const PFN_SDL_SetTrayEntryLabel = *const fn (entry: ?*SDL_TrayEntry, label: ?[*:0]const u8) callconv(.c) void;
pub const PFN_SDL_GetTrayEntryLabel = *const fn (entry: ?*SDL_TrayEntry) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_SetTrayEntryChecked = *const fn (entry: ?*SDL_TrayEntry, checked: bool) callconv(.c) void;
pub const PFN_SDL_GetTrayEntryChecked = *const fn (entry: ?*SDL_TrayEntry) callconv(.c) bool;
pub const PFN_SDL_SetTrayEntryEnabled = *const fn (entry: ?*SDL_TrayEntry, enabled: bool) callconv(.c) void;
pub const PFN_SDL_GetTrayEntryEnabled = *const fn (entry: ?*SDL_TrayEntry) callconv(.c) bool;
pub const PFN_SDL_SetTrayEntryCallback = *const fn (entry: ?*SDL_TrayEntry, callback: ?*const fn (?*anyopaque, ?*SDL_TrayEntry) callconv(.c) void, userdata: ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_ClickTrayEntry = *const fn (entry: ?*SDL_TrayEntry) callconv(.c) void;
pub const PFN_SDL_DestroyTray = *const fn (tray: ?*SDL_Tray) callconv(.c) void;
pub const PFN_SDL_GetTrayEntryParent = *const fn (entry: ?*SDL_TrayEntry) callconv(.c) ?*SDL_TrayMenu;
pub const PFN_SDL_GetTrayMenuParentTray = *const fn (menu: ?*SDL_TrayMenu) callconv(.c) ?*SDL_Tray;
pub const PFN_SDL_GetTrayMenuParentEntry = *const fn (menu: ?*SDL_TrayMenu) callconv(.c) ?*SDL_TrayEntry;
pub const PFN_SDL_UpdateTrays = *const fn () callconv(.c) void;

pub const TrayFunctions = struct {
    createTray: PFN_SDL_CreateTray,
    setTrayIcon: PFN_SDL_SetTrayIcon,
    setTrayTooltip: PFN_SDL_SetTrayTooltip,
    createTrayMenu: PFN_SDL_CreateTrayMenu,
    createTraySubmenu: PFN_SDL_CreateTraySubmenu,
    getTrayMenu: PFN_SDL_GetTrayMenu,
    getTraySubmenu: PFN_SDL_GetTraySubmenu,
    getTrayEntries: PFN_SDL_GetTrayEntries,
    removeTrayEntry: PFN_SDL_RemoveTrayEntry,
    insertTrayEntryAt: PFN_SDL_InsertTrayEntryAt,
    setTrayEntryLabel: PFN_SDL_SetTrayEntryLabel,
    getTrayEntryLabel: PFN_SDL_GetTrayEntryLabel,
    setTrayEntryChecked: PFN_SDL_SetTrayEntryChecked,
    getTrayEntryChecked: PFN_SDL_GetTrayEntryChecked,
    setTrayEntryEnabled: PFN_SDL_SetTrayEntryEnabled,
    getTrayEntryEnabled: PFN_SDL_GetTrayEntryEnabled,
    setTrayEntryCallback: PFN_SDL_SetTrayEntryCallback,
    clickTrayEntry: PFN_SDL_ClickTrayEntry,
    destroyTray: PFN_SDL_DestroyTray,
    getTrayEntryParent: PFN_SDL_GetTrayEntryParent,
    getTrayMenuParent: PFN_SDL_GetTrayMenuParentTray,
    getTrayMenuParentEntry: PFN_SDL_GetTrayMenuParentEntry,
    updateTrays: PFN_SDL_UpdateTrays,

    pub fn load(handle: dynamic.LibraryHandle) !TrayFunctions {
        return dynamic.loadFunctions(TrayFunctions, handle, "SDL_", .{
            .{ "getTrayMenuParent", "SDL_GetTrayMenuParentTray" },
        }, &.{});
    }
};
