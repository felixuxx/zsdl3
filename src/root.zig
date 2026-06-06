const dynamic = @import("dynamic.zig");

pub const core = @import("core.zig");
pub const camera = @import("camera.zig");
pub const pixels = @import("pixels.zig");
pub const video = @import("video.zig");
pub const surface = @import("surface.zig");
pub const events = @import("events.zig");
pub const input = @import("input.zig");
pub const render = @import("render.zig");
pub const gpu = @import("gpu.zig");
pub const image = @import("image.zig");
pub const audio = @import("audio.zig");
pub const time = @import("time.zig");
pub const threads = @import("threads.zig");
pub const filesystem = @import("filesystem.zig");
pub const hints = @import("hints.zig");
pub const properties = @import("properties.zig");
pub const log = @import("log.zig");
pub const clipboard = @import("clipboard.zig");
pub const platform = @import("platform.zig");
pub const power = @import("power.zig");
pub const system = @import("system.zig");
pub const keycode = @import("keycode.zig");
pub const locale = @import("locale.zig");
pub const messagebox = @import("messagebox.zig");
pub const misc = @import("misc.zig");
pub const stdinc = @import("stdinc.zig");
pub const vulkan = @import("vulkan.zig");
pub const tray = @import("tray.zig");
pub const hidapi = @import("hidapi.zig");
pub const storage = @import("storage.zig");
pub const assert = @import("assert.zig");
pub const sharedobject = @import("sharedobject.zig");
pub const haptic = @import("haptic.zig");
pub const process = @import("process.zig");
pub const metal = @import("metal.zig");
pub const sensor = @import("sensor.zig");
pub const pen = @import("pen.zig");
pub const touch = @import("touch.zig");
pub const asyncio = @import("asyncio.zig");
pub const atomic = @import("atomic.zig");
pub const bits = @import("bits.zig");
pub const cpuinfo = @import("cpuinfo.zig");
pub const dialog = @import("dialog.zig");
pub const endian = @import("endian.zig");
pub const guid = @import("guid.zig");
pub const intrinsics = @import("intrinsics.zig");
pub const ttf = @import("ttf.zig");

// Re-export common types and constants for convenience
pub const Sint8 = core.Sint8;
pub const Uint8 = core.Uint8;
pub const Sint16 = core.Sint16;
pub const Uint16 = core.Uint16;
pub const Sint32 = core.Sint32;
pub const Uint32 = core.Uint32;
pub const Sint64 = core.Sint64;
pub const Uint64 = core.Uint64;

pub const SDL_DisplayID = core.SDL_DisplayID;
pub const SDL_WindowID = core.SDL_WindowID;
pub const SDL_KeyboardID = core.SDL_KeyboardID;
pub const SDL_SensorID = core.SDL_SensorID;
pub const SDL_PenID = core.SDL_PenID;
pub const SDL_JoystickID = core.SDL_JoystickID;
pub const SDL_GamepadID = core.SDL_GamepadID;
pub const SDL_Keymod = core.SDL_Keymod;
pub const SDL_Keycode = core.SDL_Keycode;
pub const SDL_Scancode = core.SDL_Scancode;

pub const SDL_InitFlags = core.SDL_InitFlags;
pub const SDL_INIT_AUDIO = core.SDL_INIT_AUDIO;
pub const SDL_INIT_VIDEO = core.SDL_INIT_VIDEO;
pub const SDL_INIT_JOYSTICK = core.SDL_INIT_JOYSTICK;
pub const SDL_INIT_HAPTIC = core.SDL_INIT_HAPTIC;
pub const SDL_INIT_GAMEPAD = core.SDL_INIT_GAMEPAD;
pub const SDL_INIT_EVENTS = core.SDL_INIT_EVENTS;
pub const SDL_INIT_SENSOR = core.SDL_INIT_SENSOR;
pub const SDL_INIT_CAMERA = core.SDL_INIT_CAMERA;
pub const SDL_AppResult = core.SDL_AppResult;
pub const SDL_AppInit_func = core.SDL_AppInit_func;
pub const SDL_AppIterate_func = core.SDL_AppIterate_func;
pub const SDL_AppEvent_func = core.SDL_AppEvent_func;
pub const SDL_AppQuit_func = core.SDL_AppQuit_func;
pub const SDL_MainThreadCallback = core.SDL_MainThreadCallback;

pub const SDL_EventType = core.SDL_EventType;
pub const SDL_Event = core.SDL_Event;
pub const SDL_CommonEvent = core.SDL_CommonEvent;
pub const SDL_QuitEvent = core.SDL_QuitEvent;
pub const SDL_KeyboardEvent = core.SDL_KeyboardEvent;
pub const SDL_MouseMotionEvent = core.SDL_MouseMotionEvent;
pub const SDL_TextEditingEvent = core.SDL_TextEditingEvent;
pub const SDL_TextEditingCandidatesEvent = core.SDL_TextEditingCandidatesEvent;
pub const SDL_TextInputEvent = core.SDL_TextInputEvent;
pub const SDL_PropertiesID = core.SDL_PropertiesID;
pub const SDL_Version = core.SDL_Version;

pub const SDL_EVENT_FIRST = core.SDL_EVENT_FIRST;
pub const SDL_EVENT_QUIT = core.SDL_EVENT_QUIT;
pub const SDL_EVENT_KEY_DOWN = core.SDL_EVENT_KEY_DOWN;
pub const SDL_EVENT_KEY_UP = core.SDL_EVENT_KEY_UP;
pub const SDL_EVENT_MOUSE_MOTION = core.SDL_EVENT_MOUSE_MOTION;
pub const SDL_EVENT_MOUSE_BUTTON_DOWN = core.SDL_EVENT_MOUSE_BUTTON_DOWN;
pub const SDL_EVENT_MOUSE_BUTTON_UP = core.SDL_EVENT_MOUSE_BUTTON_UP;
pub const SDL_EVENT_MOUSE_WHEEL = core.SDL_EVENT_MOUSE_WHEEL;

