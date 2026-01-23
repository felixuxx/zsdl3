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

// Haptic functions
extern fn SDL_NumHaptics() c_int;
extern fn SDL_HapticName(device_index: c_int) ?[*:0]const u8;
extern fn SDL_HapticOpen(device_index: c_int) ?*SDL_Haptic;
extern fn SDL_HapticOpened(device_index: c_int) bool;
extern fn SDL_HapticIndex(haptic: ?*SDL_Haptic) c_int;
extern fn SDL_MouseIsHaptic() bool;
extern fn SDL_HapticOpenFromMouse() ?*SDL_Haptic;
extern fn SDL_JoystickIsHaptic(joystick: ?*input.SDL_Joystick) bool;
extern fn SDL_HapticOpenFromJoystick(joystick: ?*input.SDL_Joystick) ?*SDL_Haptic;
extern fn SDL_HapticClose(haptic: ?*SDL_Haptic) void;
extern fn SDL_HapticNumEffects(haptic: ?*SDL_Haptic) c_int;
extern fn SDL_HapticNumEffectsPlaying(haptic: ?*SDL_Haptic) c_int;
extern fn SDL_HapticQuery(haptic: ?*SDL_Haptic) c_uint;
extern fn SDL_HapticNumAxes(haptic: ?*SDL_Haptic) c_int;
extern fn SDL_HapticEffectSupported(haptic: ?*SDL_Haptic, effect: ?*SDL_HapticEffect) bool;
extern fn SDL_HapticNewEffect(haptic: ?*SDL_Haptic, effect: ?*SDL_HapticEffect) c_int;
extern fn SDL_HapticUpdateEffect(haptic: ?*SDL_Haptic, effect: c_int, data: ?*SDL_HapticEffect) bool;
extern fn SDL_HapticRunEffect(haptic: ?*SDL_Haptic, effect: c_int, iterations: Uint32) bool;
extern fn SDL_HapticStopEffect(haptic: ?*SDL_Haptic, effect: c_int) bool;
extern fn SDL_HapticDestroyEffect(haptic: ?*SDL_Haptic, effect: c_int) void;
extern fn SDL_HapticGetEffectStatus(haptic: ?*SDL_Haptic, effect: c_int) bool;
extern fn SDL_HapticSetGain(haptic: ?*SDL_Haptic, gain: c_int) bool;
extern fn SDL_HapticSetAutocenter(haptic: ?*SDL_Haptic, autocenter: c_int) bool;
extern fn SDL_HapticPause(haptic: ?*SDL_Haptic) bool;
extern fn SDL_HapticUnpause(haptic: ?*SDL_Haptic) bool;
extern fn SDL_HapticStopAll(haptic: ?*SDL_Haptic) bool;
extern fn SDL_HapticRumbleSupported(haptic: ?*SDL_Haptic) bool;
extern fn SDL_HapticRumbleInit(haptic: ?*SDL_Haptic) bool;
extern fn SDL_HapticRumblePlay(haptic: ?*SDL_Haptic, strength: f32, length: Uint32) bool;
extern fn SDL_HapticRumbleStop(haptic: ?*SDL_Haptic) bool;

// Public API
pub const numHaptics = SDL_NumHaptics;
pub const hapticName = SDL_HapticName;
pub const hapticOpen = SDL_HapticOpen;
pub const hapticOpened = SDL_HapticOpened;
pub const hapticIndex = SDL_HapticIndex;
pub const mouseIsHaptic = SDL_MouseIsHaptic;
pub const hapticOpenFromMouse = SDL_HapticOpenFromMouse;
pub const joystickIsHaptic = SDL_JoystickIsHaptic;
pub const hapticOpenFromJoystick = SDL_HapticOpenFromJoystick;
pub const hapticClose = SDL_HapticClose;
pub const hapticNumEffects = SDL_HapticNumEffects;
pub const hapticNumEffectsPlaying = SDL_HapticNumEffectsPlaying;
pub const hapticQuery = SDL_HapticQuery;
pub const hapticNumAxes = SDL_HapticNumAxes;
pub const hapticEffectSupported = SDL_HapticEffectSupported;
pub const hapticNewEffect = SDL_HapticNewEffect;
pub const hapticUpdateEffect = SDL_HapticUpdateEffect;
pub const hapticRunEffect = SDL_HapticRunEffect;
pub const hapticStopEffect = SDL_HapticStopEffect;
pub const hapticDestroyEffect = SDL_HapticDestroyEffect;
pub const hapticGetEffectStatus = SDL_HapticGetEffectStatus;
pub const hapticSetGain = SDL_HapticSetGain;
pub const hapticSetAutocenter = SDL_HapticSetAutocenter;
pub const hapticPause = SDL_HapticPause;
pub const hapticUnpause = SDL_HapticUnpause;
pub const hapticStopAll = SDL_HapticStopAll;
pub const hapticRumbleSupported = SDL_HapticRumbleSupported;
pub const hapticRumbleInit = SDL_HapticRumbleInit;
pub const hapticRumblePlay = SDL_HapticRumblePlay;
pub const hapticRumbleStop = SDL_HapticRumbleStop;
