// SDL3 Zig Bindings - Root Module
// Pure Zig bindings for SDL3 without @cImport

// Import all subsystems
pub const core = @import("core.zig");
pub const camera = @import("camera.zig");
pub const pixels = @import("pixels.zig");
pub const video = @import("video.zig");
pub const surface = @import("surface.zig");
pub const events = @import("events.zig");
pub const input = @import("input.zig");
pub const render = @import("render.zig");
pub const gpu = @import("gpu.zig");
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

// Re-export core functions
pub const init = core.init;
pub const initSubSystem = core.initSubSystem;
pub const quitSubSystem = core.quitSubSystem;
pub const wasInit = core.wasInit;
pub const quit = core.quit;
pub const isMainThread = core.isMainThread;
pub const runOnMainThread = core.runOnMainThread;
pub const setAppMetadata = core.setAppMetadata;
pub const setAppMetadataProperty = core.setAppMetadataProperty;
pub const getAppMetadataProperty = core.getAppMetadataProperty;
pub const getError = core.getError;
pub const clearError = core.clearError;
pub const setError = core.setError;
pub const getVersion = core.getVersion;
pub const getRevision = core.getRevision;

// Re-export camera functions
pub const getNumCameraDrivers = camera.getNumCameraDrivers;
pub const getCameraDriver = camera.getCameraDriver;
pub const getCameraDevices = camera.getCameraDevices;
pub const getCameraDeviceName = camera.getCameraDeviceName;
pub const openCameraDevice = camera.openCameraDevice;
pub const closeCameraDevice = camera.closeCameraDevice;
pub const getCameraSpec = camera.getCameraSpec;
pub const startCamera = camera.startCamera;
pub const stopCamera = camera.stopCamera;
pub const getCameraFrame = camera.getCameraFrame;

// Re-export pixel/rect types and functions
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
pub const getPixelFormatName = pixels.getPixelFormatName;
pub const getMasksForPixelFormat = pixels.getMasksForPixelFormat;
pub const composeCustomBlendMode = pixels.composeCustomBlendMode;
pub const mapRGB = pixels.mapRGB;
pub const mapRGBA = pixels.mapRGBA;
pub const getRGB = pixels.getRGB;
pub const getRGBA = pixels.getRGBA;
pub const allocPalette = pixels.allocPalette;
pub const setPaletteColors = pixels.setPaletteColors;
pub const freePalette = pixels.freePalette;

// Re-export video functions
pub const getNumVideoDrivers = video.getNumVideoDrivers;
pub const getVideoDriver = video.getVideoDriver;
pub const getCurrentVideoDriver = video.getCurrentVideoDriver;
pub const getSystemTheme = video.getSystemTheme;
pub const getDisplays = video.getDisplays;
pub const getPrimaryDisplay = video.getPrimaryDisplay;
pub const getDisplayName = video.getDisplayName;
pub const getDisplayBounds = video.getDisplayBounds;
pub const getDisplayUsableBounds = video.getDisplayUsableBounds;
pub const getNaturalDisplayOrientation = video.getNaturalDisplayOrientation;
pub const getCurrentDisplayOrientation = video.getCurrentDisplayOrientation;
pub const getDisplayContentScale = video.getDisplayContentScale;
pub const getDesktopDisplayMode = video.getDesktopDisplayMode;
pub const getCurrentDisplayMode = video.getCurrentDisplayMode;
pub const getDisplayForPoint = video.getDisplayForPoint;
pub const getDisplayForRect = video.getDisplayForRect;
pub const getDisplayForWindow = video.getDisplayForWindow;
pub const getWindowPixelDensity = video.getWindowPixelDensity;
pub const getWindowDisplayScale = video.getWindowDisplayScale;
pub const setWindowFullscreenMode = video.setWindowFullscreenMode;
pub const getWindowFullscreenMode = video.getWindowFullscreenMode;
pub const getWindowPixelFormat = video.getWindowPixelFormat;
pub const getWindows = video.getWindows;
pub const createWindow = video.createWindow;
pub const destroyWindow = video.destroyWindow;
pub const getWindowID = video.getWindowID;
pub const getWindowFromID = video.getWindowFromID;
pub const getWindowParent = video.getWindowParent;
pub const getWindowProperties = video.getWindowProperties;
pub const getWindowFlags = video.getWindowFlags;
pub const setWindowTitle = video.setWindowTitle;
pub const getWindowTitle = video.getWindowTitle;
pub const setWindowIcon = video.setWindowIcon;
pub const setWindowPosition = video.setWindowPosition;
pub const getWindowPosition = video.getWindowPosition;
pub const setWindowSize = video.setWindowSize;
pub const getWindowSize = video.getWindowSize;
pub const getWindowBordersSize = video.getWindowBordersSize;
pub const getWindowSizeInPixels = video.getWindowSizeInPixels;
pub const setWindowMinimumSize = video.setWindowMinimumSize;
pub const getWindowMinimumSize = video.getWindowMinimumSize;
pub const setWindowMaximumSize = video.setWindowMaximumSize;
pub const getWindowMaximumSize = video.getWindowMaximumSize;
pub const setWindowBordered = video.setWindowBordered;
pub const setWindowResizable = video.setWindowResizable;
pub const setWindowAlwaysOnTop = video.setWindowAlwaysOnTop;
pub const showWindow = video.showWindow;
pub const hideWindow = video.hideWindow;
pub const raiseWindow = video.raiseWindow;
pub const maximizeWindow = video.maximizeWindow;
pub const minimizeWindow = video.minimizeWindow;
pub const restoreWindow = video.restoreWindow;
pub const setWindowFullscreen = video.setWindowFullscreen;
pub const hasWindowSurface = video.hasWindowSurface;
pub const getWindowSurface = video.getWindowSurface;
pub const updateWindowSurface = video.updateWindowSurface;
pub const updateWindowSurfaceRects = video.updateWindowSurfaceRects;
pub const destroyWindowSurface = video.destroyWindowSurface;
pub const setWindowGrab = video.setWindowGrab;
pub const setWindowKeyboardGrab = video.setWindowKeyboardGrab;
pub const setWindowMouseGrab = video.setWindowMouseGrab;
pub const getWindowGrab = video.getWindowGrab;
pub const getWindowKeyboardGrab = video.getWindowKeyboardGrab;
pub const getWindowMouseGrab = video.getWindowMouseGrab;
pub const setWindowMouseRect = video.setWindowMouseRect;
pub const getWindowMouseRect = video.getWindowMouseRect;
pub const setWindowOpacity = video.setWindowOpacity;
pub const getWindowOpacity = video.getWindowOpacity;
pub const setWindowModalFor = video.setWindowModalFor;
pub const setWindowFocusable = video.setWindowFocusable;
pub const showWindowSystemMenu = video.showWindowSystemMenu;
pub const setWindowHitTest = video.setWindowHitTest;
pub const setWindowShape = video.setWindowShape;
pub const flashWindow = video.flashWindow;
pub const setWindowGammaRamp = video.setWindowGammaRamp;
pub const getWindowGammaRamp = video.getWindowGammaRamp;
pub const disableScreenSaver = video.disableScreenSaver;
pub const enableScreenSaver = video.enableScreenSaver;
pub const isScreenSaverEnabled = video.isScreenSaverEnabled;
pub const getWindowWMInfo = video.getWindowWMInfo;

