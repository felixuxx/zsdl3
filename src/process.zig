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

// Process property string constants
pub const SDL_PROP_PROCESS_CREATE_ARGS_POINTER = "SDL.process.create.args";
pub const SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER = "SDL.process.create.environment";
pub const SDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING = "SDL.process.create.working_directory";
pub const SDL_PROP_PROCESS_CREATE_STDIN_NUMBER = "SDL.process.create.stdin_option";
pub const SDL_PROP_PROCESS_CREATE_STDIN_POINTER = "SDL.process.create.stdin_source";
pub const SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER = "SDL.process.create.stdout_option";
pub const SDL_PROP_PROCESS_CREATE_STDOUT_POINTER = "SDL.process.create.stdout_source";
pub const SDL_PROP_PROCESS_CREATE_STDERR_NUMBER = "SDL.process.create.stderr_option";
pub const SDL_PROP_PROCESS_CREATE_STDERR_POINTER = "SDL.process.create.stderr_source";
pub const SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN = "SDL.process.create.stderr_to_stdout";
pub const SDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN = "SDL.process.create.background";
pub const SDL_PROP_PROCESS_CREATE_CMDLINE_STRING = "SDL.process.create.cmdline";
pub const SDL_PROP_PROCESS_PID_NUMBER = "SDL.process.pid";
pub const SDL_PROP_PROCESS_STDIN_POINTER = "SDL.process.stdin";
pub const SDL_PROP_PROCESS_STDOUT_POINTER = "SDL.process.stdout";
pub const SDL_PROP_PROCESS_STDERR_POINTER = "SDL.process.stderr";
pub const SDL_PROP_PROCESS_BACKGROUND_BOOLEAN = "SDL.process.background";

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
