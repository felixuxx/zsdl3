// SDL3 Haptic Bindings
// Force feedback

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");
const input = @import("input.zig");

// Import types
pub const Uint8 = core.Uint8;
pub const Uint16 = core.Uint16;
pub const Uint32 = core.Uint32;
pub const Sint16 = core.Sint16;
pub const Sint32 = core.Sint32;

// Haptic structs
pub const SDL_Haptic = opaque {};

// Haptic effect types
pub const SDL_HapticEffect = extern union {
    type: Uint16,
    constant: SDL_HapticConstant,
    periodic: SDL_HapticPeriodic,
    condition: SDL_HapticCondition,
    ramp: SDL_HapticRamp,
    custom: SDL_HapticCustom,
};

// Haptic effect subtypes
pub const SDL_HapticConstant = extern struct {
    type: Uint16,
    direction: SDL_HapticDirection,
    length: Uint32,
    delay: Uint16,
    button: Uint16,
    interval: Uint16,
    level: Sint16,
    attack_length: Uint16,
    attack_level: Uint16,
    fade_length: Uint16,
    fade_level: Uint16,
};

pub const SDL_HapticPeriodic = extern struct {
    type: Uint16,
    direction: SDL_HapticDirection,
    length: Uint32,
    delay: Uint16,
    button: Uint16,
    interval: Uint16,
    period: Uint16,
    magnitude: Sint16,
    offset: Sint16,
    phase: Uint16,
    attack_length: Uint16,
    attack_level: Uint16,
    fade_length: Uint16,
    fade_level: Uint16,
};

pub const SDL_HapticCondition = extern struct {
    type: Uint16,
    direction: SDL_HapticDirection,
    length: Uint32,
    delay: Uint16,
    button: Uint16,
    interval: Uint16,
    right_sat: [3]Uint16,
    left_sat: [3]Uint16,
    right_coeff: [3]Sint16,
    left_coeff: [3]Sint16,
    deadband: [3]Uint16,
    center: [3]Sint16,
};

pub const SDL_HapticRamp = extern struct {
    type: Uint16,
    direction: SDL_HapticDirection,
    length: Uint32,
    delay: Uint16,
    button: Uint16,
    interval: Uint16,
    start: Sint16,
    end: Sint16,
    attack_length: Uint16,
    attack_level: Uint16,
    fade_length: Uint16,
    fade_level: Uint16,
};

pub const SDL_HapticCustom = extern struct {
    type: Uint16,
    direction: SDL_HapticDirection,
    length: Uint32,
    delay: Uint16,
    button: Uint16,
    interval: Uint16,
    channels: Uint8,
    period: Uint16,
    samples: Uint16,
    data: ?[*]Sint16,
    attack_length: Uint16,
    attack_level: Uint16,
    fade_length: Uint16,
    fade_level: Uint16,
};

pub const SDL_HapticDirection = extern struct {
    type: Uint8,
    dir: [3]Sint32,
};

pub const SDL_HapticID = Uint32;