// Re-export surface functions
pub const createSurface = surface.createSurface;
pub const createSurfaceFrom = surface.createSurfaceFrom;
pub const destroySurface = surface.destroySurface;
pub const getSurfaceProperties = surface.getSurfaceProperties;
pub const setSurfaceColorspace = surface.setSurfaceColorspace;
pub const getSurfaceColorspace = surface.getSurfaceColorspace;
pub const createSurfacePalette = surface.createSurfacePalette;
pub const setSurfacePalette = surface.setSurfacePalette;
pub const getSurfacePalette = surface.getSurfacePalette;
pub const addSurfaceAlternateImage = surface.addSurfaceAlternateImage;
pub const surfaceHasAlternateImages = surface.surfaceHasAlternateImages;
pub const getSurfaceImages = surface.getSurfaceImages;
pub const removeSurfaceAlternateImages = surface.removeSurfaceAlternateImages;
pub const lockSurface = surface.lockSurface;
pub const unlockSurface = surface.unlockSurface;
pub const loadBMP = surface.loadBMP;
pub const loadBMP_IO = surface.loadBMP_IO;
pub const saveBMP = surface.saveBMP;
pub const saveBMP_IO = surface.saveBMP_IO;
pub const setSurfaceRLE = surface.setSurfaceRLE;
pub const surfaceHasRLE = surface.surfaceHasRLE;
pub const setSurfaceColorKey = surface.setSurfaceColorKey;
pub const surfaceHasColorKey = surface.surfaceHasColorKey;
pub const getSurfaceColorKey = surface.getSurfaceColorKey;
pub const setSurfaceColorMod = surface.setSurfaceColorMod;
pub const getSurfaceColorMod = surface.getSurfaceColorMod;
pub const setSurfaceAlphaMod = surface.setSurfaceAlphaMod;
pub const getSurfaceAlphaMod = surface.getSurfaceAlphaMod;
pub const setSurfaceBlendMode = surface.setSurfaceBlendMode;
pub const getSurfaceBlendMode = surface.getSurfaceBlendMode;
pub const setSurfaceClipRect = surface.setSurfaceClipRect;
pub const getSurfaceClipRect = surface.getSurfaceClipRect;
pub const flipSurface = surface.flipSurface;
pub const duplicateSurface = surface.duplicateSurface;
pub const scaleSurface = surface.scaleSurface;
pub const convertSurface = surface.convertSurface;
pub const convertSurfaceAndColorspace = surface.convertSurfaceAndColorspace;
pub const premultiplyAlpha = surface.premultiplyAlpha;
pub const clearSurface = surface.clearSurface;
pub const fillSurfaceRect = surface.fillSurfaceRect;
pub const fillSurfaceRects = surface.fillSurfaceRects;
pub const blitSurface = surface.blitSurface;
pub const blitSurfaceUnchecked = surface.blitSurfaceUnchecked;
pub const blitSurfaceScaled = surface.blitSurfaceScaled;
pub const blitSurfaceUncheckedScaled = surface.blitSurfaceUncheckedScaled;
pub const blitSurfaceTiled = surface.blitSurfaceTiled;
pub const blitSurfaceTiledWithScale = surface.blitSurfaceTiledWithScale;
pub const blitSurface9Grid = surface.blitSurface9Grid;
pub const mapSurfaceRGB = surface.mapSurfaceRGB;
pub const mapSurfaceRGBA = surface.mapSurfaceRGBA;
pub const readSurfacePixel = surface.readSurfacePixel;
pub const softStretch = surface.softStretch;
pub const softStretchLinear = surface.softStretchLinear;

// Re-export event types (core already has basic ones)
pub const SDL_Event = events.SDL_Event;
pub const SDL_EventAction = events.SDL_EventAction;

// Additional application event types (not in core)
pub const SDL_EVENT_TERMINATING = events.SDL_EVENT_TERMINATING;
pub const SDL_EVENT_LOW_MEMORY = events.SDL_EVENT_LOW_MEMORY;
pub const SDL_EVENT_WILL_ENTER_BACKGROUND = events.SDL_EVENT_WILL_ENTER_BACKGROUND;
pub const SDL_EVENT_DID_ENTER_BACKGROUND = events.SDL_EVENT_DID_ENTER_BACKGROUND;
pub const SDL_EVENT_WILL_ENTER_FOREGROUND = events.SDL_EVENT_WILL_ENTER_FOREGROUND;
pub const SDL_EVENT_DID_ENTER_FOREGROUND = events.SDL_EVENT_DID_ENTER_FOREGROUND;

// Window event types (not in core)
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

// Additional keyboard and text events (not in core)
pub const SDL_EVENT_TEXT_EDITING = events.SDL_EVENT_TEXT_EDITING;
pub const SDL_EVENT_TEXT_INPUT = events.SDL_EVENT_TEXT_INPUT;
pub const SDL_EVENT_KEYMAP_CHANGED = events.SDL_EVENT_KEYMAP_CHANGED;

// Window event structures
pub const SDL_WindowEvent = events.SDL_WindowEvent;

// Display event structures
pub const SDL_DisplayEvent = events.SDL_DisplayEvent;

// Keyboard device event structures
pub const SDL_KeyboardDeviceEvent = events.SDL_KeyboardDeviceEvent;

// Mouse event structures
pub const SDL_MouseButtonEvent = events.SDL_MouseButtonEvent;
pub const SDL_MouseWheelEvent = events.SDL_MouseWheelEvent;

// Joystick event structures
pub const SDL_JoystickDeviceEvent = events.SDL_JoystickDeviceEvent;
pub const SDL_JoystickButtonEvent = events.SDL_JoystickButtonEvent;
pub const SDL_JoystickHatEvent = events.SDL_JoystickHatEvent;
pub const SDL_JoystickAxisEvent = events.SDL_JoystickAxisEvent;

// Gamepad event structures
pub const SDL_GamepadDeviceEvent = events.SDL_GamepadDeviceEvent;
pub const SDL_GamepadButtonEvent = events.SDL_GamepadButtonEvent;
pub const SDL_GamepadAxisEvent = events.SDL_GamepadAxisEvent;

// Text event structures
pub const SDL_TextEditingEvent = events.SDL_TextEditingEvent;
pub const SDL_TextInputEvent = events.SDL_TextInputEvent;

// Touch event structures
pub const SDL_TouchFingerEvent = events.SDL_TouchFingerEvent;

// Gesture event structures
pub const SDL_GestureEvent = events.SDL_GestureEvent;

// Drop and other event structures
pub const SDL_DropEvent = events.SDL_DropEvent;
pub const SDL_AudioDeviceEvent = events.SDL_AudioDeviceEvent;
pub const SDL_CameraDeviceEvent = events.SDL_CameraDeviceEvent;
pub const SDL_SensorEvent = events.SDL_SensorEvent;
pub const SDL_PenEvent = events.SDL_PenEvent;
pub const SDL_PenAxisEvent = events.SDL_PenAxisEvent;
pub const pumpEvents = events.pumpEvents;
pub const pollEvent = events.pollEvent;
pub const waitEvent = events.waitEvent;
pub const waitEventTimeout = events.waitEventTimeout;
pub const pushEvent = events.pushEvent;
pub const filterEvents = events.filterEvents;
pub const addEventWatch = events.addEventWatch;
pub const delEventWatch = events.delEventWatch;
pub const peepEvents = events.peepEvents;
pub const hasEvent = events.hasEvent;
pub const hasEvents = events.hasEvents;
pub const flushEvent = events.flushEvent;
pub const flushEvents = events.flushEvents;
pub const setEventEnabled = events.setEventEnabled;
pub const eventEnabled = events.eventEnabled;
pub const registerEvents = events.registerEvents;
pub const getEventFilter = events.getEventFilter;
pub const setEventFilter = events.setEventFilter;
pub const getNumTouchFingers = events.getNumTouchFingers;
pub const getTouchFinger = events.getTouchFinger;
pub const getEventName = events.getEventName;

// Re-export input types
pub const SDL_JoystickType = input.SDL_JoystickType;
pub const SDL_GamepadType = input.SDL_GamepadType;
pub const SDL_GamepadAxis = input.SDL_GamepadAxis;
pub const SDL_GamepadButton = input.SDL_GamepadButton;
pub const SDL_GamepadButtonLabel = input.SDL_GamepadButtonLabel;
pub const SDL_GamepadBindingType = input.SDL_GamepadBindingType;
pub const SDL_GamepadBinding = input.SDL_GamepadBinding;
pub const SDL_SystemCursor = input.SDL_SystemCursor;
pub const SDL_Joystick = input.SDL_Joystick;
pub const SDL_Gamepad = input.SDL_Gamepad;