pub const SDL_Point = pixels.SDL_Point;
pub const SDL_FPoint = pixels.SDL_FPoint;
pub const SDL_Rect = pixels.SDL_Rect;
pub const SDL_FRect = pixels.SDL_FRect;
pub const SDL_Color = pixels.SDL_Color;
pub const SDL_Palette = pixels.SDL_Palette;
pub const SDL_PixelFormat = pixels.SDL_PixelFormat;
pub const SDL_BlendMode = pixels.SDL_BlendMode;
pub const SDL_BlendOperation = pixels.SDL_BlendOperation;
pub const SDL_BlendFactor = pixels.SDL_BlendFactor;
pub const SDL_PointInRect = pixels.SDL_PointInRect;
pub const SDL_RectEmpty = pixels.SDL_RectEmpty;
pub const SDL_PIXELFORMAT_RGBA8888 = pixels.SDL_PIXELFORMAT_RGBA8888;
pub const SDL_PIXELFORMAT_ARGB8888 = pixels.SDL_PIXELFORMAT_ARGB8888;
pub const SDL_PIXELFORMAT_ABGR8888 = pixels.SDL_PIXELFORMAT_ABGR8888;
pub const SDL_PIXELFORMAT_BGRA8888 = pixels.SDL_PIXELFORMAT_BGRA8888;
pub const SDL_PIXELFORMAT_RGB565 = pixels.SDL_PIXELFORMAT_RGB565;
pub const SDL_Surface = video.SDL_Surface;
pub const SDL_Window = video.SDL_Window;
pub const SDL_WindowFlags = video.SDL_WindowFlags;
pub const SDL_WINDOW_FULLSCREEN = video.SDL_WINDOW_FULLSCREEN;
pub const SDL_WINDOW_OPENGL = video.SDL_WINDOW_OPENGL;
pub const SDL_WINDOW_OCCLUDED = video.SDL_WINDOW_OCCLUDED;
pub const SDL_WINDOW_HIDDEN = video.SDL_WINDOW_HIDDEN;
pub const SDL_WINDOW_BORDERLESS = video.SDL_WINDOW_BORDERLESS;
pub const SDL_WINDOW_RESIZABLE = video.SDL_WINDOW_RESIZABLE;
pub const SDL_WINDOW_MINIMIZED = video.SDL_WINDOW_MINIMIZED;
pub const SDL_WINDOW_MAXIMIZED = video.SDL_WINDOW_MAXIMIZED;
pub const SDL_WINDOW_MOUSE_GRABBED = video.SDL_WINDOW_MOUSE_GRABBED;
pub const SDL_WINDOW_INPUT_FOCUS = video.SDL_WINDOW_INPUT_FOCUS;
pub const SDL_WINDOW_MOUSE_FOCUS = video.SDL_WINDOW_MOUSE_FOCUS;
pub const SDL_WINDOW_EXTERNAL = video.SDL_WINDOW_EXTERNAL;
pub const SDL_WINDOW_MODAL = video.SDL_WINDOW_MODAL;
pub const SDL_WINDOW_HIGH_PIXEL_DENSITY = video.SDL_WINDOW_HIGH_PIXEL_DENSITY;
pub const SDL_WINDOW_MOUSE_CAPTURE = video.SDL_WINDOW_MOUSE_CAPTURE;
pub const SDL_WINDOW_MOUSE_RELATIVE_MODE = video.SDL_WINDOW_MOUSE_RELATIVE_MODE;
pub const SDL_WINDOW_ALWAYS_ON_TOP = video.SDL_WINDOW_ALWAYS_ON_TOP;
pub const SDL_WINDOW_UTILITY = video.SDL_WINDOW_UTILITY;
pub const SDL_WINDOW_TOOLTIP = video.SDL_WINDOW_TOOLTIP;
pub const SDL_WINDOW_POPUP_MENU = video.SDL_WINDOW_POPUP_MENU;
pub const SDL_WINDOW_KEYBOARD_GRABBED = video.SDL_WINDOW_KEYBOARD_GRABBED;
pub const SDL_WINDOW_FILL_DOCUMENT = video.SDL_WINDOW_FILL_DOCUMENT;
pub const SDL_WINDOW_VULKAN = video.SDL_WINDOW_VULKAN;
pub const SDL_WINDOW_METAL = video.SDL_WINDOW_METAL;
pub const SDL_WINDOW_TRANSPARENT = video.SDL_WINDOW_TRANSPARENT;
pub const SDL_WINDOW_NOT_FOCUSABLE = video.SDL_WINDOW_NOT_FOCUSABLE;
pub const SDL_WINDOWPOS_UNDEFINED = video.SDL_WINDOWPOS_UNDEFINED;
pub const SDL_WINDOWPOS_CENTERED = video.SDL_WINDOWPOS_CENTERED;
pub const SDL_FlashOperation = video.SDL_FlashOperation;
pub const SDL_ProgressState = video.SDL_ProgressState;
pub const SDL_PROGRESS_STATE_INVALID = video.SDL_ProgressState.SDL_PROGRESS_STATE_INVALID;
pub const SDL_PROGRESS_STATE_NONE = video.SDL_ProgressState.SDL_PROGRESS_STATE_NONE;
pub const SDL_PROGRESS_STATE_INDETERMINATE = video.SDL_ProgressState.SDL_PROGRESS_STATE_INDETERMINATE;
pub const SDL_PROGRESS_STATE_NORMAL = video.SDL_PROGRESS_STATE_NORMAL;
pub const SDL_PROGRESS_STATE_PAUSED = video.SDL_PROGRESS_STATE_PAUSED;
pub const SDL_PROGRESS_STATE_ERROR = video.SDL_PROGRESS_STATE_ERROR;
pub const SDL_DisplayMode = video.SDL_DisplayMode;
pub const SDL_DisplayOrientation = video.SDL_DisplayOrientation;
pub const SDL_SystemTheme = video.SDL_SystemTheme;
pub const SDL_HitTestResult = video.SDL_HitTestResult;
pub const SDL_GLContext = video.SDL_GLContext;

pub const SDL_FlipMode = surface.SDL_FlipMode;
pub const SDL_FLIP_NONE = surface.SDL_FlipMode.SDL_FLIP_NONE;
pub const SDL_FLIP_HORIZONTAL = surface.SDL_FlipMode.SDL_FLIP_HORIZONTAL;
pub const SDL_FLIP_VERTICAL = surface.SDL_FlipMode.SDL_FLIP_VERTICAL;
pub const SDL_FLIP_HORIZONTAL_AND_VERTICAL = surface.SDL_FlipMode.SDL_FLIP_HORIZONTAL_AND_VERTICAL;

pub const SDL_Renderer = render.SDL_Renderer;
pub const SDL_Texture = render.SDL_Texture;
pub const SDL_Vertex = render.SDL_Vertex;
pub const SDL_FColor = render.SDL_FColor;
pub const SDL_ScaleMode = render.SDL_ScaleMode;
pub const SDL_SCALEMODE_INVALID = render.SDL_ScaleMode.SDL_SCALEMODE_INVALID;
pub const SDL_SCALEMODE_NEAREST = render.SDL_ScaleMode.SDL_SCALEMODE_NEAREST;
pub const SDL_SCALEMODE_LINEAR = render.SDL_ScaleMode.SDL_SCALEMODE_LINEAR;
pub const SDL_SCALEMODE_PIXELART = render.SDL_ScaleMode.SDL_SCALEMODE_PIXELART;
pub const SDL_RendererLogicalPresentation = render.SDL_RendererLogicalPresentation;
pub const SDL_LOGICAL_PRESENTATION_DISABLED = render.SDL_RendererLogicalPresentation.SDL_LOGICAL_PRESENTATION_DISABLED;
pub const SDL_LOGICAL_PRESENTATION_STRETCH = render.SDL_RendererLogicalPresentation.SDL_LOGICAL_PRESENTATION_STRETCH;
pub const SDL_LOGICAL_PRESENTATION_LETTERBOX = render.SDL_RendererLogicalPresentation.SDL_LOGICAL_PRESENTATION_LETTERBOX;
pub const SDL_LOGICAL_PRESENTATION_OVERSCAN = render.SDL_RendererLogicalPresentation.SDL_LOGICAL_PRESENTATION_OVERSCAN;
pub const SDL_LOGICAL_PRESENTATION_INTEGER_SCALE = render.SDL_RendererLogicalPresentation.SDL_LOGICAL_PRESENTATION_INTEGER_SCALE;
pub const SDL_RENDERER_SOFTWARE = render.SDL_RENDERER_SOFTWARE;
pub const SDL_RENDERER_ACCELERATED = render.SDL_RENDERER_ACCELERATED;
pub const SDL_RENDERER_PRESENTVSYNC = render.SDL_RENDERER_PRESENTVSYNC;
pub const SDL_RENDERER_TARGETTEXTURE = render.SDL_RENDERER_TARGETTEXTURE;
pub const SDL_TextureAccess = render.SDL_TextureAccess;
pub const SDL_TEXTUREACCESS_STATIC = render.SDL_TEXTUREACCESS_STATIC;
pub const SDL_TEXTUREACCESS_STREAMING = render.SDL_TEXTUREACCESS_STREAMING;
pub const SDL_TEXTUREACCESS_TARGET = render.SDL_TEXTUREACCESS_TARGET;
pub const SDL_TextureAddressMode = render.SDL_TextureAddressMode;
pub const SDL_TEXTURE_ADDRESS_INVALID = render.SDL_TextureAddressMode.SDL_TEXTURE_ADDRESS_INVALID;
pub const SDL_TEXTURE_ADDRESS_AUTO = render.SDL_TextureAddressMode.SDL_TEXTURE_ADDRESS_AUTO;
pub const SDL_TEXTURE_ADDRESS_CLAMP = render.SDL_TextureAddressMode.SDL_TEXTURE_ADDRESS_CLAMP;
pub const SDL_TEXTURE_ADDRESS_WRAP = render.SDL_TextureAddressMode.SDL_TEXTURE_ADDRESS_WRAP;
pub const SDL_Colorspace = render.SDL_Colorspace;
pub const SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER = render.SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER;
pub const SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER = render.SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER;
pub const SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER = render.SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER;
pub const SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER = render.SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER;
pub const SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER = render.SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER;

