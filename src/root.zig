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
pub const filterEvents = events.filterEvents;
pub const addEventWatch = events.addEventWatch;
pub const delEventWatch = events.delEventWatch;

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
pub const renderLine = render.renderLine;
pub const renderFillRect = render.renderFillRect;
pub const createTexture = render.createTexture;
pub const destroyTexture = render.destroyTexture;
pub const updateTexture = render.updateTexture;
pub const renderTexture = render.renderTexture;
pub const renderGeometry = render.renderGeometry;

// Re-export audio types and functions
pub const SDL_AudioSpec = audio.SDL_AudioSpec;
pub const openAudioDevice = audio.openAudioDevice;
pub const closeAudioDevice = audio.closeAudioDevice;
pub const pauseAudioDevice = audio.pauseAudioDevice;
pub const getAudioDeviceName = audio.getAudioDeviceName;
pub const getNumAudioDrivers = audio.getNumAudioDrivers;
pub const getAudioDriver = audio.getAudioDriver;
pub const getCurrentAudioDriver = audio.getCurrentAudioDriver;

// Re-export time functions
pub const SDL_TimerID = time.SDL_TimerID;
pub const SDL_TimerCallback = time.SDL_TimerCallback;
pub const getTicks = time.getTicks;
pub const getTicksNS = time.getTicksNS;
pub const delay = time.delay;
pub const addTimer = time.addTimer;
pub const removeTimer = time.removeTimer;

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

// Re-export hints types and functions
pub const SDL_HintPriority = hints.SDL_HintPriority;
pub const setHint = hints.setHint;
pub const getHint = hints.getHint;
pub const setHintWithPriority = hints.setHintWithPriority;
pub const resetHint = hints.resetHint;
pub const addHintCallback = hints.addHintCallback;
pub const delHintCallback = hints.delHintCallback;

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

// Re-export keycode functions
pub const getKeyFromName = keycode.getKeyFromName;
pub const getKeyName = keycode.getKeyName;
pub const getScancodeFromName = keycode.getScancodeFromName;
pub const getScancodeName = keycode.getScancodeName;
pub const setScancodeName = keycode.setScancodeName;

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

// Re-export Vulkan functions
pub const vulkanLoadLibrary = vulkan.loadLibrary;
pub const vulkanGetVkGetInstanceProcAddr = vulkan.getVkGetInstanceProcAddr;
pub const vulkanUnloadLibrary = vulkan.unloadLibrary;
pub const vulkanGetInstanceExtensions = vulkan.getInstanceExtensions;
pub const vulkanCreateSurface = vulkan.createSurface;
pub const vulkanDestroySurface = vulkan.destroySurface;
pub const vulkanGetPresentationSupport = vulkan.getPresentationSupport;

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

// Key constants
pub const SDLK_ESCAPE = 27;
pub const SDLK_LEFT = 1073741904;
pub const SDLK_RIGHT = 1073741903;
pub const SDLK_UP = 1073741906;
pub const SDLK_DOWN = 1073741905;

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