// Re-export input functions
pub const hasKeyboard = input.hasKeyboard;
pub const getKeyboardState = input.getKeyboardState;
pub const getModState = input.getModState;
pub const setModState = input.setModState;
pub const getKeyFromScancode = input.getKeyFromScancode;
pub const getScancodeFromKey = input.getScancodeFromKey;
pub const hasMouse = input.hasMouse;
pub const getMouseState = input.getMouseState;
pub const getGlobalMouseState = input.getGlobalMouseState;
pub const getRelativeMouseState = input.getRelativeMouseState;
pub const warpMouseInWindow = input.warpMouseInWindow;
pub const warpMouseGlobal = input.warpMouseGlobal;
pub const numJoysticks = input.numJoysticks;
pub const joystickOpen = input.joystickOpen;
pub const joystickClose = input.joystickClose;
pub const joystickName = input.joystickName;
pub const joystickPath = input.joystickPath;
pub const joystickGetType = input.joystickGetType;
pub const joystickGetGUID = input.joystickGetGUID;
pub const joystickGetVendor = input.joystickGetVendor;
pub const joystickGetProduct = input.joystickGetProduct;
pub const joystickGetProductVersion = input.joystickGetProductVersion;
pub const joystickGetFirmwareVersion = input.joystickGetFirmwareVersion;
pub const joystickGetSerial = input.joystickGetSerial;
pub const joystickGetAxis = input.joystickGetAxis;
pub const joystickGetHat = input.joystickGetHat;
pub const joystickGetBall = input.joystickGetBall;
pub const joystickGetButton = input.joystickGetButton;
pub const joystickRumble = input.joystickRumble;
pub const joystickRumbleTriggers = input.joystickRumbleTriggers;
pub const joystickHasLED = input.joystickHasLED;
pub const joystickSetLED = input.joystickSetLED;
pub const joystickSendEffect = input.joystickSendEffect;
pub const numGamepads = input.numGamepads;
pub const isGamepad = input.isGamepad;
pub const openGamepad = input.openGamepad;
pub const closeGamepad = input.closeGamepad;
pub const getGamepadName = input.getGamepadName;
pub const getGamepadPath = input.getGamepadPath;
pub const getGamepadType = input.getGamepadType;
pub const getGamepadGUID = input.getGamepadGUID;
pub const getGamepadVendor = input.getGamepadVendor;
pub const getGamepadProduct = input.getGamepadProduct;
pub const getGamepadProductVersion = input.getGamepadProductVersion;
pub const getGamepadFirmwareVersion = input.getGamepadFirmwareVersion;
pub const getGamepadSerial = input.getGamepadSerial;
pub const gamepadHasAxis = input.gamepadHasAxis;
pub const getGamepadAxis = input.getGamepadAxis;
pub const gamepadHasButton = input.gamepadHasButton;
pub const getGamepadButton = input.getGamepadButton;
pub const getGamepadButtonLabel = input.getGamepadButtonLabel;
pub const setGamepadEventsEnabled = input.setGamepadEventsEnabled;
pub const gamepadEventsEnabled = input.gamepadEventsEnabled;
pub const getGamepadBindings = input.getGamepadBindings;
pub const reloadGamepadMappings = input.reloadGamepadMappings;
pub const getGamepadMapping = input.getGamepadMapping;
pub const addGamepadMapping = input.addGamepadMapping;
pub const getGamepadMappingForGUID = input.getGamepadMappingForGUID;
pub const setGamepadMapping = input.setGamepadMapping;
pub const hasGamepad = input.hasGamepad;
pub const getGamepads = input.getGamepads;
pub const getGamepadNameForID = input.getGamepadNameForID;
pub const getGamepadPathForID = input.getGamepadPathForID;
pub const getGamepadTypeForID = input.getGamepadTypeForID;
pub const getGamepadGUIDForID = input.getGamepadGUIDForID;
pub const getGamepadVendorForID = input.getGamepadVendorForID;
pub const getGamepadProductForID = input.getGamepadProductForID;
pub const getGamepadProductVersionForID = input.getGamepadProductVersionForID;
pub const getGamepadFirmwareVersionForID = input.getGamepadFirmwareVersionForID;
pub const getGamepadSerialForID = input.getGamepadSerialForID;
pub const gamepadConnected = input.gamepadConnected;
pub const getGamepadID = input.getGamepadID;
pub const getGamepadFromID = input.getGamepadFromID;
pub const getGamepadFromPlayerIndex = input.getGamepadFromPlayerIndex;
pub const getGamepadPlayerIndex = input.getGamepadPlayerIndex;
pub const setGamepadPlayerIndex = input.setGamepadPlayerIndex;
pub const rumbleGamepad = input.rumbleGamepad;
pub const rumbleGamepadTriggers = input.rumbleGamepadTriggers;
pub const setGamepadLED = input.setGamepadLED;
pub const sendGamepadEffect = input.sendGamepadEffect;
pub const getGamepadSensorData = input.getGamepadSensorData;
pub const setGamepadSensorEnabled = input.setGamepadSensorEnabled;
pub const gamepadSensorEnabled = input.gamepadSensorEnabled;
pub const getGamepadProperties = input.getGamepadProperties;
pub const getGamepadIDMap = input.getGamepadIDMap;

// Re-export render types
pub const SDL_Renderer = render.SDL_Renderer;
pub const SDL_Texture = render.SDL_Texture;
pub const SDL_Vertex = render.SDL_Vertex;
pub const SDL_FColor = render.SDL_FColor;
pub const SDL_ScaleMode = render.SDL_ScaleMode;
pub const SDL_RendererLogicalPresentation = render.SDL_RendererLogicalPresentation;

// Re-export render functions
pub const createRenderer = render.createRenderer;
pub const destroyRenderer = render.destroyRenderer;
pub const renderClear = render.renderClear;
pub const renderPresent = render.renderPresent;
pub const setRenderDrawColor = render.setRenderDrawColor;
pub const renderLine = render.renderLine;
pub const renderFillRect = render.renderFillRect;
pub const createTexture = render.createTexture;
pub const destroyTexture = render.destroyTexture;
pub const updateTexture = render.updateTexture;
pub const renderTexture = render.renderTexture;
pub const renderGeometry = render.renderGeometry;

// Renderer properties
pub const getRendererName = render.getRendererName;
pub const getRendererProperties = render.getRendererProperties;
pub const getRenderOutputSize = render.getRenderOutputSize;
pub const getCurrentRenderOutputSize = render.getCurrentRenderOutputSize;
pub const getRenderViewport = render.getRenderViewport;
pub const setRenderViewport = render.setRenderViewport;
pub const getRenderSafeArea = render.getRenderSafeArea;
pub const getRenderWindow = render.getRenderWindow;
pub const getRendererFromTexture = render.getRendererFromTexture;

// Draw operations
pub const renderPoints = render.renderPoints;
pub const renderLines = render.renderLines;
pub const renderRect = render.renderRect;
pub const renderRects = render.renderRects;
pub const renderFillRects = render.renderFillRects;

// Target rendering
pub const setRenderTarget = render.setRenderTarget;
pub const getRenderTarget = render.getRenderTarget;

// Color and blend
pub const getRenderDrawColor = render.getRenderDrawColor;
pub const getRenderDrawBlendMode = render.getRenderDrawBlendMode;
pub const setRenderDrawBlendMode = render.setRenderDrawBlendMode;

// Texture operations
pub const createTextureFromSurface = render.createTextureFromSurface;
pub const queryTexture = render.queryTexture;
pub const lockTexture = render.lockTexture;
pub const unlockTexture = render.unlockTexture;
pub const setTextureColorMod = render.setTextureColorMod;
pub const getTextureColorMod = render.getTextureColorMod;
pub const setTextureAlphaMod = render.setTextureAlphaMod;
pub const getTextureAlphaMod = render.getTextureAlphaMod;
pub const setTextureBlendMode = render.setTextureBlendMode;
pub const getTextureBlendMode = render.getTextureBlendMode;
pub const setTextureScaleMode = render.setTextureScaleMode;
pub const getTextureScaleMode = render.getTextureScaleMode;

// Clipping
pub const setRenderClipRect = render.setRenderClipRect;
pub const getRenderClipRect = render.getRenderClipRect;
pub const renderClipEnabled = render.renderClipEnabled;

// Logical presentation
pub const setRenderLogicalPresentation = render.setRenderLogicalPresentation;
pub const getRenderLogicalPresentation = render.getRenderLogicalPresentation;
pub const setRenderLogicalSize = render.setRenderLogicalSize;
pub const getRenderLogicalSize = render.getRenderLogicalSize;

// Debug
pub const renderDebugText = render.renderDebugText;
pub const renderGeometryRaw = render.renderGeometryRaw;
pub const renderReadPixels = render.renderReadPixels;
pub const renderFlush = render.renderFlush;
pub const textureSize = render.textureSize;
pub const getRenderVSync = render.getRenderVSync;
pub const setRenderVSync = render.setRenderVSync;

// Re-export audio types and functions
pub const SDL_AudioSpec = audio.SDL_AudioSpec;
pub const SDL_AudioDeviceID = audio.SDL_AudioDeviceID;
pub const SDL_AudioStream = audio.SDL_AudioStream;
pub const openAudioDevice = audio.openAudioDevice;
pub const closeAudioDevice = audio.closeAudioDevice;
pub const pauseAudioDevice = audio.pauseAudioDevice;
pub const getAudioDeviceName = audio.getAudioDeviceName;
pub const getNumAudioDrivers = audio.getNumAudioDrivers;
pub const getAudioDriver = audio.getAudioDriver;
pub const getCurrentAudioDriver = audio.getCurrentAudioDriver;
pub const getAudioPlaybackDevices = audio.getAudioPlaybackDevices;
pub const getAudioRecordingDevices = audio.getAudioRecordingDevices;
pub const getAudioDeviceFormat = audio.getAudioDeviceFormat;
pub const resumeAudioDevice = audio.resumeAudioDevice;
pub const audioDevicePaused = audio.audioDevicePaused;
pub const clearAudioStream = audio.clearAudioStream;
pub const createAudioStream = audio.createAudioStream;
pub const destroyAudioStream = audio.destroyAudioStream;
pub const getAudioStreamData = audio.getAudioStreamData;
pub const getAudioStreamDevice = audio.getAudioStreamDevice;
pub const getAudioStreamFormat = audio.getAudioStreamFormat;
pub const getAudioStreamProperties = audio.getAudioStreamProperties;
pub const getAudioStreamQueued = audio.getAudioStreamQueued;
pub const lockAudioStream = audio.lockAudioStream;
pub const openAudioDeviceStream = audio.openAudioDeviceStream;
pub const putAudioStreamData = audio.putAudioStreamData;
pub const setAudioStreamFormat = audio.setAudioStreamFormat;
pub const setAudioStreamGetCallback = audio.setAudioStreamGetCallback;
pub const setAudioStreamPutCallback = audio.setAudioStreamPutCallback;
pub const unlockAudioStream = audio.unlockAudioStream;
pub const flushAudioStream = audio.flushAudioStream;
pub const bindAudioStream = audio.bindAudioStream;
pub const bindAudioStreams = audio.bindAudioStreams;
pub const unbindAudioStream = audio.unbindAudioStream;
pub const unbindAudioStreams = audio.unbindAudioStreams;
pub const convertAudioSamples = audio.convertAudioSamples;
pub const getAudioFormatName = audio.getAudioFormatName;
pub const getSilenceValueForFormat = audio.getSilenceValueForFormat;
pub const mixAudio = audio.mixAudio;
pub const queueAudio = audio.queueAudio;
pub const dequeueAudio = audio.dequeueAudio;
pub const getQueuedAudioSize = audio.getQueuedAudioSize;
pub const clearQueuedAudio = audio.clearQueuedAudio;