pub const SDL_AudioSpec = audio.SDL_AudioSpec;
pub const SDL_AudioDeviceID = audio.SDL_AudioDeviceID;
pub const SDL_AudioStream = audio.SDL_AudioStream;
pub const SDL_AudioFormat = audio.SDL_AudioFormat;
pub const SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK = audio.SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK;
pub const SDL_AUDIO_DEVICE_DEFAULT_RECORDING = audio.SDL_AUDIO_DEVICE_DEFAULT_RECORDING;
pub const SDL_AUDIO_UNKNOWN = audio.SDL_AUDIO_UNKNOWN;
pub const SDL_AUDIO_U8 = audio.SDL_AUDIO_U8;
pub const SDL_AUDIO_S8 = audio.SDL_AUDIO_S8;
pub const SDL_AUDIO_S16LE = audio.SDL_AUDIO_S16LE;
pub const SDL_AUDIO_S16BE = audio.SDL_AUDIO_S16BE;
pub const SDL_AUDIO_S32LE = audio.SDL_AUDIO_S32LE;
pub const SDL_AUDIO_S32BE = audio.SDL_AUDIO_S32BE;
pub const SDL_AUDIO_F32LE = audio.SDL_AUDIO_F32LE;
pub const SDL_AUDIO_F32BE = audio.SDL_AUDIO_F32BE;

pub const SDL_TimerID = time.SDL_TimerID;
pub const SDL_TimerCallback = time.SDL_TimerCallback;
pub const SDL_DateTime = time.SDL_DateTime;

pub const SDL_Condition = threads.SDL_Condition;
pub const SDL_Semaphore = threads.SDL_Semaphore;

pub const SDL_HintPriority = hints.SDL_HintPriority;
pub const SDL_PropertyType = properties.SDL_PropertyType;
pub const SDL_LogPriority = log.SDL_LogPriority;
pub const SDL_LogCategory = log.SDL_LogCategory;
pub const SDL_LOG_CATEGORY_APPLICATION = @intFromEnum(log.SDL_LogCategory.SDL_LOG_CATEGORY_APPLICATION);
pub const SDL_LOG_CATEGORY_ERROR = @intFromEnum(log.SDL_LogCategory.SDL_LOG_CATEGORY_ERROR);
pub const SDL_LOG_CATEGORY_ASSERT = @intFromEnum(log.SDL_LogCategory.SDL_LOG_CATEGORY_ASSERT);
pub const SDL_LOG_CATEGORY_SYSTEM = @intFromEnum(log.SDL_LogCategory.SDL_LOG_CATEGORY_SYSTEM);
pub const SDL_LOG_CATEGORY_AUDIO = @intFromEnum(log.SDL_LogCategory.SDL_LOG_CATEGORY_AUDIO);
pub const SDL_LOG_CATEGORY_VIDEO = @intFromEnum(log.SDL_LogCategory.SDL_LOG_CATEGORY_VIDEO);
pub const SDL_LOG_CATEGORY_RENDER = @intFromEnum(log.SDL_LogCategory.SDL_LOG_CATEGORY_RENDER);
pub const SDL_LOG_CATEGORY_INPUT = @intFromEnum(log.SDL_LogCategory.SDL_LOG_CATEGORY_INPUT);
pub const SDL_LOG_CATEGORY_TEST = @intFromEnum(log.SDL_LogCategory.SDL_LOG_CATEGORY_TEST);
pub const SDL_LOG_CATEGORY_GPU = @intFromEnum(log.SDL_LogCategory.SDL_LOG_CATEGORY_GPU);
pub const SDL_LOG_PRIORITY_VERBOSE = @intFromEnum(log.SDL_LogPriority.SDL_LOG_PRIORITY_VERBOSE);
pub const SDL_LOG_PRIORITY_DEBUG = @intFromEnum(log.SDL_LogPriority.SDL_LOG_PRIORITY_DEBUG);
pub const SDL_LOG_PRIORITY_INFO = @intFromEnum(log.SDL_LogPriority.SDL_LOG_PRIORITY_INFO);
pub const SDL_LOG_PRIORITY_WARN = @intFromEnum(log.SDL_LogPriority.SDL_LOG_PRIORITY_WARN);
pub const SDL_LOG_PRIORITY_ERROR = @intFromEnum(log.SDL_LogPriority.SDL_LOG_PRIORITY_ERROR);
pub const SDL_LOG_PRIORITY_CRITICAL = @intFromEnum(log.SDL_LogPriority.SDL_LOG_PRIORITY_CRITICAL);

