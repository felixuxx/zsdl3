// SDL3 Haptic Bindings
// Force feedback

const core = @import("core.zig");
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
extern fn SDL_GetHaptics(count: ?*c_int) ?[*]SDL_HapticID;
extern fn SDL_GetHapticName(haptic: ?*SDL_Haptic) ?[*:0]const u8;
extern fn SDL_GetHapticNameForID(instance_id: SDL_HapticID) ?[*:0]const u8;
extern fn SDL_OpenHaptic(instance_id: SDL_HapticID) ?*SDL_Haptic;
extern fn SDL_GetHapticFromID(instance_id: SDL_HapticID) ?*SDL_Haptic;
extern fn SDL_GetHapticID(haptic: ?*SDL_Haptic) SDL_HapticID;
extern fn SDL_IsMouseHaptic() bool;
extern fn SDL_OpenHapticFromMouse() ?*SDL_Haptic;
extern fn SDL_IsJoystickHaptic(joystick: ?*input.SDL_Joystick) bool;
extern fn SDL_OpenHapticFromJoystick(joystick: ?*input.SDL_Joystick) ?*SDL_Haptic;
extern fn SDL_CloseHaptic(haptic: ?*SDL_Haptic) void;
extern fn SDL_GetMaxHapticEffects(haptic: ?*SDL_Haptic) c_int;
extern fn SDL_GetMaxHapticEffectsPlaying(haptic: ?*SDL_Haptic) c_int;
extern fn SDL_GetHapticFeatures(haptic: ?*SDL_Haptic) c_uint;
extern fn SDL_GetNumHapticAxes(haptic: ?*SDL_Haptic) c_int;
extern fn SDL_HapticEffectSupported(haptic: ?*SDL_Haptic, effect: ?*SDL_HapticEffect) bool;
extern fn SDL_CreateHapticEffect(haptic: ?*SDL_Haptic, effect: ?*const SDL_HapticEffect) c_int;
extern fn SDL_UpdateHapticEffect(haptic: ?*SDL_Haptic, effect: c_int, data: ?*const SDL_HapticEffect) bool;
extern fn SDL_RunHapticEffect(haptic: ?*SDL_Haptic, effect: c_int, iterations: Uint32) bool;
extern fn SDL_StopHapticEffect(haptic: ?*SDL_Haptic, effect: c_int) bool;
extern fn SDL_DestroyHapticEffect(haptic: ?*SDL_Haptic, effect: c_int) void;
extern fn SDL_GetHapticEffectStatus(haptic: ?*SDL_Haptic, effect: c_int) bool;
extern fn SDL_SetHapticGain(haptic: ?*SDL_Haptic, gain: c_int) bool;
extern fn SDL_SetHapticAutocenter(haptic: ?*SDL_Haptic, autocenter: c_int) bool;
extern fn SDL_PauseHaptic(haptic: ?*SDL_Haptic) bool;
extern fn SDL_ResumeHaptic(haptic: ?*SDL_Haptic) bool;
extern fn SDL_StopHapticEffects(haptic: ?*SDL_Haptic) bool;
extern fn SDL_HapticRumbleSupported(haptic: ?*SDL_Haptic) bool;
extern fn SDL_InitHapticRumble(haptic: ?*SDL_Haptic) bool;
extern fn SDL_PlayHapticRumble(haptic: ?*SDL_Haptic, strength: f32, length: Uint32) bool;
extern fn SDL_StopHapticRumble(haptic: ?*SDL_Haptic) bool;

// Public API
pub const getHaptics = SDL_GetHaptics;
pub const getHapticName = SDL_GetHapticName;
pub const getHapticNameForID = SDL_GetHapticNameForID;
pub const openHaptic = SDL_OpenHaptic;
pub const getHapticFromID = SDL_GetHapticFromID;
pub const getHapticID = SDL_GetHapticID;
pub const isMouseHaptic = SDL_IsMouseHaptic;
pub const openHapticFromMouse = SDL_OpenHapticFromMouse;
pub const isJoystickHaptic = SDL_IsJoystickHaptic;
pub const openHapticFromJoystick = SDL_OpenHapticFromJoystick;
pub const closeHaptic = SDL_CloseHaptic;
pub const getMaxHapticEffects = SDL_GetMaxHapticEffects;
pub const getMaxHapticEffectsPlaying = SDL_GetMaxHapticEffectsPlaying;
pub const getHapticFeatures = SDL_GetHapticFeatures;
pub const getNumHapticAxes = SDL_GetNumHapticAxes;
pub const hapticEffectSupported = SDL_HapticEffectSupported;
pub const createHapticEffect = SDL_CreateHapticEffect;
pub const updateHapticEffect = SDL_UpdateHapticEffect;
pub const runHapticEffect = SDL_RunHapticEffect;
pub const stopHapticEffect = SDL_StopHapticEffect;
pub const destroyHapticEffect = SDL_DestroyHapticEffect;
pub const getHapticEffectStatus = SDL_GetHapticEffectStatus;
pub const setHapticGain = SDL_SetHapticGain;
pub const setHapticAutocenter = SDL_SetHapticAutocenter;
pub const pauseHaptic = SDL_PauseHaptic;
pub const resumeHaptic = SDL_ResumeHaptic;
pub const stopHapticEffects = SDL_StopHapticEffects;
pub const hapticRumbleSupported = SDL_HapticRumbleSupported;
pub const initHapticRumble = SDL_InitHapticRumble;
pub const playHapticRumble = SDL_PlayHapticRumble;
pub const stopHapticRumble = SDL_StopHapticRumble;