// Re-export time types and functions
pub const SDL_TimerID = time.SDL_TimerID;
pub const SDL_TimerCallback = time.SDL_TimerCallback;
pub const SDL_DateTime = time.SDL_DateTime;
pub const getTicks = time.getTicks;
pub const getTicksNS = time.getTicksNS;
pub const delay = time.delay;
pub const addTimer = time.addTimer;
pub const removeTimer = time.removeTimer;
pub const getPerformanceCounter = time.getPerformanceCounter;
pub const getPerformanceFrequency = time.getPerformanceFrequency;
pub const getCurrentTime = time.getCurrentTime;
pub const timeToDateTime = time.timeToDateTime;
pub const dateTimeToTime = time.dateTimeToTime;

// Re-export thread types and functions
pub const SDL_Condition = threads.SDL_Condition;
pub const SDL_Semaphore = threads.SDL_Semaphore;
pub const createThread = threads.createThread;
pub const waitThread = threads.waitThread;
pub const createMutex = threads.createMutex;
pub const destroyMutex = threads.destroyMutex;
pub const lockMutex = threads.lockMutex;
pub const unlockMutex = threads.unlockMutex;
pub const tryLockMutex = threads.tryLockMutex;
pub const createCondition = threads.createCondition;
pub const destroyCondition = threads.destroyCondition;
pub const signalCondition = threads.signalCondition;
pub const broadcastCondition = threads.broadcastCondition;
pub const waitCondition = threads.waitCondition;
pub const waitConditionTimeout = threads.waitConditionTimeout;
pub const createSemaphore = threads.createSemaphore;
pub const destroySemaphore = threads.destroySemaphore;
pub const semWait = threads.semWait;
pub const semTryWait = threads.semTryWait;
pub const semWaitTimeout = threads.semWaitTimeout;
pub const semPost = threads.semPost;
pub const semValue = threads.semValue;
pub const getThreadName = threads.getThreadName;
pub const setThreadPriority = threads.setThreadPriority;
pub const getCurrentThreadID = threads.getCurrentThreadID;
pub const detachThread = threads.detachThread;
pub const getThreadID = threads.getThreadID;

// Re-export filesystem functions
pub const getBasePath = filesystem.getBasePath;
pub const ioFromFile = filesystem.ioFromFile;
pub const closeIO = filesystem.closeIO;
pub const readIO = filesystem.readIO;
pub const writeIO = filesystem.writeIO;
pub const seekIO = filesystem.seekIO;
pub const tellIO = filesystem.tellIO;
pub const getIOSize = filesystem.getIOSize;
pub const flushIO = filesystem.flushIO;
pub const loadFile = filesystem.loadFile;
pub const saveFile = filesystem.saveFile;
pub const readU8 = filesystem.readU8;
pub const readS8 = filesystem.readS8;
pub const readU16LE = filesystem.readU16LE;
pub const readS16LE = filesystem.readS16LE;
pub const readU16BE = filesystem.readU16BE;
pub const readS16BE = filesystem.readS16BE;
pub const readU32LE = filesystem.readU32LE;
pub const readS32LE = filesystem.readS32LE;
pub const readU32BE = filesystem.readU32BE;
pub const readS32BE = filesystem.readS32BE;
pub const readU64LE = filesystem.readU64LE;
pub const readS64LE = filesystem.readS64LE;
pub const readU64BE = filesystem.readU64BE;
pub const readS64BE = filesystem.readS64BE;
pub const writeU8 = filesystem.writeU8;
pub const writeS8 = filesystem.writeS8;
pub const writeU16LE = filesystem.writeU16LE;
pub const writeS16LE = filesystem.writeS16LE;
pub const writeU16BE = filesystem.writeU16BE;
pub const writeS16BE = filesystem.writeS16BE;
pub const writeU32LE = filesystem.writeU32LE;
pub const writeS32LE = filesystem.writeS32LE;
pub const writeU32BE = filesystem.writeU32BE;
pub const writeS32BE = filesystem.writeS32BE;
pub const writeU64LE = filesystem.writeU64LE;
pub const writeS64LE = filesystem.writeS64LE;
pub const writeU64BE = filesystem.writeU64BE;
pub const writeS64BE = filesystem.writeS64BE;
pub const ioFromConstMem = filesystem.ioFromConstMem;
pub const ioFromMem = filesystem.ioFromMem;
pub const ioFromDynamicMem = filesystem.ioFromDynamicMem;
pub const getIOProperties = filesystem.getIOProperties;
pub const getIOStatus = filesystem.getIOStatus;

// Re-export hints types and functions
pub const SDL_HintPriority = hints.SDL_HintPriority;
pub const setHint = hints.setHint;
pub const getHint = hints.getHint;
pub const setHintWithPriority = hints.setHintWithPriority;
pub const resetHint = hints.resetHint;
pub const addHintCallback = hints.addHintCallback;
pub const delHintCallback = hints.delHintCallback;
pub const getHintBoolean = hints.getHintBoolean;

// Re-export properties types and functions
pub const SDL_PropertyType = properties.SDL_PropertyType;
pub const createProperties = properties.createProperties;
pub const destroyProperties = properties.destroyProperties;
pub const setProperty = properties.setProperty;
pub const setStringProperty = properties.setStringProperty;
pub const setNumberProperty = properties.setNumberProperty;
pub const setFloatProperty = properties.setFloatProperty;
pub const setBooleanProperty = properties.setBooleanProperty;
pub const getProperty = properties.getProperty;
pub const getStringProperty = properties.getStringProperty;
pub const getNumberProperty = properties.getNumberProperty;
pub const getFloatProperty = properties.getFloatProperty;
pub const getBooleanProperty = properties.getBooleanProperty;
pub const getPropertyType = properties.getPropertyType;
pub const propertyIterator = properties.propertyIterator;
pub const clearProperty = properties.clearProperty;
pub const enumerateProperties = properties.enumerateProperties;
pub const lockProperties = properties.lockProperties;
pub const unlockProperties = properties.unlockProperties;
pub const hasProperty = properties.hasProperty;
pub const copyProperties = properties.copyProperties;

// Re-export log types and functions
pub const SDL_LogPriority = log.SDL_LogPriority;
pub const SDL_LOG_PRIORITY_VERBOSE = 1;
pub const SDL_LOG_PRIORITY_DEBUG = 2;
pub const SDL_LOG_PRIORITY_INFO = 3;
pub const SDL_LOG_PRIORITY_WARN = 4;
pub const SDL_LOG_PRIORITY_ERROR = 5;
pub const SDL_LOG_PRIORITY_CRITICAL = 6;
pub const SDL_LogCategory = log.SDL_LogCategory;
pub const SDL_LOG_CATEGORY_APPLICATION = 0;
pub const SDL_LOG_CATEGORY_ERROR = 1;
pub const SDL_LOG_CATEGORY_ASSERT = 2;
pub const SDL_LOG_CATEGORY_SYSTEM = 3;
pub const SDL_LOG_CATEGORY_AUDIO = 4;
pub const SDL_LOG_CATEGORY_VIDEO = 5;
pub const SDL_LOG_CATEGORY_RENDER = 6;
pub const SDL_LOG_CATEGORY_INPUT = 7;
pub const SDL_LOG_CATEGORY_TEST = 8;
pub const SDL_LOG_CATEGORY_GPU = 9;
pub const setLogPriorities = log.setLogPriorities;
pub const setLogPriority = log.setLogPriority;
pub const getLogPriority = log.getLogPriority;
pub const resetLogPriorities = log.resetLogPriorities;
pub const sdlLog = log.log;
pub const logVerbose = log.logVerbose;
pub const logDebug = log.logDebug;
pub const logInfo = log.logInfo;
pub const logWarn = log.logWarn;
pub const logError = log.logError;
pub const logCritical = log.logCritical;
pub const logMessage = log.logMessage;
pub const setLogOutputFunction = log.setLogOutputFunction;