pub const SDL_SCANCODE_UNKNOWN = keycode.SDL_SCANCODE_UNKNOWN;
pub const SDL_SCANCODE_A = keycode.SDL_SCANCODE_A;
pub const SDL_SCANCODE_B = keycode.SDL_SCANCODE_B;
pub const SDL_SCANCODE_C = keycode.SDL_SCANCODE_C;
pub const SDL_SCANCODE_D = keycode.SDL_SCANCODE_D;
pub const SDL_SCANCODE_E = keycode.SDL_SCANCODE_E;
pub const SDL_SCANCODE_F = keycode.SDL_SCANCODE_F;
pub const SDL_SCANCODE_G = keycode.SDL_SCANCODE_G;
pub const SDL_SCANCODE_H = keycode.SDL_SCANCODE_H;
pub const SDL_SCANCODE_I = keycode.SDL_SCANCODE_I;
pub const SDL_SCANCODE_J = keycode.SDL_SCANCODE_J;
pub const SDL_SCANCODE_K = keycode.SDL_SCANCODE_K;
pub const SDL_SCANCODE_L = keycode.SDL_SCANCODE_L;
pub const SDL_SCANCODE_M = keycode.SDL_SCANCODE_M;
pub const SDL_SCANCODE_N = keycode.SDL_SCANCODE_N;
pub const SDL_SCANCODE_O = keycode.SDL_SCANCODE_O;
pub const SDL_SCANCODE_P = keycode.SDL_SCANCODE_P;
pub const SDL_SCANCODE_Q = keycode.SDL_SCANCODE_Q;
pub const SDL_SCANCODE_R = keycode.SDL_SCANCODE_R;
pub const SDL_SCANCODE_S = keycode.SDL_SCANCODE_S;
pub const SDL_SCANCODE_T = keycode.SDL_SCANCODE_T;
pub const SDL_SCANCODE_U = keycode.SDL_SCANCODE_U;
pub const SDL_SCANCODE_V = keycode.SDL_SCANCODE_V;
pub const SDL_SCANCODE_W = keycode.SDL_SCANCODE_W;
pub const SDL_SCANCODE_X = keycode.SDL_SCANCODE_X;
pub const SDL_SCANCODE_Y = keycode.SDL_SCANCODE_Y;
pub const SDL_SCANCODE_Z = keycode.SDL_SCANCODE_Z;
pub const SDL_SCANCODE_1 = keycode.SDL_SCANCODE_1;
pub const SDL_SCANCODE_2 = keycode.SDL_SCANCODE_2;
pub const SDL_SCANCODE_3 = keycode.SDL_SCANCODE_3;
pub const SDL_SCANCODE_4 = keycode.SDL_SCANCODE_4;
pub const SDL_SCANCODE_5 = keycode.SDL_SCANCODE_5;
pub const SDL_SCANCODE_6 = keycode.SDL_SCANCODE_6;
pub const SDL_SCANCODE_7 = keycode.SDL_SCANCODE_7;
pub const SDL_SCANCODE_8 = keycode.SDL_SCANCODE_8;
pub const SDL_SCANCODE_9 = keycode.SDL_SCANCODE_9;
pub const SDL_SCANCODE_0 = keycode.SDL_SCANCODE_0;
pub const SDL_SCANCODE_RETURN = keycode.SDL_SCANCODE_RETURN;
pub const SDL_SCANCODE_ESCAPE = keycode.SDL_SCANCODE_ESCAPE;
pub const SDL_SCANCODE_BACKSPACE = keycode.SDL_SCANCODE_BACKSPACE;
pub const SDL_SCANCODE_TAB = keycode.SDL_SCANCODE_TAB;
pub const SDL_SCANCODE_SPACE = keycode.SDL_SCANCODE_SPACE;
pub const SDL_SCANCODE_CAPSLOCK = keycode.SDL_SCANCODE_CAPSLOCK;
pub const SDL_SCANCODE_F1 = keycode.SDL_SCANCODE_F1;
pub const SDL_SCANCODE_F2 = keycode.SDL_SCANCODE_F2;
pub const SDL_SCANCODE_F3 = keycode.SDL_SCANCODE_F3;
pub const SDL_SCANCODE_F4 = keycode.SDL_SCANCODE_F4;
pub const SDL_SCANCODE_F5 = keycode.SDL_SCANCODE_F5;
pub const SDL_SCANCODE_F6 = keycode.SDL_SCANCODE_F6;
pub const SDL_SCANCODE_F7 = keycode.SDL_SCANCODE_F7;
pub const SDL_SCANCODE_F8 = keycode.SDL_SCANCODE_F8;
pub const SDL_SCANCODE_F9 = keycode.SDL_SCANCODE_F9;
pub const SDL_SCANCODE_F10 = keycode.SDL_SCANCODE_F10;
pub const SDL_SCANCODE_F11 = keycode.SDL_SCANCODE_F11;
pub const SDL_SCANCODE_F12 = keycode.SDL_SCANCODE_F12;
pub const SDL_SCANCODE_PRINTSCREEN = keycode.SDL_SCANCODE_PRINTSCREEN;
pub const SDL_SCANCODE_SCROLLLOCK = keycode.SDL_SCANCODE_SCROLLLOCK;
pub const SDL_SCANCODE_PAUSE = keycode.SDL_SCANCODE_PAUSE;
pub const SDL_SCANCODE_INSERT = keycode.SDL_SCANCODE_INSERT;
pub const SDL_SCANCODE_HOME = keycode.SDL_SCANCODE_HOME;
pub const SDL_SCANCODE_PAGEUP = keycode.SDL_SCANCODE_PAGEUP;
pub const SDL_SCANCODE_DELETE = keycode.SDL_SCANCODE_DELETE;
pub const SDL_SCANCODE_END = keycode.SDL_SCANCODE_END;
pub const SDL_SCANCODE_PAGEDOWN = keycode.SDL_SCANCODE_PAGEDOWN;
pub const SDL_SCANCODE_RIGHT = keycode.SDL_SCANCODE_RIGHT;
pub const SDL_SCANCODE_LEFT = keycode.SDL_SCANCODE_LEFT;
pub const SDL_SCANCODE_DOWN = keycode.SDL_SCANCODE_DOWN;
pub const SDL_SCANCODE_UP = keycode.SDL_SCANCODE_UP;

pub const SDLK_UNKNOWN = keycode.SDLK_UNKNOWN;
pub const SDLK_SCANCODE_MASK = keycode.SDLK_SCANCODE_MASK;
pub const SDLK_EXTENDED_MASK = keycode.SDLK_EXTENDED_MASK;
pub const SDL_SCANCODE_TO_KEYCODE = keycode.SDL_SCANCODE_TO_KEYCODE;
pub const SDLK_RETURN = keycode.SDLK_RETURN;
pub const SDLK_ESCAPE = keycode.SDLK_ESCAPE;
pub const SDLK_BACKSPACE = keycode.SDLK_BACKSPACE;
pub const SDLK_TAB = keycode.SDLK_TAB;
pub const SDLK_SPACE = keycode.SDLK_SPACE;
pub const SDLK_EXCLAIM = keycode.SDLK_EXCLAIM;
pub const SDLK_DBLAPOSTROPHE = keycode.SDLK_DBLAPOSTROPHE;
pub const SDLK_HASH = keycode.SDLK_HASH;
pub const SDLK_DOLLAR = keycode.SDLK_DOLLAR;
pub const SDLK_PERCENT = keycode.SDLK_PERCENT;
pub const SDLK_AMPERSAND = keycode.SDLK_AMPERSAND;
pub const SDLK_APOSTROPHE = keycode.SDLK_APOSTROPHE;
pub const SDLK_LEFTPAREN = keycode.SDLK_LEFTPAREN;
pub const SDLK_RIGHTPAREN = keycode.SDLK_RIGHTPAREN;
pub const SDLK_ASTERISK = keycode.SDLK_ASTERISK;
pub const SDLK_PLUS = keycode.SDLK_PLUS;
pub const SDLK_COMMA = keycode.SDLK_COMMA;
pub const SDLK_MINUS = keycode.SDLK_MINUS;
pub const SDLK_PERIOD = keycode.SDLK_PERIOD;
pub const SDLK_SLASH = keycode.SDLK_SLASH;
pub const SDLK_0 = keycode.SDLK_0;
pub const SDLK_1 = keycode.SDLK_1;
pub const SDLK_2 = keycode.SDLK_2;
pub const SDLK_3 = keycode.SDLK_3;
pub const SDLK_4 = keycode.SDLK_4;
pub const SDLK_5 = keycode.SDLK_5;
pub const SDLK_6 = keycode.SDLK_6;
pub const SDLK_7 = keycode.SDLK_7;
pub const SDLK_8 = keycode.SDLK_8;
pub const SDLK_9 = keycode.SDLK_9;
pub const SDLK_COLON = keycode.SDLK_COLON;
pub const SDLK_SEMICOLON = keycode.SDLK_SEMICOLON;
pub const SDLK_LESS = keycode.SDLK_LESS;
pub const SDLK_EQUALS = keycode.SDLK_EQUALS;
pub const SDLK_GREATER = keycode.SDLK_GREATER;
pub const SDLK_QUESTION = keycode.SDLK_QUESTION;
pub const SDLK_AT = keycode.SDLK_AT;
pub const SDLK_LEFTBRACKET = keycode.SDLK_LEFTBRACKET;
pub const SDLK_BACKSLASH = keycode.SDLK_BACKSLASH;
pub const SDLK_RIGHTBRACKET = keycode.SDLK_RIGHTBRACKET;
pub const SDLK_CARET = keycode.SDLK_CARET;
pub const SDLK_UNDERSCORE = keycode.SDLK_UNDERSCORE;
pub const SDLK_BACKQUOTE = keycode.SDLK_BACKQUOTE;
pub const SDLK_a = keycode.SDLK_a;
pub const SDLK_b = keycode.SDLK_b;
pub const SDLK_c = keycode.SDLK_c;
pub const SDLK_d = keycode.SDLK_d;
pub const SDLK_e = keycode.SDLK_e;
pub const SDLK_f = keycode.SDLK_f;
pub const SDLK_g = keycode.SDLK_g;
pub const SDLK_h = keycode.SDLK_h;
pub const SDLK_i = keycode.SDLK_i;
pub const SDLK_j = keycode.SDLK_j;
pub const SDLK_k = keycode.SDLK_k;
pub const SDLK_l = keycode.SDLK_l;
pub const SDLK_m = keycode.SDLK_m;
pub const SDLK_n = keycode.SDLK_n;
pub const SDLK_o = keycode.SDLK_o;
pub const SDLK_p = keycode.SDLK_p;
pub const SDLK_q = keycode.SDLK_q;
pub const SDLK_r = keycode.SDLK_r;
pub const SDLK_s = keycode.SDLK_s;
pub const SDLK_t = keycode.SDLK_t;
pub const SDLK_u = keycode.SDLK_u;
pub const SDLK_v = keycode.SDLK_v;
pub const SDLK_w = keycode.SDLK_w;
pub const SDLK_x = keycode.SDLK_x;
pub const SDLK_y = keycode.SDLK_y;
pub const SDLK_z = keycode.SDLK_z;
pub const SDLK_DELETE = keycode.SDLK_DELETE;
pub const SDLK_CAPSLOCK = keycode.SDLK_CAPSLOCK;
pub const SDLK_F1 = keycode.SDLK_F1;
pub const SDLK_F2 = keycode.SDLK_F2;
pub const SDLK_F3 = keycode.SDLK_F3;
pub const SDLK_F4 = keycode.SDLK_F4;
pub const SDLK_F5 = keycode.SDLK_F5;
pub const SDLK_F6 = keycode.SDLK_F6;
pub const SDLK_F7 = keycode.SDLK_F7;
pub const SDLK_F8 = keycode.SDLK_F8;
pub const SDLK_F9 = keycode.SDLK_F9;
pub const SDLK_F10 = keycode.SDLK_F10;
pub const SDLK_F11 = keycode.SDLK_F11;
pub const SDLK_F12 = keycode.SDLK_F12;
pub const SDLK_PRINTSCREEN = keycode.SDLK_PRINTSCREEN;
pub const SDLK_SCROLLLOCK = keycode.SDLK_SCROLLLOCK;
pub const SDLK_PAUSE = keycode.SDLK_PAUSE;
pub const SDLK_INSERT = keycode.SDLK_INSERT;
pub const SDLK_HOME = keycode.SDLK_HOME;
pub const SDLK_PAGEUP = keycode.SDLK_PAGEUP;
pub const SDLK_END = keycode.SDLK_END;
pub const SDLK_PAGEDOWN = keycode.SDLK_PAGEDOWN;
pub const SDLK_RIGHT = keycode.SDLK_RIGHT;
pub const SDLK_LEFT = keycode.SDLK_LEFT;
pub const SDLK_DOWN = keycode.SDLK_DOWN;
pub const SDLK_UP = keycode.SDLK_UP;
pub const SDLK_NUMLOCKCLEAR = keycode.SDLK_NUMLOCKCLEAR;
pub const SDLK_KP_DIVIDE = keycode.SDLK_KP_DIVIDE;
pub const SDLK_KP_MULTIPLY = keycode.SDLK_KP_MULTIPLY;
pub const SDLK_KP_MINUS = keycode.SDLK_KP_MINUS;
pub const SDLK_KP_PLUS = keycode.SDLK_KP_PLUS;
pub const SDLK_KP_ENTER = keycode.SDLK_KP_ENTER;
pub const SDLK_KP_1 = keycode.SDLK_KP_1;
pub const SDLK_KP_2 = keycode.SDLK_KP_2;
pub const SDLK_KP_3 = keycode.SDLK_KP_3;
pub const SDLK_KP_4 = keycode.SDLK_KP_4;
pub const SDLK_KP_5 = keycode.SDLK_KP_5;
pub const SDLK_KP_6 = keycode.SDLK_KP_6;
pub const SDLK_KP_7 = keycode.SDLK_KP_7;
pub const SDLK_KP_8 = keycode.SDLK_KP_8;
pub const SDLK_KP_9 = keycode.SDLK_KP_9;
pub const SDLK_KP_0 = keycode.SDLK_KP_0;
pub const SDLK_KP_PERIOD = keycode.SDLK_KP_PERIOD;
pub const SDLK_KP_COMMA = keycode.SDLK_KP_COMMA;
pub const SDLK_KP_EQUALS = keycode.SDLK_KP_EQUALS;
pub const SDLK_KP_LEFTPAREN = keycode.SDLK_KP_LEFTPAREN;
pub const SDLK_KP_RIGHTPAREN = keycode.SDLK_KP_RIGHTPAREN;
pub const SDLK_APPLICATION = keycode.SDLK_APPLICATION;
pub const SDLK_POWER = keycode.SDLK_POWER;
pub const SDLK_KP_EQUALSAS400 = keycode.SDLK_KP_EQUALSAS400;
pub const SDLK_CURRENCYUNIT = keycode.SDLK_CURRENCYUNIT;
pub const SDLK_CURRENCYSUBUNIT = keycode.SDLK_CURRENCYSUBUNIT;

