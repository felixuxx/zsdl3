// SDL3 Process Bindings
// External process spawning and management

const filesystem = @import("filesystem.zig");
const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

// Process handle
pub const SDL_Process = opaque {};

// Process IO stream
pub const SDL_ProcessIO = enum(c_int) {
    SDL_PROCESS_IO_INHERITED,
    SDL_PROCESS_IO_NULL,
    SDL_PROCESS_IO_APP,
    SDL_PROCESS_IO_REDIRECT,
};

// Process functions
pub const PFN_SDL_CreateProcess = *const fn (args: ?[*]const ?[*:0]const u8, pipe_stdio: bool) callconv(.c) ?*SDL_Process;
pub const PFN_SDL_GetProcessInput = *const fn (process: ?*SDL_Process) callconv(.c) ?*filesystem.SDL_IOStream;
pub const PFN_SDL_GetProcessOutput = *const fn (process: ?*SDL_Process) callconv(.c) ?*filesystem.SDL_IOStream;
pub const PFN_SDL_WaitProcess = *const fn (process: ?*SDL_Process, block: bool, exitcode: ?*c_int) callconv(.c) bool;
pub const PFN_SDL_KillProcess = *const fn (process: ?*SDL_Process, force: bool) callconv(.c) bool;
pub const PFN_SDL_DestroyProcess = *const fn (process: ?*SDL_Process) callconv(.c) void;
pub const PFN_SDL_CreateProcessWithProperties = *const fn (props: core.SDL_PropertiesID) callconv(.c) ?*SDL_Process;
pub const PFN_SDL_GetProcessProperties = *const fn (process: ?*SDL_Process) callconv(.c) core.SDL_PropertiesID;
pub const PFN_SDL_ReadProcess = *const fn (process: ?*SDL_Process, datasize: ?*usize, exitcode: ?*c_int) callconv(.c) ?*anyopaque;

pub const ProcessFunctions = struct {
    createProcess: PFN_SDL_CreateProcess,
    getProcessInput: PFN_SDL_GetProcessInput,
    getProcessOutput: PFN_SDL_GetProcessOutput,
    waitProcess: PFN_SDL_WaitProcess,
    killProcess: PFN_SDL_KillProcess,
    destroyProcess: PFN_SDL_DestroyProcess,
    createProcessWithProperties: PFN_SDL_CreateProcessWithProperties,
    getProcessProperties: PFN_SDL_GetProcessProperties,
    readProcess: PFN_SDL_ReadProcess,

    pub fn load(handle: dynamic.LibraryHandle) !ProcessFunctions {
        return dynamic.loadFunctions(ProcessFunctions, handle, "SDL_", .{}, &.{});
    }
};