// Re-export clipboard functions
pub const setClipboardText = clipboard.setClipboardText;
pub const getClipboardText = clipboard.getClipboardText;
pub const hasClipboardText = clipboard.hasClipboardText;
pub const setPrimarySelectionText = clipboard.setPrimarySelectionText;
pub const getPrimarySelectionText = clipboard.getPrimarySelectionText;
pub const hasPrimarySelectionText = clipboard.hasPrimarySelectionText;

// Re-export platform functions
pub const getPlatform = platform.getPlatform;

// Re-export power types and functions
pub const SDL_PowerState = power.SDL_PowerState;
pub const getPowerInfo = power.getPowerInfo;

// Re-export system functions
pub const getSystemRAM = system.getSystemRAM;
pub const getSIMDAlignment = system.getSIMDAlignment;

// Re-export all keycode types and constants
pub const SDL_Keycode = keycode.SDL_Keycode;
pub const SDL_Scancode = keycode.SDL_Scancode;
pub const SDL_Keymod = core.SDL_Keymod;

// Re-export scancode constants
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

// Re-export keycode constants
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

// Function keys
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

// Arrow keys
pub const SDLK_RIGHT = keycode.SDLK_RIGHT;
pub const SDLK_LEFT = keycode.SDLK_LEFT;
pub const SDLK_DOWN = keycode.SDLK_DOWN;
pub const SDLK_UP = keycode.SDLK_UP;

// Modifier constants
pub const KMOD_NONE = keycode.KMOD_NONE;
pub const KMOD_LSHIFT = keycode.KMOD_LSHIFT;
pub const KMOD_RSHIFT = keycode.KMOD_RSHIFT;
pub const KMOD_SHIFT = keycode.KMOD_SHIFT;
pub const KMOD_LCTRL = keycode.KMOD_LCTRL;
pub const KMOD_RCTRL = keycode.KMOD_RCTRL;
pub const KMOD_CTRL = keycode.KMOD_CTRL;
pub const KMOD_LALT = keycode.KMOD_LALT;
pub const KMOD_RALT = keycode.KMOD_RALT;
pub const KMOD_ALT = keycode.KMOD_ALT;
pub const KMOD_LGUI = keycode.KMOD_LGUI;
pub const KMOD_RGUI = keycode.KMOD_RGUI;
pub const KMOD_GUI = keycode.KMOD_GUI;
pub const KMOD_NUM = keycode.KMOD_NUM;
pub const KMOD_CAPS = keycode.KMOD_CAPS;
pub const KMOD_MODE = keycode.KMOD_MODE;
pub const KMOD_SCROLL = keycode.KMOD_SCROLL;

// Re-export mouse button constants
pub const SDL_BUTTON_LEFT = keycode.SDL_BUTTON_LEFT;
pub const SDL_BUTTON_MIDDLE = keycode.SDL_BUTTON_MIDDLE;
pub const SDL_BUTTON_RIGHT = keycode.SDL_BUTTON_RIGHT;
pub const SDL_BUTTON_X1 = keycode.SDL_BUTTON_X1;
pub const SDL_BUTTON_X2 = keycode.SDL_BUTTON_X2;
pub const SDL_BUTTON_LMASK = keycode.SDL_BUTTON_LMASK;
pub const SDL_BUTTON_MMASK = keycode.SDL_BUTTON_MMASK;
pub const SDL_BUTTON_RMASK = keycode.SDL_BUTTON_RMASK;
pub const SDL_BUTTON_X1MASK = keycode.SDL_BUTTON_X1MASK;
pub const SDL_BUTTON_X2MASK = keycode.SDL_BUTTON_X2MASK;

// Re-export keycode functions
pub const getKeyFromName = keycode.getKeyFromName;
pub const getKeyName = keycode.getKeyName;
pub const getScancodeFromName = keycode.getScancodeFromName;
pub const getScancodeName = keycode.getScancodeName;
pub const setScancodeName = keycode.setScancodeName;

// Re-export additional keycode functions (some are already exported from input module)
pub const isPrintable = keycode.isPrintable;
pub const isScancodeKeycode = keycode.isScancodeKeycode;
pub const keycodeToScancode = keycode.keycodeToScancode;

// Re-export locale types and functions
pub const SDL_Locale = locale.SDL_Locale;
pub const getPreferredLocales = locale.getPreferredLocales;

// Re-export messagebox types and functions
pub const SDL_MessageBoxFlags = messagebox.SDL_MessageBoxFlags;
pub const SDL_MessageBoxButton = messagebox.SDL_MessageBoxButton;
pub const SDL_MessageBoxColor = messagebox.SDL_MessageBoxColor;
pub const SDL_MessageBoxColorScheme = messagebox.SDL_MessageBoxColorScheme;
pub const SDL_MessageBoxData = messagebox.SDL_MessageBoxData;
pub const showMessageBox = messagebox.showMessageBox;
pub const showSimpleMessageBox = messagebox.showSimpleMessageBox;

// Re-export misc functions
pub const openURL = misc.openURL;
pub const getDefaultLogOutputFunction = misc.getDefaultLogOutputFunction;
pub const crc16 = misc.crc16;
pub const crc32 = misc.crc32;
pub const murmur3_32 = misc.murmur3_32;
pub const getNumAllocations = misc.getNumAllocations;
pub const getFullPath = misc.getFullPath;

// Re-export Vulkan functions and types
pub const vulkanLoadLibrary = vulkan.loadLibrary;
pub const vulkanGetVkGetInstanceProcAddr = vulkan.getVkGetInstanceProcAddr;
pub const vulkanUnloadLibrary = vulkan.unloadLibrary;
pub const vulkanGetInstanceExtensions = vulkan.getInstanceExtensions;
pub const vulkanCreateSurface = vulkan.createSurface;
pub const vulkanDestroySurface = vulkan.destroySurface;
pub const vulkanGetPresentationSupport = vulkan.getPresentationSupport;

// Note: Vulkan types are now handled through SDL3's GPU system

// Re-export Tray types and functions
pub const SDL_Tray = tray.SDL_Tray;
pub const SDL_TrayMenu = tray.SDL_TrayMenu;
pub const SDL_TrayEntry = tray.SDL_TrayEntry;
pub const createTray = tray.createTray;
pub const setTrayIcon = tray.setTrayIcon;
pub const setTrayTooltip = tray.setTrayTooltip;
pub const createTrayMenu = tray.createTrayMenu;
pub const destroyTray = tray.destroyTray;
pub const updateTrays = tray.updateTrays;

// Re-export HIDAPI types and functions
pub const SDL_hid_device = hidapi.SDL_hid_device;
pub const SDL_hid_device_info = hidapi.SDL_hid_device_info;
pub const hid_init = hidapi.hid_init;
pub const hid_exit = hidapi.hid_exit;
pub const hid_enumerate = hidapi.hid_enumerate;
pub const hid_free_enumeration = hidapi.hid_free_enumeration;
pub const hid_open = hidapi.hid_open;
pub const hid_open_path = hidapi.hid_open_path;
pub const hid_write = hidapi.hid_write;
pub const hid_read = hidapi.hid_read;
pub const hid_close = hidapi.hid_close;

// Re-export Storage types and functions
pub const SDL_Storage = storage.SDL_Storage;
pub const SDL_PathInfo = storage.SDL_PathInfo;
pub const openTitleStorage = storage.openTitleStorage;
pub const openUserStorage = storage.openUserStorage;
pub const openFileStorage = storage.openFileStorage;
pub const closeStorage = storage.closeStorage;
pub const storageReady = storage.storageReady;
pub const readStorageFile = storage.readStorageFile;
pub const writeStorageFile = storage.writeStorageFile;

// Re-export Assert types and functions
pub const SDL_AssertState = assert.SDL_AssertState;
pub const SDL_AssertData = assert.SDL_AssertData;
pub const setAssertionHandler = assert.setAssertionHandler;
pub const getAssertionHandler = assert.getAssertionHandler;
pub const getAssertionReport = assert.getAssertionReport;
pub const resetAssertionReport = assert.resetAssertionReport;

// Re-export SharedObject types and functions
pub const SDL_SharedObject = sharedobject.SDL_SharedObject;
pub const loadObject = sharedobject.loadObject;
pub const loadFunction = sharedobject.loadFunction;
pub const unloadObject = sharedobject.unloadObject;

// Re-export Haptic types and functions
pub const SDL_Haptic = haptic.SDL_Haptic;
pub const SDL_HapticEffect = haptic.SDL_HapticEffect;
pub const SDL_HapticDirection = haptic.SDL_HapticDirection;
pub const numHaptics = haptic.numHaptics;
pub const hapticOpen = haptic.hapticOpen;
pub const hapticClose = haptic.hapticClose;
pub const hapticRumbleSupported = haptic.hapticRumbleSupported;
pub const hapticRumblePlay = haptic.hapticRumblePlay;
pub const hapticRumbleStop = haptic.hapticRumbleStop;