pub const SDL_EventAction = events.SDL_EventAction;
pub const SDL_WindowEvent = events.SDL_WindowEvent;
pub const SDL_DisplayEvent = events.SDL_DisplayEvent;
pub const SDL_KeyboardDeviceEvent = events.SDL_KeyboardDeviceEvent;
pub const SDL_MouseButtonEvent = events.SDL_MouseButtonEvent;
pub const SDL_MouseWheelEvent = events.SDL_MouseWheelEvent;
pub const SDL_JoystickDeviceEvent = events.SDL_JoyDeviceEvent;
pub const SDL_JoystickButtonEvent = events.SDL_JoyButtonEvent;
pub const SDL_JoystickHatEvent = events.SDL_JoyHatEvent;
pub const SDL_JoystickAxisEvent = events.SDL_JoyAxisEvent;
pub const SDL_GamepadDeviceEvent = events.SDL_GamepadDeviceEvent;
pub const SDL_GamepadButtonEvent = events.SDL_GamepadButtonEvent;
pub const SDL_GamepadAxisEvent = events.SDL_GamepadAxisEvent;
pub const SDL_TouchFingerEvent = events.SDL_TouchFingerEvent;
pub const SDL_GestureEvent = events.SDL_GestureEvent;
pub const SDL_DropEvent = events.SDL_DropEvent;
pub const SDL_AudioDeviceEvent = events.SDL_AudioDeviceEvent;
pub const SDL_CameraDeviceEvent = events.SDL_CameraDeviceEvent;
pub const SDL_SensorEvent = events.SDL_SensorEvent;
pub const SDL_PenEvent = events.SDL_PenEvent;
pub const SDL_PenAxisEvent = events.SDL_PenAxisEvent;
pub const SDL_JoystickType = input.SDL_JoystickType;
pub const SDL_JoystickConnectionState = input.SDL_JoystickConnectionState;
pub const SDL_VirtualJoystickTouchpadDesc = input.SDL_VirtualJoystickTouchpadDesc;
pub const SDL_VirtualJoystickSensorDesc = input.SDL_VirtualJoystickSensorDesc;
pub const SDL_VirtualJoystickDesc = input.SDL_VirtualJoystickDesc;
pub const SDL_GamepadType = input.SDL_GamepadType;
pub const SDL_GamepadAxis = input.SDL_GamepadAxis;
pub const SDL_GamepadButton = input.SDL_GamepadButton;
pub const SDL_GamepadButtonLabel = input.SDL_GamepadButtonLabel;
pub const SDL_GamepadBindingType = input.SDL_GamepadBindingType;
pub const SDL_GamepadBinding = input.SDL_GamepadBinding;
pub const SDL_SystemCursor = input.SDL_SystemCursor;
pub const SDL_Joystick = input.SDL_Joystick;
pub const SDL_Gamepad = input.SDL_Gamepad;
pub const SDL_PowerState = power.SDL_PowerState;
pub const SDL_PROP_APP_METADATA_NAME_STRING = core.SDL_PROP_APP_METADATA_NAME_STRING;
pub const SDL_PROP_APP_METADATA_VERSION_STRING = core.SDL_PROP_APP_METADATA_VERSION_STRING;
pub const SDL_PROP_APP_METADATA_IDENTIFIER_STRING = core.SDL_PROP_APP_METADATA_IDENTIFIER_STRING;
pub const SDL_PROP_APP_METADATA_CREATOR_STRING = core.SDL_PROP_APP_METADATA_CREATOR_STRING;
pub const SDL_PROP_APP_METADATA_COPYRIGHT_STRING = core.SDL_PROP_APP_METADATA_COPYRIGHT_STRING;
pub const SDL_PROP_APP_METADATA_URL_STRING = core.SDL_PROP_APP_METADATA_URL_STRING;
pub const SDL_PROP_APP_METADATA_TYPE_STRING = core.SDL_PROP_APP_METADATA_TYPE_STRING;
pub const SDL_EVENT_TERMINATING = events.SDL_EVENT_TERMINATING;
pub const SDL_EVENT_LOW_MEMORY = events.SDL_EVENT_LOW_MEMORY;
pub const SDL_EVENT_WILL_ENTER_BACKGROUND = events.SDL_EVENT_WILL_ENTER_BACKGROUND;
pub const SDL_EVENT_DID_ENTER_BACKGROUND = events.SDL_EVENT_DID_ENTER_BACKGROUND;
pub const SDL_EVENT_WILL_ENTER_FOREGROUND = events.SDL_EVENT_WILL_ENTER_FOREGROUND;
pub const SDL_EVENT_DID_ENTER_FOREGROUND = events.SDL_EVENT_DID_ENTER_FOREGROUND;
pub const SDL_EVENT_WINDOW_SHOWN = events.SDL_EVENT_WINDOW_SHOWN;
pub const SDL_EVENT_WINDOW_HIDDEN = events.SDL_EVENT_WINDOW_HIDDEN;
pub const SDL_EVENT_WINDOW_EXPOSED = events.SDL_EVENT_WINDOW_EXPOSED;
pub const SDL_EVENT_WINDOW_MOVED = events.SDL_EVENT_WINDOW_MOVED;
pub const SDL_EVENT_WINDOW_RESIZED = events.SDL_EVENT_WINDOW_RESIZED;
pub const SDL_EVENT_WINDOW_SIZE_CHANGED = events.SDL_EVENT_WINDOW_SIZE_CHANGED;
pub const SDL_EVENT_WINDOW_MINIMIZED = events.SDL_EVENT_WINDOW_MINIMIZED;
pub const SDL_EVENT_WINDOW_MAXIMIZED = events.SDL_EVENT_WINDOW_MAXIMIZED;
pub const SDL_EVENT_WINDOW_RESTORED = events.SDL_EVENT_WINDOW_RESTORED;
pub const SDL_EVENT_WINDOW_MOUSE_ENTER = events.SDL_EVENT_WINDOW_MOUSE_ENTER;
pub const SDL_EVENT_WINDOW_MOUSE_LEAVE = events.SDL_EVENT_WINDOW_MOUSE_LEAVE;
pub const SDL_EVENT_WINDOW_FOCUS_GAINED = events.SDL_EVENT_WINDOW_FOCUS_GAINED;
pub const SDL_EVENT_WINDOW_FOCUS_LOST = events.SDL_EVENT_WINDOW_FOCUS_LOST;
pub const SDL_EVENT_WINDOW_CLOSE_REQUESTED = events.SDL_EVENT_WINDOW_CLOSE_REQUESTED;
pub const SDL_EVENT_WINDOW_TAKE_FOCUS = events.SDL_EVENT_WINDOW_TAKE_FOCUS;
pub const SDL_EVENT_WINDOW_HIT_TEST = events.SDL_EVENT_WINDOW_HIT_TEST;
pub const SDL_EVENT_WINDOW_ICCPROF_CHANGED = events.SDL_EVENT_WINDOW_ICCPROF_CHANGED;
pub const SDL_EVENT_WINDOW_DISPLAY_CHANGED = events.SDL_EVENT_WINDOW_DISPLAY_CHANGED;
pub const SDL_EVENT_WINDOW_DISPLAY_STATE_CHANGED = events.SDL_EVENT_WINDOW_DISPLAY_STATE_CHANGED;
pub const SDL_EVENT_WINDOW_OCCLUDED = events.SDL_EVENT_WINDOW_OCCLUDED;
pub const SDL_EVENT_WINDOW_ENTER_FULLSCREEN = events.SDL_EVENT_WINDOW_ENTER_FULLSCREEN;
pub const SDL_EVENT_WINDOW_LEAVE_FULLSCREEN = events.SDL_EVENT_WINDOW_LEAVE_FULLSCREEN;
pub const SDL_EVENT_WINDOW_DESTROYED = events.SDL_EVENT_WINDOW_DESTROYED;
pub const SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED = events.SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED;
pub const SDL_EVENT_TEXT_EDITING = events.SDL_EVENT_TEXT_EDITING;
pub const SDL_EVENT_TEXT_INPUT = events.SDL_EVENT_TEXT_INPUT;
pub const SDL_EVENT_KEYMAP_CHANGED = events.SDL_EVENT_KEYMAP_CHANGED;

