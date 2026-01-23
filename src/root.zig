// SDL3 Zig Bindings - Root Module
// Pure Zig bindings for SDL3 without @cImport

// Import all subsystems
pub const core = @import("core.zig");
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

// Re-export events types and functions
pub const SDL_Event = events.SDL_Event;
pub const pumpEvents = events.pumpEvents;
pub const pollEvent = events.pollEvent;
pub const waitEvent = events.waitEvent;
pub const waitEventTimeout = events.waitEventTimeout;
pub const pushEvent = events.pushEvent;

// Re-export input functions
pub const hasKeyboard = input.hasKeyboard;
pub const getKeyboardState = input.getKeyboardState;
pub const getModState = input.getModState;
pub const setModState = input.setModState;
pub const hasMouse = input.hasMouse;
pub const getMouseState = input.getMouseState;
pub const warpMouseInWindow = input.warpMouseInWindow;
pub const numJoysticks = input.numJoysticks;
pub const joystickOpen = input.joystickOpen;
pub const joystickClose = input.joystickClose;
pub const numGamepads = input.numGamepads;
pub const isGamepad = input.isGamepad;
pub const openGamepad = input.openGamepad;
pub const closeGamepad = input.closeGamepad;

// Re-export render functions
pub const createRenderer = render.createRenderer;
pub const destroyRenderer = render.destroyRenderer;
pub const renderClear = render.renderClear;
pub const renderPresent = render.renderPresent;
pub const setRenderDrawColor = render.setRenderDrawColor;
pub const renderDrawLine = render.renderDrawLine;
pub const renderFillRect = render.renderFillRect;

// Re-export audio functions
pub const openAudioDevice = audio.openAudioDevice;
pub const closeAudioDevice = audio.closeAudioDevice;
pub const pauseAudioDevice = audio.pauseAudioDevice;

// Re-export time functions
pub const getTicks = time.getTicks;
pub const getTicksNS = time.getTicksNS;
pub const delay = time.delay;

// Re-export thread functions
pub const createThread = threads.createThread;
pub const waitThread = threads.waitThread;
pub const createMutex = threads.createMutex;
pub const destroyMutex = threads.destroyMutex;
pub const lockMutex = threads.lockMutex;
pub const unlockMutex = threads.unlockMutex;

// Re-export filesystem functions
pub const getBasePath = filesystem.getBasePath;
pub const ioFromFile = filesystem.ioFromFile;
pub const closeIO = filesystem.closeIO;
pub const readIO = filesystem.readIO;
pub const writeIO = filesystem.writeIO;

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
pub const createGPUDevice = gpu.createGPUDevice;
pub const destroyGPUDevice = gpu.destroyGPUDevice;
pub const claimWindowForGPUDevice = gpu.claimWindowForGPUDevice;
pub const releaseWindowFromGPUDevice = gpu.releaseWindowFromGPUDevice;
pub const acquireGPUCommandBuffer = gpu.acquireGPUCommandBuffer;
pub const submitGPUCommandBuffer = gpu.submitGPUCommandBuffer;
pub const submitGPUCommandBufferAndAcquireFence = gpu.submitGPUCommandBufferAndAcquireFence;
pub const waitForGPUFences = gpu.waitForGPUFences;
pub const releaseGPUFence = gpu.releaseGPUFence;