// Re-export process types and functions
pub const SDL_Process = process.SDL_Process;
pub const SDL_ProcessIO = process.SDL_ProcessIO;
pub const runProcess = process.runProcess;
pub const getProcessInput = process.getProcessInput;
pub const getProcessOutput = process.getProcessOutput;
pub const getProcessError = process.getProcessError;
pub const waitProcess = process.waitProcess;
pub const killProcess = process.killProcess;
pub const destroyProcess = process.destroyProcess;

// Re-export metal types and functions
pub const SDL_MetalView = metal.SDL_MetalView;
pub const metalLoadLibrary = metal.loadLibrary;
pub const metalGetLibrary = metal.getLibrary;
pub const metalUnloadLibrary = metal.unloadLibrary;
pub const metalCreateView = metal.createView;
pub const metalDestroyView = metal.destroyView;
pub const metalGetLayer = metal.getLayer;
pub const metalGetDrawableSize = metal.getDrawableSize;

// Re-export sensor types and functions
pub const SDL_SensorType = sensor.SDL_SensorType;
pub const SDL_Sensor = sensor.SDL_Sensor;
pub const getSensors = sensor.getSensors;
pub const getSensorNameForID = sensor.getSensorNameForID;
pub const getSensorTypeForID = sensor.getSensorTypeForID;
pub const openSensor = sensor.openSensor;
pub const closeSensor = sensor.closeSensor;
pub const getSensorData = sensor.getSensorData;
pub const updateSensors = sensor.updateSensors;

// Re-export pen types and functions
pub const SDL_PenAxis = pen.SDL_PenAxis;
pub const SDL_Pen = pen.SDL_Pen;
pub const getPens = pen.getPens;
pub const getPenName = pen.getPenName;
pub const getPenCapabilities = pen.getPenCapabilities;
pub const getPenStatus = pen.getPenStatus;
pub const penConnected = pen.penConnected;
pub const getPenFromID = pen.getPenFromID;
pub const getPenID = pen.getPenID;
pub const penAxisSupported = pen.penAxisSupported;

// Re-export touch types and functions
pub const SDL_TouchID = touch.SDL_TouchID;
pub const SDL_FingerID = touch.SDL_FingerID;
pub const SDL_TouchDeviceType = touch.SDL_TouchDeviceType;
pub const SDL_Finger = touch.SDL_Finger;
pub const getTouchDevices = touch.getTouchDevices;
pub const getTouchDeviceName = touch.getTouchDeviceName;
pub const getTouchDeviceType = touch.getTouchDeviceType;
pub const getTouchFingers = touch.getTouchFingers;

// Re-export asyncio types and functions
pub const SDL_AsyncIO = asyncio.SDL_AsyncIO;
pub const SDL_AsyncIOQueue = asyncio.SDL_AsyncIOQueue;
pub const SDL_AsyncIOTaskType = asyncio.SDL_AsyncIOTaskType;
pub const SDL_AsyncIOResult = asyncio.SDL_AsyncIOResult;
pub const SDL_AsyncIOOutcome = asyncio.SDL_AsyncIOOutcome;
pub const asyncIOFromFile = asyncio.asyncIOFromFile;
pub const readAsyncIO = asyncio.readAsyncIO;
pub const writeAsyncIO = asyncio.writeAsyncIO;
pub const closeAsyncIO = asyncio.closeAsyncIO;
pub const createAsyncIOQueue = asyncio.createAsyncIOQueue;
pub const getAsyncIOResult = asyncio.getAsyncIOResult;
pub const waitAsyncIOResult = asyncio.waitAsyncIOResult;

// Re-export atomic types and functions
pub const SDL_SpinLock = atomic.SDL_SpinLock;
pub const tryLockSpinlock = atomic.tryLockSpinlock;
pub const lockSpinlock = atomic.lockSpinlock;
pub const unlockSpinlock = atomic.unlockSpinlock;
pub const atomicIncRef = atomic.atomicIncRef;
pub const atomicDecRef = atomic.atomicDecRef;
pub const memoryBarrierReleaseFunction = atomic.memoryBarrierReleaseFunction;
pub const memoryBarrierAcquireFunction = atomic.memoryBarrierAcquireFunction;

// Re-export bits functions
pub const mostSignificantBitIndex32 = bits.mostSignificantBitIndex32;
pub const hasExactlyOneBitSet32 = bits.hasExactlyOneBitSet32;

// Re-export cpuinfo functions
pub const getCPUCount = cpuinfo.getCPUCount;
pub const getCPUCacheLineSize = cpuinfo.getCPUCacheLineSize;
pub const hasAltiVec = cpuinfo.hasAltiVec;
pub const hasMMX = cpuinfo.hasMMX;
pub const hasSSE = cpuinfo.hasSSE;
pub const hasSSE2 = cpuinfo.hasSSE2;
pub const hasSSE3 = cpuinfo.hasSSE3;
pub const hasSSE41 = cpuinfo.hasSSE41;
pub const hasSSE42 = cpuinfo.hasSSE42;
pub const hasAVX = cpuinfo.hasAVX;
pub const hasAVX2 = cpuinfo.hasAVX2;
pub const hasAVX512F = cpuinfo.hasAVX512F;
pub const hasNEON = cpuinfo.hasNEON;
pub const hasLSX = cpuinfo.hasLSX;
pub const hasLASX = cpuinfo.hasLASX;

// Re-export dialog types and functions
pub const SDL_DialogFileCallback = dialog.SDL_DialogFileCallback;
pub const SDL_DialogFileFilter = dialog.SDL_DialogFileFilter;
pub const showOpenFileDialog = dialog.showOpenFileDialog;
pub const showSaveFileDialog = dialog.showSaveFileDialog;
pub const showOpenFolderDialog = dialog.showOpenFolderDialog;
pub const showFileDialogWithProperties = dialog.showFileDialogWithProperties;

// Re-export endian functions and constants
pub const SDL_BYTEORDER = endian.SDL_BYTEORDER;
pub const SDL_LIL_ENDIAN = endian.SDL_LIL_ENDIAN;
pub const SDL_BIG_ENDIAN = endian.SDL_BIG_ENDIAN;
pub const swap16 = endian.SDL_Swap16;
pub const swap32 = endian.SDL_Swap32;
pub const swap64 = endian.SDL_Swap64;
pub const swapFloat = endian.SDL_SwapFloat;
pub const swapLE16 = endian.SDL_SwapLE16;
pub const swapLE32 = endian.SDL_SwapLE32;
pub const swapLE64 = endian.SDL_SwapLE64;
pub const swapBE16 = endian.SDL_SwapBE16;
pub const swapBE32 = endian.SDL_SwapBE32;
pub const swapBE64 = endian.SDL_SwapBE64;
pub const swapFloatLE = endian.SDL_SwapFloatLE;
pub const swapFloatBE = endian.SDL_SwapFloatBE;

// Re-export guid types and functions
pub const SDL_GUID = guid.SDL_GUID;
pub const guidToString = guid.guidToString;
pub const stringToGUID = guid.stringToGUID;

// Re-export intrinsics functions
pub const hasARMSIMD = intrinsics.hasARMSIMD;
pub const hasARMSVE = intrinsics.hasARMSVE;

// Constants
pub const SDL_INIT_AUDIO = core.SDL_INIT_AUDIO;
pub const SDL_INIT_VIDEO = core.SDL_INIT_VIDEO;
pub const SDL_INIT_JOYSTICK = core.SDL_INIT_JOYSTICK;
pub const SDL_INIT_HAPTIC = core.SDL_INIT_HAPTIC;
pub const SDL_INIT_GAMEPAD = core.SDL_INIT_GAMEPAD;
pub const SDL_INIT_EVENTS = core.SDL_INIT_EVENTS;
pub const SDL_INIT_SENSOR = core.SDL_INIT_SENSOR;
pub const SDL_INIT_CAMERA = core.SDL_INIT_CAMERA;

pub const SDL_WINDOW_FULLSCREEN = video.SDL_WINDOW_FULLSCREEN;
pub const SDL_WINDOW_OPENGL = video.SDL_WINDOW_OPENGL;
pub const SDL_WINDOW_HIDDEN = video.SDL_WINDOW_HIDDEN;
pub const SDL_WINDOW_BORDERLESS = video.SDL_WINDOW_BORDERLESS;
pub const SDL_WINDOW_RESIZABLE = video.SDL_WINDOW_RESIZABLE;
pub const SDL_WINDOW_MINIMIZED = video.SDL_WINDOW_MINIMIZED;
pub const SDL_WINDOW_MAXIMIZED = video.SDL_WINDOW_MAXIMIZED;
pub const SDL_WINDOW_VULKAN = video.SDL_WINDOW_VULKAN;