pub const SDL_DialogFileCallback = dialog.SDL_DialogFileCallback;
pub const SDL_DialogFileFilter = dialog.SDL_DialogFileFilter;
pub const SDL_GPUDevice = gpu.SDL_GPUDevice;
pub const SDL_GPUFence = gpu.SDL_GPUFence;
pub const SDL_GPUIndexElementSize = gpu.SDL_GPUIndexElementSize;
pub const SDL_GPULoadOp = gpu.SDL_GPULoadOp;
pub const SDL_GPUPresentMode = gpu.SDL_GPUPresentMode;
pub const SDL_GPUPrimitiveType = gpu.SDL_GPUPrimitiveType;
pub const SDL_GPUStoreOp = gpu.SDL_GPUStoreOp;
pub const SDL_GPUSwapchainComposition = gpu.SDL_GPUSwapchainComposition;
pub const SDL_GPU_TEXTURETYPE_2D = gpu.SDL_GPUTextureType.SDL_GPU_TEXTURETYPE_2D;
pub const SDL_GPU_SAMPLECOUNT_1 = gpu.SDL_GPUSampleCount.SDL_GPU_SAMPLECOUNT_1;
pub const SDL_GPU_FILTER_NEAREST = gpu.SDL_GPUFilter.SDL_GPU_FILTER_NEAREST;
pub const SDL_GPU_FILTER_LINEAR = gpu.SDL_GPUFilter.SDL_GPU_FILTER_LINEAR;
pub const SDL_GPU_SAMPLERMIPMAPMODE_LINEAR = gpu.SDL_GPUSamplerMipmapMode.SDL_GPU_SAMPLERMIPMAPMODE_LINEAR;
pub const SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE = gpu.SDL_GPUSamplerAddressMode.SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
pub const SDL_GPU_COMPAREOP_NEVER = gpu.SDL_GPUCompareOp.SDL_GPU_COMPAREOP_NEVER;
pub const SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD = gpu.SDL_GPUTransferBufferUsage.SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD;
pub const SDL_GPUBuffer = gpu.SDL_GPUBuffer;
pub const SDL_GPUTransferBuffer = gpu.SDL_GPUTransferBuffer;
pub const SDL_GPUTexture = gpu.SDL_GPUTexture;
pub const SDL_GPUSampler = gpu.SDL_GPUSampler;
pub const SDL_GPUShader = gpu.SDL_GPUShader;
pub const SDL_GPUComputePipeline = gpu.SDL_GPUComputePipeline;
pub const SDL_GPUGraphicsPipeline = gpu.SDL_GPUGraphicsPipeline;
pub const SDL_GPUCommandBuffer = gpu.SDL_GPUCommandBuffer;
pub const SDL_GPURenderPass = gpu.SDL_GPURenderPass;
pub const SDL_GPUComputePass = gpu.SDL_GPUComputePass;
pub const SDL_GPUCopyPass = gpu.SDL_GPUCopyPass;
pub const SDL_PROP_GPU_DEVICE_NAME_STRING = gpu.SDL_PROP_GPU_DEVICE_NAME_STRING;
pub const SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING = gpu.SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING;
pub const SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING = gpu.SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING;
pub const SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING = gpu.SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING;
pub const SDL_GPUBlendFactor = gpu.SDL_GPUBlendFactor;
pub const SDL_GPUBlendOp = gpu.SDL_GPUBlendOp;
pub const SDL_GPUBlitInfo = gpu.SDL_GPUBlitInfo;
pub const SDL_GPUBlitRegion = gpu.SDL_GPUBlitRegion;
pub const SDL_GPUBufferBinding = gpu.SDL_GPUBufferBinding;
pub const SDL_GPUBufferCreateInfo = gpu.SDL_GPUBufferCreateInfo;
pub const SDL_GPUBufferLocation = gpu.SDL_GPUBufferLocation;
pub const SDL_GPUBufferRegion = gpu.SDL_GPUBufferRegion;
pub const SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ = gpu.SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ;
pub const SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE = gpu.SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE;
pub const SDL_GPUBufferUsageFlags = gpu.SDL_GPUBufferUsageFlags;
pub const SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ = gpu.SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ;
pub const SDL_GPU_BUFFERUSAGE_INDEX = gpu.SDL_GPU_BUFFERUSAGE_INDEX;
pub const SDL_GPU_BUFFERUSAGE_INDIRECT = gpu.SDL_GPU_BUFFERUSAGE_INDIRECT;
pub const SDL_GPU_BUFFERUSAGE_VERTEX = gpu.SDL_GPU_BUFFERUSAGE_VERTEX;
pub const SDL_GPU_COLORCOMPONENT_A = gpu.SDL_GPU_COLORCOMPONENT_A;
pub const SDL_GPU_COLORCOMPONENT_B = gpu.SDL_GPU_COLORCOMPONENT_B;
pub const SDL_GPUColorComponentFlags = gpu.SDL_GPUColorComponentFlags;
pub const SDL_GPU_COLORCOMPONENT_G = gpu.SDL_GPU_COLORCOMPONENT_G;
pub const SDL_GPU_COLORCOMPONENT_R = gpu.SDL_GPU_COLORCOMPONENT_R;
pub const SDL_GPUColorTargetBlendState = gpu.SDL_GPUColorTargetBlendState;
pub const SDL_GPUColorTargetDescription = gpu.SDL_GPUColorTargetDescription;
pub const SDL_GPUColorTargetInfo = gpu.SDL_GPUColorTargetInfo;
pub const SDL_GPUCompareOp = gpu.SDL_GPUCompareOp;
pub const SDL_GPUComputePipelineCreateInfo = gpu.SDL_GPUComputePipelineCreateInfo;
pub const SDL_GPUCullMode = gpu.SDL_GPUCullMode;
pub const SDL_GPUDepthStencilState = gpu.SDL_GPUDepthStencilState;
pub const SDL_GPUDepthStencilTargetInfo = gpu.SDL_GPUDepthStencilTargetInfo;
pub const SDL_GPUFillMode = gpu.SDL_GPUFillMode;
pub const SDL_GPUFilter = gpu.SDL_GPUFilter;
pub const SDL_GPUFlipMode = gpu.SDL_GPUFlipMode;
pub const SDL_GPUFrontFace = gpu.SDL_GPUFrontFace;
pub const SDL_GPUGraphicsPipelineCreateInfo = gpu.SDL_GPUGraphicsPipelineCreateInfo;
pub const SDL_GPUGraphicsPipelineTargetInfo = gpu.SDL_GPUGraphicsPipelineTargetInfo;
pub const SDL_GPUIndexedIndirectDrawCommand = gpu.SDL_GPUIndexedIndirectDrawCommand;
pub const SDL_GPUIndirectDispatchCommand = gpu.SDL_GPUIndirectDispatchCommand;
pub const SDL_GPUIndirectDrawCommand = gpu.SDL_GPUIndirectDrawCommand;
pub const SDL_GPUMultisampleState = gpu.SDL_GPUMultisampleState;
pub const SDL_GPURasterizerState = gpu.SDL_GPURasterizerState;
pub const SDL_GPUSampleCount = gpu.SDL_GPUSampleCount;
pub const SDL_GPUSamplerAddressMode = gpu.SDL_GPUSamplerAddressMode;
pub const SDL_GPUSamplerCreateInfo = gpu.SDL_GPUSamplerCreateInfo;
pub const SDL_GPUSamplerMipmapMode = gpu.SDL_GPUSamplerMipmapMode;
pub const SDL_GPUShaderCreateInfo = gpu.SDL_GPUShaderCreateInfo;
pub const SDL_GPUShaderFormat = gpu.SDL_GPUShaderFormat;
pub const SDL_GPU_SHADERFORMAT_DXBC = gpu.SDL_GPU_SHADERFORMAT_DXBC;
pub const SDL_GPU_SHADERFORMAT_DXIL = gpu.SDL_GPU_SHADERFORMAT_DXIL;
pub const SDL_GPU_SHADERFORMAT_INVALID = gpu.SDL_GPU_SHADERFORMAT_INVALID;
pub const SDL_GPU_SHADERFORMAT_METALLIB = gpu.SDL_GPU_SHADERFORMAT_METALLIB;
pub const SDL_GPU_SHADERFORMAT_MSL = gpu.SDL_GPU_SHADERFORMAT_MSL;
pub const SDL_GPU_SHADERFORMAT_PRIVATE = gpu.SDL_GPU_SHADERFORMAT_PRIVATE;
pub const SDL_GPU_SHADERFORMAT_SPIRV = gpu.SDL_GPU_SHADERFORMAT_SPIRV;
pub const SDL_GPUShaderStage = gpu.SDL_GPUShaderStage;
pub const SDL_GPUStencilOp = gpu.SDL_GPUStencilOp;
pub const SDL_GPUStencilOpState = gpu.SDL_GPUStencilOpState;
pub const SDL_GPUStorageBufferReadWriteBinding = gpu.SDL_GPUStorageBufferReadWriteBinding;
pub const SDL_GPUStorageTextureReadWriteBinding = gpu.SDL_GPUStorageTextureReadWriteBinding;
pub const SDL_GPUTextureCreateInfo = gpu.SDL_GPUTextureCreateInfo;
pub const SDL_GPUTextureFormat = gpu.SDL_GPUTextureFormat;
pub const SDL_GPUTextureLocation = gpu.SDL_GPUTextureLocation;
pub const SDL_GPUTextureRegion = gpu.SDL_GPUTextureRegion;
pub const SDL_GPUTextureSamplerBinding = gpu.SDL_GPUTextureSamplerBinding;
pub const SDL_GPUTextureTransferInfo = gpu.SDL_GPUTextureTransferInfo;
pub const SDL_GPUTextureType = gpu.SDL_GPUTextureType;
pub const SDL_GPU_TEXTUREUSAGE_COLOR_TARGET = gpu.SDL_GPU_TEXTUREUSAGE_COLOR_TARGET;
pub const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ = gpu.SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ;
pub const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE = gpu.SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE;
pub const SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE = gpu.SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE;
pub const SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET = gpu.SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET;
pub const SDL_GPUTextureUsageFlags = gpu.SDL_GPUTextureUsageFlags;
pub const SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ = gpu.SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ;
pub const SDL_GPU_TEXTUREUSAGE_SAMPLER = gpu.SDL_GPU_TEXTUREUSAGE_SAMPLER;
pub const SDL_GPUTransferBufferCreateInfo = gpu.SDL_GPUTransferBufferCreateInfo;
pub const SDL_GPUTransferBufferLocation = gpu.SDL_GPUTransferBufferLocation;
pub const SDL_GPUTransferBufferUsage = gpu.SDL_GPUTransferBufferUsage;
pub const SDL_GPUVertexAttribute = gpu.SDL_GPUVertexAttribute;
pub const SDL_GPUVertexBufferDescription = gpu.SDL_GPUVertexBufferDescription;
pub const SDL_GPUVertexElementFormat = gpu.SDL_GPUVertexElementFormat;
pub const SDL_GPUVertexInputRate = gpu.SDL_GPUVertexInputRate;
pub const SDL_GPUVertexInputState = gpu.SDL_GPUVertexInputState;
pub const SDL_GPUViewport = gpu.SDL_GPUViewport;
pub const SDL_GPUVulkanOptions = gpu.SDL_GPUVulkanOptions;
pub const SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING = gpu.SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING;
pub const SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING = gpu.SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING;
pub const SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING = gpu.SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING;
pub const SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER = gpu.SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER;
pub const SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING = gpu.SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING;
pub const SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING = gpu.SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING;
pub const SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN;
pub const SDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER = gpu.SDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER;
pub const SDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN = gpu.SDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN;
pub const SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING = gpu.SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING;
pub const SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING = gpu.SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING;
pub const SDL_PROP_GPU_SHADER_CREATE_NAME_STRING = gpu.SDL_PROP_GPU_SHADER_CREATE_NAME_STRING;
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT = gpu.SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT;
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT = gpu.SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT;
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT = gpu.SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT;
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT = gpu.SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT;
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT = gpu.SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT;
pub const SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER = gpu.SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER;
pub const SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING = gpu.SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING;
pub const SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING = gpu.SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING;