// Haptic functions
pub const PFN_SDL_GetHaptics = *const fn (count: ?*c_int) callconv(.c) ?[*]SDL_HapticID;
pub const PFN_SDL_GetHapticName = *const fn (haptic: ?*SDL_Haptic) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_GetHapticNameForID = *const fn (instance_id: SDL_HapticID) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_OpenHaptic = *const fn (instance_id: SDL_HapticID) callconv(.c) ?*SDL_Haptic;
pub const PFN_SDL_GetHapticFromID = *const fn (instance_id: SDL_HapticID) callconv(.c) ?*SDL_Haptic;
pub const PFN_SDL_GetHapticID = *const fn (haptic: ?*SDL_Haptic) callconv(.c) SDL_HapticID;
pub const PFN_SDL_IsMouseHaptic = *const fn () callconv(.c) bool;
pub const PFN_SDL_OpenHapticFromMouse = *const fn () callconv(.c) ?*SDL_Haptic;
pub const PFN_SDL_IsJoystickHaptic = *const fn (joystick: ?*input.SDL_Joystick) callconv(.c) bool;
pub const PFN_SDL_OpenHapticFromJoystick = *const fn (joystick: ?*input.SDL_Joystick) callconv(.c) ?*SDL_Haptic;
pub const PFN_SDL_CloseHaptic = *const fn (haptic: ?*SDL_Haptic) callconv(.c) void;
pub const PFN_SDL_GetMaxHapticEffects = *const fn (haptic: ?*SDL_Haptic) callconv(.c) c_int;
pub const PFN_SDL_GetMaxHapticEffectsPlaying = *const fn (haptic: ?*SDL_Haptic) callconv(.c) c_int;
pub const PFN_SDL_GetHapticFeatures = *const fn (haptic: ?*SDL_Haptic) callconv(.c) c_uint;
pub const PFN_SDL_GetNumHapticAxes = *const fn (haptic: ?*SDL_Haptic) callconv(.c) c_int;
pub const PFN_SDL_HapticEffectSupported = *const fn (haptic: ?*SDL_Haptic, effect: ?*SDL_HapticEffect) callconv(.c) bool;
pub const PFN_SDL_CreateHapticEffect = *const fn (haptic: ?*SDL_Haptic, effect: ?*const SDL_HapticEffect) callconv(.c) c_int;
pub const PFN_SDL_UpdateHapticEffect = *const fn (haptic: ?*SDL_Haptic, effect: c_int, data: ?*const SDL_HapticEffect) callconv(.c) bool;
pub const PFN_SDL_RunHapticEffect = *const fn (haptic: ?*SDL_Haptic, effect: c_int, iterations: Uint32) callconv(.c) bool;
pub const PFN_SDL_StopHapticEffect = *const fn (haptic: ?*SDL_Haptic, effect: c_int) callconv(.c) bool;
pub const PFN_SDL_DestroyHapticEffect = *const fn (haptic: ?*SDL_Haptic, effect: c_int) callconv(.c) void;
pub const PFN_SDL_GetHapticEffectStatus = *const fn (haptic: ?*SDL_Haptic, effect: c_int) callconv(.c) bool;
pub const PFN_SDL_SetHapticGain = *const fn (haptic: ?*SDL_Haptic, gain: c_int) callconv(.c) bool;
pub const PFN_SDL_SetHapticAutocenter = *const fn (haptic: ?*SDL_Haptic, autocenter: c_int) callconv(.c) bool;
pub const PFN_SDL_PauseHaptic = *const fn (haptic: ?*SDL_Haptic) callconv(.c) bool;
pub const PFN_SDL_ResumeHaptic = *const fn (haptic: ?*SDL_Haptic) callconv(.c) bool;
pub const PFN_SDL_StopHapticEffects = *const fn (haptic: ?*SDL_Haptic) callconv(.c) bool;
pub const PFN_SDL_HapticRumbleSupported = *const fn (haptic: ?*SDL_Haptic) callconv(.c) bool;
pub const PFN_SDL_InitHapticRumble = *const fn (haptic: ?*SDL_Haptic) callconv(.c) bool;
pub const PFN_SDL_PlayHapticRumble = *const fn (haptic: ?*SDL_Haptic, strength: f32, length: Uint32) callconv(.c) bool;
pub const PFN_SDL_StopHapticRumble = *const fn (haptic: ?*SDL_Haptic) callconv(.c) bool;

pub const HapticFunctions = struct {
    getHaptics: PFN_SDL_GetHaptics,
    getHapticName: PFN_SDL_GetHapticName,
    getHapticNameForID: PFN_SDL_GetHapticNameForID,
    openHaptic: PFN_SDL_OpenHaptic,
    getHapticFromID: PFN_SDL_GetHapticFromID,
    getHapticID: PFN_SDL_GetHapticID,
    isMouseHaptic: PFN_SDL_IsMouseHaptic,
    openHapticFromMouse: PFN_SDL_OpenHapticFromMouse,
    isJoystickHaptic: PFN_SDL_IsJoystickHaptic,
    openHapticFromJoystick: PFN_SDL_OpenHapticFromJoystick,
    closeHaptic: PFN_SDL_CloseHaptic,
    getMaxHapticEffects: PFN_SDL_GetMaxHapticEffects,
    getMaxHapticEffectsPlaying: PFN_SDL_GetMaxHapticEffectsPlaying,
    getHapticFeatures: PFN_SDL_GetHapticFeatures,
    getNumHapticAxes: PFN_SDL_GetNumHapticAxes,
    hapticEffectSupported: PFN_SDL_HapticEffectSupported,
    createHapticEffect: PFN_SDL_CreateHapticEffect,
    updateHapticEffect: PFN_SDL_UpdateHapticEffect,
    runHapticEffect: PFN_SDL_RunHapticEffect,
    stopHapticEffect: PFN_SDL_StopHapticEffect,
    destroyHapticEffect: PFN_SDL_DestroyHapticEffect,
    getHapticEffectStatus: PFN_SDL_GetHapticEffectStatus,
    setHapticGain: PFN_SDL_SetHapticGain,
    setHapticAutocenter: PFN_SDL_SetHapticAutocenter,
    pauseHaptic: PFN_SDL_PauseHaptic,
    resumeHaptic: PFN_SDL_ResumeHaptic,
    stopHapticEffects: PFN_SDL_StopHapticEffects,
    hapticRumbleSupported: PFN_SDL_HapticRumbleSupported,
    initHapticRumble: PFN_SDL_InitHapticRumble,
    playHapticRumble: PFN_SDL_PlayHapticRumble,
    stopHapticRumble: PFN_SDL_StopHapticRumble,

    pub fn load(handle: dynamic.LibraryHandle) !HapticFunctions {
        return dynamic.loadFunctions(HapticFunctions, handle, "SDL_", .{}, &.{});
    }
};