pub const SDL_PIXELFORMAT_RGBA8888 = pixels.SDL_PIXELFORMAT_RGBA8888;
pub const SDL_PIXELFORMAT_ARGB8888 = pixels.SDL_PIXELFORMAT_ARGB8888;
pub const SDL_PIXELFORMAT_ABGR8888 = pixels.SDL_PIXELFORMAT_ABGR8888;
pub const SDL_PIXELFORMAT_BGRA8888 = pixels.SDL_PIXELFORMAT_BGRA8888;
pub const SDL_PIXELFORMAT_RGB565 = pixels.SDL_PIXELFORMAT_RGB565;

pub const SDL_BLENDMODE_NONE = pixels.SDL_BLENDMODE_NONE;
pub const SDL_BLENDMODE_BLEND = pixels.SDL_BLENDMODE_BLEND;

pub const SDL_EVENT_QUIT = core.SDL_EVENT_QUIT;
pub const SDL_EVENT_KEY_DOWN = core.SDL_EVENT_KEY_DOWN;
pub const SDL_EVENT_KEY_UP = core.SDL_EVENT_KEY_UP;
pub const SDL_EVENT_MOUSE_MOTION = core.SDL_EVENT_MOUSE_MOTION;
pub const SDL_EVENT_MOUSE_BUTTON_DOWN = core.SDL_EVENT_MOUSE_BUTTON_DOWN;
pub const SDL_EVENT_MOUSE_BUTTON_UP = core.SDL_EVENT_MOUSE_BUTTON_UP;
pub const SDL_EVENT_MOUSE_WHEEL = core.SDL_EVENT_MOUSE_WHEEL;

// Joystick events (not in core)
pub const SDL_EVENT_JOYSTICK_ADDED = events.SDL_EVENT_JOYSTICK_ADDED;
pub const SDL_EVENT_JOYSTICK_REMOVED = events.SDL_EVENT_JOYSTICK_REMOVED;
pub const SDL_EVENT_JOYSTICK_BATTERY_UPDATED = events.SDL_EVENT_JOYSTICK_BATTERY_UPDATED;
pub const SDL_EVENT_JOYSTICK_BUTTON_DOWN = events.SDL_EVENT_JOYSTICK_BUTTON_DOWN;
pub const SDL_EVENT_JOYSTICK_BUTTON_UP = events.SDL_EVENT_JOYSTICK_BUTTON_UP;
pub const SDL_EVENT_JOYSTICK_HAT_MOTION = events.SDL_EVENT_JOYSTICK_HAT_MOTION;
pub const SDL_EVENT_JOYSTICK_AXIS_MOTION = events.SDL_EVENT_JOYSTICK_AXIS_MOTION;

// Gamepad events (not in core)
pub const SDL_EVENT_GAMEPAD_ADDED = events.SDL_EVENT_GAMEPAD_ADDED;
pub const SDL_EVENT_GAMEPAD_REMOVED = events.SDL_EVENT_GAMEPAD_REMOVED;
pub const SDL_EVENT_GAMEPAD_BUTTON_DOWN = events.SDL_EVENT_GAMEPAD_BUTTON_DOWN;
pub const SDL_EVENT_GAMEPAD_BUTTON_UP = events.SDL_EVENT_GAMEPAD_BUTTON_UP;
pub const SDL_EVENT_GAMEPAD_AXIS_MOTION = events.SDL_EVENT_GAMEPAD_AXIS_MOTION;
pub const SDL_EVENT_GAMEPAD_REMAPPED = events.SDL_EVENT_GAMEPAD_REMAPPED;
pub const SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED = events.SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN = events.SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION = events.SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_UP = events.SDL_EVENT_GAMEPAD_TOUCHPAD_UP;
pub const SDL_EVENT_GAMEPAD_SENSOR_UPDATE = events.SDL_EVENT_GAMEPAD_SENSOR_UPDATE;
pub const SDL_EVENT_GAMEPAD_STEAM_HANDLE_CHANGED = events.SDL_EVENT_GAMEPAD_STEAM_HANDLE_CHANGED;

// Touch and gesture events (not in core)
pub const SDL_EVENT_FINGER_DOWN = events.SDL_EVENT_FINGER_DOWN;
pub const SDL_EVENT_FINGER_UP = events.SDL_EVENT_FINGER_UP;
pub const SDL_EVENT_FINGER_MOTION = events.SDL_EVENT_FINGER_MOTION;
pub const SDL_EVENT_GESTURE_SWIPE = events.SDL_EVENT_GESTURE_SWIPE;
pub const SDL_EVENT_GESTURE_MULTIGESTURE = events.SDL_EVENT_GESTURE_MULTIGESTURE;

// Other events (not in core)
pub const SDL_EVENT_CLIPBOARD_UPDATE = events.SDL_EVENT_CLIPBOARD_UPDATE;
pub const SDL_EVENT_DROP_FILE = events.SDL_EVENT_DROP_FILE;
pub const SDL_EVENT_DROP_TEXT = events.SDL_EVENT_DROP_TEXT;
pub const SDL_EVENT_DROP_BEGIN = events.SDL_EVENT_DROP_BEGIN;
pub const SDL_EVENT_DROP_COMPLETE = events.SDL_EVENT_DROP_COMPLETE;
pub const SDL_EVENT_DROP_POSITION = events.SDL_EVENT_DROP_POSITION;
pub const SDL_EVENT_AUDIO_DEVICE_ADDED = events.SDL_EVENT_AUDIO_DEVICE_ADDED;
pub const SDL_EVENT_AUDIO_DEVICE_REMOVED = events.SDL_EVENT_AUDIO_DEVICE_REMOVED;
pub const SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED = events.SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED;
pub const SDL_EVENT_SENSOR_UPDATE = events.SDL_EVENT_SENSOR_UPDATE;
pub const SDL_EVENT_DISPLAY_ORIENTATION = events.SDL_EVENT_DISPLAY_ORIENTATION;
pub const SDL_EVENT_DISPLAY_CONNECTED = events.SDL_EVENT_DISPLAY_CONNECTED;
pub const SDL_EVENT_DISPLAY_DISCONNECTED = events.SDL_EVENT_DISPLAY_DISCONNECTED;
pub const SDL_EVENT_POWER_STATE_CHANGED = events.SDL_EVENT_POWER_STATE_CHANGED;
pub const SDL_EVENT_PEN_DOWN = events.SDL_EVENT_PEN_DOWN;
pub const SDL_EVENT_PEN_UP = events.SDL_EVENT_PEN_UP;
pub const SDL_EVENT_PEN_MOTION = events.SDL_EVENT_PEN_MOTION;
pub const SDL_EVENT_PEN_BUTTON_DOWN = events.SDL_EVENT_PEN_BUTTON_DOWN;
pub const SDL_EVENT_PEN_BUTTON_UP = events.SDL_EVENT_PEN_BUTTON_UP;
pub const SDL_EVENT_PEN_ERASER_DOWN = events.SDL_EVENT_PEN_ERASER_DOWN;
pub const SDL_EVENT_PEN_ERASER_UP = events.SDL_EVENT_PEN_ERASER_UP;
pub const SDL_EVENT_PEN_AXIS = events.SDL_EVENT_PEN_AXIS;
pub const SDL_EVENT_CAMERA_DEVICE_ADDED = events.SDL_EVENT_CAMERA_DEVICE_ADDED;
pub const SDL_EVENT_CAMERA_DEVICE_REMOVED = events.SDL_EVENT_CAMERA_DEVICE_REMOVED;
pub const SDL_EVENT_CAMERA_DEVICE_APPROVED = events.SDL_EVENT_CAMERA_DEVICE_APPROVED;
pub const SDL_EVENT_CAMERA_DEVICE_DENIED = events.SDL_EVENT_CAMERA_DEVICE_DENIED;
pub const SDL_EVENT_USER = events.SDL_EVENT_USER;

// Key constants are now exported from keycode module above

