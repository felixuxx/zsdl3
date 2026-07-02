// SDL3 System Bindings
// System queries

// Sandbox enum
pub const SDL_Sandbox = enum(c_int) {
    SDL_SANDBOX_NONE = 0,
    SDL_SANDBOX_UNKNOWN_CONTAINER,
    SDL_SANDBOX_FLATPAK,
    SDL_SANDBOX_SNAP,
    SDL_SANDBOX_MACOS,
};

// System functions
extern fn SDL_IsTablet() bool;
extern fn SDL_IsTV() bool;
extern fn SDL_GetSandbox() SDL_Sandbox;
extern fn SDL_OnApplicationWillTerminate() void;
extern fn SDL_OnApplicationDidReceiveMemoryWarning() void;
extern fn SDL_OnApplicationWillEnterBackground() void;
extern fn SDL_OnApplicationDidEnterBackground() void;
extern fn SDL_OnApplicationWillEnterForeground() void;
extern fn SDL_OnApplicationDidEnterForeground() void;
extern fn SDL_OnApplicationDidChangeStatusBarOrientation() void;

// Public API
pub const isTablet = SDL_IsTablet;
pub const isTV = SDL_IsTV;
pub const getSandbox = SDL_GetSandbox;
pub const onApplicationWillTerminate = SDL_OnApplicationWillTerminate;
pub const onApplicationDidReceiveMemoryWarning = SDL_OnApplicationDidReceiveMemoryWarning;
pub const onApplicationWillEnterBackground = SDL_OnApplicationWillEnterBackground;
pub const onApplicationDidEnterBackground = SDL_OnApplicationDidEnterBackground;
pub const onApplicationWillEnterForeground = SDL_OnApplicationWillEnterForeground;
pub const onApplicationDidEnterForeground = SDL_OnApplicationDidEnterForeground;
pub const onApplicationDidChangeStatusBarOrientation = SDL_OnApplicationDidChangeStatusBarOrientation;
