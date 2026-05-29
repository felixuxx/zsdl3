// SDL3 Process Bindings
// External process spawning and management

const filesystem = @import("filesystem.zig");
const core = @import("core.zig");

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
extern fn SDL_CreateProcess(args: ?[*]const ?[*:0]const u8, pipe_stdio: bool) ?*SDL_Process;
extern fn SDL_GetProcessInput(process: ?*SDL_Process) ?*filesystem.SDL_IOStream;
extern fn SDL_GetProcessOutput(process: ?*SDL_Process) ?*filesystem.SDL_IOStream;
extern fn SDL_WaitProcess(process: ?*SDL_Process, block: bool, exitcode: ?*c_int) bool;
extern fn SDL_KillProcess(process: ?*SDL_Process, force: bool) bool;
extern fn SDL_DestroyProcess(process: ?*SDL_Process) void;
extern fn SDL_CreateProcessWithProperties(props: core.SDL_PropertiesID) ?*SDL_Process;
extern fn SDL_GetProcessProperties(process: ?*SDL_Process) core.SDL_PropertiesID;
extern fn SDL_ReadProcess(process: ?*SDL_Process, datasize: ?*usize, exitcode: ?*c_int) ?*anyopaque;

// Public API
pub const createProcess = SDL_CreateProcess;
pub const getProcessInput = SDL_GetProcessInput;
pub const getProcessOutput = SDL_GetProcessOutput;
pub const waitProcess = SDL_WaitProcess;
pub const killProcess = SDL_KillProcess;
pub const destroyProcess = SDL_DestroyProcess;
pub const createProcessWithProperties = SDL_CreateProcessWithProperties;
pub const getProcessProperties = SDL_GetProcessProperties;
pub const readProcess = SDL_ReadProcess;