// Re-export GPU types and functions
pub const SDL_GPUDevice = gpu.SDL_GPUDevice;
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
pub const SDL_GPUFence = gpu.SDL_GPUFence;
pub const SDL_GPUPrimitiveType = gpu.SDL_GPUPrimitiveType;
pub const SDL_GPULoadOp = gpu.SDL_GPULoadOp;
pub const SDL_GPUStoreOp = gpu.SDL_GPUStoreOp;
pub const SDL_GPUIndexElementSize = gpu.SDL_GPUIndexElementSize;
pub const SDL_GPU_SHADERFORMAT_INVALID = gpu.SDL_GPU_SHADERFORMAT_INVALID;
pub const SDL_GPU_SHADERFORMAT_PRIVATE = gpu.SDL_GPU_SHADERFORMAT_PRIVATE;
pub const SDL_GPU_SHADERFORMAT_SPIRV = gpu.SDL_GPU_SHADERFORMAT_SPIRV;
pub const SDL_GPU_SHADERFORMAT_DXBC = gpu.SDL_GPU_SHADERFORMAT_DXBC;
pub const SDL_GPU_SHADERFORMAT_DXIL = gpu.SDL_GPU_SHADERFORMAT_DXIL;
pub const SDL_GPU_SHADERFORMAT_MSL = gpu.SDL_GPU_SHADERFORMAT_MSL;
pub const SDL_GPU_SHADERFORMAT_METALLIB = gpu.SDL_GPU_SHADERFORMAT_METALLIB;
pub const SDL_GPU_BUFFERUSAGE_VERTEX = gpu.SDL_GPU_BUFFERUSAGE_VERTEX;
pub const SDL_GPU_BUFFERUSAGE_INDEX = gpu.SDL_GPU_BUFFERUSAGE_INDEX;
pub const SDL_GPUBufferCreateInfo = gpu.SDL_GPUBufferCreateInfo;
pub const SDL_GPUBufferUsageFlags = gpu.SDL_GPUBufferUsageFlags;
pub const SDL_GPUTextureCreateInfo = gpu.SDL_GPUTextureCreateInfo;
pub const SDL_GPUTextureType = gpu.SDL_GPUTextureType;
pub const SDL_GPUTextureFormat = gpu.SDL_GPUTextureFormat;
pub const SDL_GPUTextureUsageFlags = gpu.SDL_GPUTextureUsageFlags;
pub const SDL_GPUSampleCount = gpu.SDL_GPUSampleCount;
pub const SDL_GPUSamplerCreateInfo = gpu.SDL_GPUSamplerCreateInfo;
pub const SDL_GPUShaderCreateInfo = gpu.SDL_GPUShaderCreateInfo;
pub const SDL_GPUShaderStage = gpu.SDL_GPUShaderStage;
pub const SDL_GPUTransferBufferCreateInfo = gpu.SDL_GPUTransferBufferCreateInfo;
pub const SDL_GPUTransferBufferUsage = gpu.SDL_GPUTransferBufferUsage;
pub const SDL_GPUTextureTransferInfo = gpu.SDL_GPUTextureTransferInfo;
pub const SDL_GPUTransferBufferLocation = gpu.SDL_GPUTransferBufferLocation;
pub const SDL_GPUTextureRegion = gpu.SDL_GPUTextureRegion;
pub const SDL_GPUBufferRegion = gpu.SDL_GPUBufferRegion;
pub const SDL_GPUColorTargetInfo = gpu.SDL_GPUColorTargetInfo;
pub const SDL_GPUDepthStencilTargetInfo = gpu.SDL_GPUDepthStencilTargetInfo;
pub const SDL_GPUViewport = gpu.SDL_GPUViewport;
pub const SDL_GPUBufferBinding = gpu.SDL_GPUBufferBinding;
pub const SDL_GPUGraphicsPipelineCreateInfo = gpu.SDL_GPUGraphicsPipelineCreateInfo;
pub const SDL_GPUComputePipelineCreateInfo = gpu.SDL_GPUComputePipelineCreateInfo;
pub const SDL_GPUBlitInfo = gpu.SDL_GPUBlitInfo;
pub const SDL_GPUStorageTextureReadWriteBinding = gpu.SDL_GPUStorageTextureReadWriteBinding;
pub const SDL_GPUStorageBufferReadWriteBinding = gpu.SDL_GPUStorageBufferReadWriteBinding;
pub const createGPUDevice = gpu.createGPUDevice;
pub const createGPUVertexBuffer = gpu.createGPUVertexBuffer;
pub const createGPUIndexBuffer = gpu.createGPUIndexBuffer;
pub const destroyGPUDevice = gpu.destroyGPUDevice;
pub const claimWindowForGPUDevice = gpu.claimWindowForGPUDevice;
pub const releaseWindowFromGPUDevice = gpu.releaseWindowFromGPUDevice;
pub const acquireGPUCommandBuffer = gpu.acquireGPUCommandBuffer;
pub const submitGPUCommandBuffer = gpu.submitGPUCommandBuffer;
pub const submitGPUCommandBufferAndAcquireFence = gpu.submitGPUCommandBufferAndAcquireFence;
pub const waitForGPUFences = gpu.waitForGPUFences;
pub const releaseGPUFence = gpu.releaseGPUFence;
pub const createGPUBuffer = gpu.createGPUBuffer;
pub const setGPUBufferName = gpu.setGPUBufferName;
pub const getGPUBufferSizeInBytes = gpu.getGPUBufferSizeInBytes;
pub const releaseGPUBuffer = gpu.releaseGPUBuffer;
pub const createGPUTexture = gpu.createGPUTexture;
pub const setGPUTextureName = gpu.setGPUTextureName;
pub const getGPUTextureSize = gpu.getGPUTextureSize;
pub const releaseGPUTexture = gpu.releaseGPUTexture;
pub const createGPUSampler = gpu.createGPUSampler;
pub const releaseGPUSampler = gpu.releaseGPUSampler;
pub const createGPUShader = gpu.createGPUShader;
pub const releaseGPUShader = gpu.releaseGPUShader;
pub const createGPUTransferBuffer = gpu.createGPUTransferBuffer;
pub const mapGPUTransferBuffer = gpu.mapGPUTransferBuffer;
pub const unmapGPUTransferBuffer = gpu.unmapGPUTransferBuffer;
pub const releaseGPUTransferBuffer = gpu.releaseGPUTransferBuffer;
pub const beginGPUCopyPass = gpu.beginGPUCopyPass;
pub const uploadToGPUTexture = gpu.uploadToGPUTexture;
pub const uploadToGPUBuffer = gpu.uploadToGPUBuffer;
pub const endGPUCopyPass = gpu.endGPUCopyPass;
pub const beginGPURenderPass = gpu.beginGPURenderPass;
pub const bindGPUGraphicsPipeline = gpu.bindGPUGraphicsPipeline;
pub const setGPUViewport = gpu.setGPUViewport;
pub const setGPUScissor = gpu.setGPUScissor;
pub const bindGPUVertexBuffers = gpu.bindGPUVertexBuffers;
pub const bindGPUIndexBuffer = gpu.bindGPUIndexBuffer;
pub const drawGPUIndexedPrimitives = gpu.drawGPUIndexedPrimitives;
pub const endGPURenderPass = gpu.endGPURenderPass;
pub const createGPUGraphicsPipeline = gpu.createGPUGraphicsPipeline;
pub const createGPUComputePipeline = gpu.createGPUComputePipeline;
pub const releaseGPUGraphicsPipeline = gpu.releaseGPUGraphicsPipeline;
pub const releaseGPUComputePipeline = gpu.releaseGPUComputePipeline;
pub const beginGPUComputePass = gpu.beginGPUComputePass;
pub const bindGPUComputePipeline = gpu.bindGPUComputePipeline;
pub const bindGPUComputeStorageTextures = gpu.bindGPUComputeStorageTextures;
pub const bindGPUComputeStorageBuffers = gpu.bindGPUComputeStorageBuffers;
pub const pushGPUComputeUniformData = gpu.pushGPUComputeUniformData;
pub const dispatchGPUCompute = gpu.dispatchGPUCompute;
pub const dispatchGPUComputeIndirect = gpu.dispatchGPUComputeIndirect;
pub const endGPUComputePass = gpu.endGPUComputePass;
pub const bindGPUVertexSamplers = gpu.bindGPUVertexSamplers;
pub const bindGPUFragmentSamplers = gpu.bindGPUFragmentSamplers;
pub const pushGPUVertexUniformData = gpu.pushGPUVertexUniformData;
pub const pushGPUFragmentUniformData = gpu.pushGPUFragmentUniformData;
pub const blitGPUTexture = gpu.blitGPUTexture;
pub const generateMipmapsForGPUTexture = gpu.generateMipmapsForGPUTexture;
pub const insertGPUDebugLabel = gpu.insertGPUDebugLabel;
pub const pushGPUDebugGroup = gpu.pushGPUDebugGroup;
pub const popGPUDebugGroup = gpu.popGPUDebugGroup;
pub const setGPUAllowedFramesInFlight = gpu.setGPUAllowedFramesInFlight;
pub const gpuSupportsShaderFormats = gpu.gpuSupportsShaderFormats;
pub const gpuSupportsProperties = gpu.gpuSupportsProperties;
pub const gpuTextureSupportsFormat = gpu.gpuTextureSupportsFormat;
pub const gpuBufferSize = gpu.gpuBufferSize;
pub const gpuTextureFormatTexelBlockSize = gpu.gpuTextureFormatTexelBlockSize;
pub const gpuTextureSupportsSampleCount = gpu.gpuTextureSupportsSampleCount;

// GPU driver functions
pub const getNumGPUDrivers = gpu.getNumGPUDrivers;
pub const getGPUDriver = gpu.getGPUDriver;
pub const getGPUDeviceDriver = gpu.getGPUDeviceDriver;

// GPU device properties
pub const SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING = gpu.SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING;
pub const SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING = gpu.SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING;
pub const SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING = gpu.SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING;
