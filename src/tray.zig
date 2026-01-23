// SDL3 Tray Bindings
// System tray icons

const core = @import("core.zig");
const video = @import("video.zig");

// Tray structs
pub const SDL_Tray = opaque {};
pub const SDL_TrayMenu = opaque {};
pub const SDL_TrayEntry = opaque {};

// Tray functions
extern fn SDL_CreateTray(icon: ?*video.SDL_Surface, tooltip: ?[*:0]const u8) ?*SDL_Tray;
extern fn SDL_SetTrayIcon(tray: ?*SDL_Tray, icon: ?*video.SDL_Surface) void;
extern fn SDL_SetTrayTooltip(tray: ?*SDL_Tray, tooltip: ?[*:0]const u8) void;
extern fn SDL_CreateTrayMenu(tray: ?*SDL_Tray) ?*SDL_TrayMenu;
extern fn SDL_CreateTraySubmenu(entry: ?*SDL_TrayEntry) ?*SDL_TrayMenu;
extern fn SDL_GetTrayMenu(menu: ?*SDL_TrayMenu) ?*SDL_TrayMenu;
extern fn SDL_GetTraySubmenu(entry: ?*SDL_TrayEntry) ?*SDL_TrayMenu;
extern fn SDL_GetTrayEntries(menu: ?*SDL_TrayMenu, count: ?*c_int) ?[*]?*SDL_TrayEntry;
extern fn SDL_RemoveTrayEntry(entry: ?*SDL_TrayEntry) void;
extern fn SDL_InsertTrayEntryAt(menu: ?*SDL_TrayMenu, pos: c_int, label: ?[*:0]const u8, enabled: bool) ?*SDL_TrayEntry;
extern fn SDL_SetTrayEntryLabel(entry: ?*SDL_TrayEntry, label: ?[*:0]const u8) void;
extern fn SDL_GetTrayEntryLabel(entry: ?*SDL_TrayEntry) ?[*:0]const u8;
extern fn SDL_SetTrayEntryChecked(entry: ?*SDL_TrayEntry, checked: bool) void;
extern fn SDL_GetTrayEntryChecked(entry: ?*SDL_TrayEntry) bool;
extern fn SDL_SetTrayEntryEnabled(entry: ?*SDL_TrayEntry, enabled: bool) void;
extern fn SDL_GetTrayEntryEnabled(entry: ?*SDL_TrayEntry) bool;
extern fn SDL_SetTrayEntryCallback(entry: ?*SDL_TrayEntry, callback: ?*const fn (?*anyopaque, ?*SDL_TrayEntry) callconv(.C) void, userdata: ?*anyopaque) void;
extern fn SDL_ClickTrayEntry(entry: ?*SDL_TrayEntry) void;
extern fn SDL_DestroyTray(tray: ?*SDL_Tray) void;
extern fn SDL_GetTrayEntryParent(entry: ?*SDL_TrayEntry) ?*SDL_TrayEntry;
extern fn SDL_GetTrayMenuParent(menu: ?*SDL_TrayMenu) ?*SDL_Tray;
extern fn SDL_GetTrayMenuParentEntry(menu: ?*SDL_TrayMenu) ?*SDL_TrayEntry;
extern fn SDL_UpdateTrays() void;

// Public API
pub const createTray = SDL_CreateTray;
pub const setTrayIcon = SDL_SetTrayIcon;
pub const setTrayTooltip = SDL_SetTrayTooltip;
pub const createTrayMenu = SDL_CreateTrayMenu;
pub const createTraySubmenu = SDL_CreateTraySubmenu;
pub const getTrayMenu = SDL_GetTrayMenu;
pub const getTraySubmenu = SDL_GetTraySubmenu;
pub const getTrayEntries = SDL_GetTrayEntries;
pub const removeTrayEntry = SDL_RemoveTrayEntry;
pub const insertTrayEntryAt = SDL_InsertTrayEntryAt;
pub const setTrayEntryLabel = SDL_SetTrayEntryLabel;
pub const getTrayEntryLabel = SDL_GetTrayEntryLabel;
pub const setTrayEntryChecked = SDL_SetTrayEntryChecked;
pub const getTrayEntryChecked = SDL_GetTrayEntryChecked;
pub const setTrayEntryEnabled = SDL_SetTrayEntryEnabled;
pub const getTrayEntryEnabled = SDL_GetTrayEntryEnabled;
pub const setTrayEntryCallback = SDL_SetTrayEntryCallback;
pub const clickTrayEntry = SDL_ClickTrayEntry;
pub const destroyTray = SDL_DestroyTray;
pub const getTrayEntryParent = SDL_GetTrayEntryParent;
pub const getTrayMenuParent = SDL_GetTrayMenuParent;
pub const getTrayMenuParentEntry = SDL_GetTrayMenuParentEntry;
pub const updateTrays = SDL_UpdateTrays;
