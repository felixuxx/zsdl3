// SDL3 Process Bindings
// External process spawning and management

const core = @import("core.zig");
const filesystem = @import("filesystem.zig");

// Process handle
pub const SDL_Process = opaque {};

// Process IO stream
pub const SDL_ProcessIO = extern struct {
    stdin: ?*filesystem.SDL_IOStream,
    stdout: ?*filesystem.SDL_IOStream,
    stderr: ?*filesystem.SDL_IOStream,
};

// Process functions
extern fn SDL_RunProcess(args: ?[*]const ?[*:0]const u8, pipe_stdio: bool) ?*SDL_Process;
extern fn SDL_GetProcessInput(process: ?*SDL_Process) ?*filesystem.SDL_IOStream;
extern fn SDL_GetProcessOutput(process: ?*SDL_Process) ?*filesystem.SDL_IOStream;
extern fn SDL_GetProcessError(process: ?*SDL_Process) ?*filesystem.SDL_IOStream;
extern fn SDL_WaitProcess(process: ?*SDL_Process, block: bool, exitcode: ?*c_int) bool;
extern fn SDL_KillProcess(process: ?*SDL_Process, force: bool) bool;
extern fn SDL_DestroyProcess(process: ?*SDL_Process) void;

// Public API
pub const runProcess = SDL_RunProcess;
pub const getProcessInput = SDL_GetProcessInput;
pub const getProcessOutput = SDL_GetProcessOutput;
pub const getProcessError = SDL_GetProcessError;
pub const waitProcess = SDL_WaitProcess;
pub const killProcess = SDL_KillProcess;
pub const destroyProcess = SDL_DestroyProcess;