pub const SDL_MessageBoxFlags = messagebox.SDL_MessageBoxFlags;
pub const SDL_MessageBoxButton = messagebox.SDL_MessageBoxButton;
pub const SDL_MessageBoxColor = messagebox.SDL_MessageBoxColor;
pub const SDL_MessageBoxColorScheme = messagebox.SDL_MessageBoxColorScheme;
pub const SDL_MessageBoxData = messagebox.SDL_MessageBoxData;
pub const SDL_MESSAGEBOX_ERROR = messagebox.SDL_MESSAGEBOX_ERROR;
pub const SDL_MESSAGEBOX_WARNING = messagebox.SDL_MESSAGEBOX_WARNING;
pub const SDL_MESSAGEBOX_INFORMATION = messagebox.SDL_MESSAGEBOX_INFORMATION;

pub const SDL = struct {
    _handle: dynamic.LibraryHandle,

    core: core.CoreFunctions,
    video: video.VideoFunctions,
    surface: surface.SurfaceFunctions,
    render: render.RenderFunctions,
    events: events.EventFunctions,
    input: input.InputFunctions,
    audio: audio.AudioFunctions,
    pixels: pixels.PixelFunctions,
    time: time.TimeFunctions,
    threads: threads.ThreadFunctions,
    filesystem: filesystem.FileSystemFunctions,
    hints: hints.HintFunctions,
    properties: properties.PropertyFunctions,
    log: log.LogFunctions,
    clipboard: clipboard.ClipboardFunctions,
    platform: platform.PlatformFunctions,
    power: power.PowerFunctions,
    system: system.SystemFunctions,
    misc: misc.MiscFunctions,
    stdinc: stdinc.StdincFunctions,
    process: process.ProcessFunctions,
    gpu: gpu.GpuFunctions,
    camera: camera.CameraFunctions,
    vulkan: vulkan.VulkanFunctions,
    metal: metal.MetalFunctions,
    tray: tray.TrayFunctions,
    messagebox: messagebox.MessageBoxFunctions,
    dialog: dialog.DialogFunctions,
    storage: storage.StorageFunctions,
    hidapi: hidapi.HidapiFunctions,
    sensor: sensor.SensorFunctions,
    pen: pen.PenFunctions,
    touch: touch.TouchFunctions,
    haptic: haptic.HapticFunctions,
    keycode: keycode.KeycodeFunctions,
    locale: locale.LocaleFunctions,
    assert: assert.AssertFunctions,
    sharedobject: sharedobject.SharedObjectFunctions,
    asyncio: asyncio.AsyncIOFunctions,
    atomic: atomic.AtomicFunctions,
    bits: bits.BitsFunctions,
    cpuinfo: cpuinfo.CpuInfoFunctions,
    endian: endian.EndianFunctions,
    guid: guid.GuidFunctions,
    intrinsics: intrinsics.IntrinsicsFunctions,

    pub fn load() !SDL {
        const handle = try dynamic.loadLibrary("libSDL3.so");
        errdefer dynamic.unloadLibrary(handle);
        return SDL{
            ._handle = handle,
            .core = try core.CoreFunctions.load(handle),
            .video = try video.VideoFunctions.load(handle),
            .surface = try surface.SurfaceFunctions.load(handle),
            .render = try render.RenderFunctions.load(handle),
            .events = try events.EventFunctions.load(handle),
            .input = try input.InputFunctions.load(handle),
            .audio = try audio.AudioFunctions.load(handle),
            .pixels = try pixels.PixelFunctions.load(handle),
            .time = try time.TimeFunctions.load(handle),
            .threads = try threads.ThreadFunctions.load(handle),
            .filesystem = try filesystem.FileSystemFunctions.load(handle),
            .hints = try hints.HintFunctions.load(handle),
            .properties = try properties.PropertyFunctions.load(handle),
            .log = try log.LogFunctions.load(handle),
            .clipboard = try clipboard.ClipboardFunctions.load(handle),
            .platform = try platform.PlatformFunctions.load(handle),
            .power = try power.PowerFunctions.load(handle),
            .system = try system.SystemFunctions.load(handle),
            .misc = try misc.MiscFunctions.load(handle),
            .stdinc = try stdinc.StdincFunctions.load(handle),
            .process = try process.ProcessFunctions.load(handle),
            .gpu = try gpu.GpuFunctions.load(handle),
            .camera = try camera.CameraFunctions.load(handle),
            .vulkan = try vulkan.VulkanFunctions.load(handle),
            .metal = try metal.MetalFunctions.load(handle),
            .tray = try tray.TrayFunctions.load(handle),
            .messagebox = try messagebox.MessageBoxFunctions.load(handle),
            .dialog = try dialog.DialogFunctions.load(handle),
            .storage = try storage.StorageFunctions.load(handle),
            .hidapi = try hidapi.HidapiFunctions.load(handle),
            .sensor = try sensor.SensorFunctions.load(handle),
            .pen = try pen.PenFunctions.load(handle),
            .touch = try touch.TouchFunctions.load(handle),
            .haptic = try haptic.HapticFunctions.load(handle),
            .keycode = try keycode.KeycodeFunctions.load(handle),
            .locale = try locale.LocaleFunctions.load(handle),
            .assert = try assert.AssertFunctions.load(handle),
            .sharedobject = try sharedobject.SharedObjectFunctions.load(handle),
            .asyncio = try asyncio.AsyncIOFunctions.load(handle),
            .atomic = try atomic.AtomicFunctions.load(handle),
            .bits = try bits.BitsFunctions.load(handle),
            .cpuinfo = try cpuinfo.CpuInfoFunctions.load(handle),
            .endian = try endian.EndianFunctions.load(handle),
            .guid = try guid.GuidFunctions.load(handle),
            .intrinsics = try intrinsics.IntrinsicsFunctions.load(handle),
        };
    }

    pub fn unload(self: *SDL) void {
        dynamic.unloadLibrary(self._handle);
    }
};

pub const Image = struct {
    _handle: dynamic.LibraryHandle,

    functions: image.ImageFunctions,

    pub fn load() !Image {
        const handle = try dynamic.loadLibrary("libSDL3_image.so");
        return Image{
            ._handle = handle,
            .functions = try image.ImageFunctions.loadFunctions(handle),
        };
    }

    pub fn unload(self: *Image) void {
        dynamic.unloadLibrary(self._handle);
    }
};

pub const TTF = struct {
    _handle: dynamic.LibraryHandle,

    functions: ttf.TTFFunctions,

    pub fn load() !TTF {
        const handle = try dynamic.loadLibrary("libSDL3_ttf.so");
        return TTF{
            ._handle = handle,
            .functions = try ttf.TTFFunctions.load(handle),
        };
    }

    pub fn unload(self: *TTF) void {
        dynamic.unloadLibrary(self._handle);
    }
};
