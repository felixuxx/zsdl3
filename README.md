# ZSDL3 - Zig Bindings for SDL3

[![Zig](https://img.shields.io/badge/Zig-0.15.2+-blue.svg)](https://ziglang.org)
[![SDL3](https://img.shields.io/badge/SDL-3.2.0+-green.svg)](https://www.libsdl.org/)

Pure Zig bindings for SDL3 without `@cImport`. Provides comprehensive,
low-level access to SDL3's multimedia capabilities for game and application
development. Designed for performance and ease of use in modern Zig projects.

## Features

### Core Subsystems

- **Initialization**: SDL setup, subsystem management, app metadata
- **Error Handling**: Cross-platform error reporting
- **Events**: Complete event system with polling, filtering, and watching
- **Time**: High-precision timing, timers, and delays
- **Threads**: Multithreading with mutexes, conditions, and semaphores
- **Filesystem**: File I/O, async operations, path management
- **Hints**: Runtime configuration system

### Multimedia

- **Video**: Window creation, display management, fullscreen support
- **Render**: 2D accelerated rendering with textures and geometry
- **GPU**: 3D graphics with Vulkan, Metal, and D3D12 interop
- **Audio**: Device enumeration, playback, recording, and mixing
- **Input**: Keyboard, mouse, joystick, gamepad, touch, and sensor support

### Advanced Utilities

- **Atomic**: Lock-free operations and memory barriers
- **Bits**: Bit manipulation utilities
- **CPU Info**: Processor feature detection
- **Dialog**: Native file and message dialogs
- **Endian**: Byte order conversion
- **GUID**: Unique identifier generation
- **Intrinsics**: SIMD capability detection
- **Clipboard**: System clipboard access
- **Locale**: Internationalization support
- **Messagebox**: System message boxes
- **Platform**: Platform-specific utilities
- **Power**: Battery and power management
- **Process**: External process spawning
- **Rect**: Rectangle math utilities
- **Shared Object**: Dynamic library loading
- **Stdinc**: Standard library helpers (strings, memory, math)
- **Storage**: User data persistence
- **System**: System information queries
- **Tray**: System tray icons
- **Assert**: Custom assertion handling
- **Haptic**: Force feedback controllers
- **HIDAPI**: Raw HID device access
- **Vulkan**: Vulkan graphics integration
- **Metal**: Metal graphics integration

## Installation

### Prerequisites

- **Zig 0.15.2+**: [Download here](https://ziglang.org/download/)
- **SDL3**: Install from your package manager or build from source

#### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install libsdl3-dev
```

#### Linux (Arch)

```bash
sudo pacman -S sdl3
```

#### Linux (Fedora)

```bash
sudo dnf install SDL3-devel
```

#### macOS (Homebrew)

```bash
brew install sdl3
```

#### Windows

Download SDL3 development libraries from
[SDL releases](https://github.com/libsdl-org/SDL/releases) and place in your PATH.

## Using as Library

```bash
zig fetch --save git+https://github.com/felixuxx/zsdl3.git
```

### Inside `build.zig`

```zig
const std = @import("std");

pub fn build(b: *std.Build) void {

    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{});

    const mod = b.addModule("your-project-name", .{

        .root_source_file = b.path("src/root.zig"),

        .target = target,

        // Add these
        .link_libc = true,
        .imports = &.{
            .{ .name = "zsdl3", .module = b.dependency("zsdl3", .{}).module("zsdl3") },
        },
        //

    });
    
    // Add this
    mod.linkSystemLibrary("SDL3", .{});
    //

    const exe = b.addExecutable(.{
        .name = "your-project-name",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "your-project-name", .module = mod },

                // Add this
                .{ .name = "zsdl3", .module = b.dependency("zsdl3", .{}).module("zsdl3") },
                //

            },
        }),
    });
    
    b.installArtifact(exe);
// Rest of the build.zig code

```

### Building ZSDL3

```bash
git clone https://github.com/felixuxx/zsdl3.git
cd zsdl3
zig build
```

## Usage

### Basic 2D Rendering

```zig
const std = @import("std");

const zsdl3 = @import("zsdl3");

pub fn main() void {
    // Initialize SDL with video subsystem
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.debug.print("Failed to initialize SDL: {s}\n", .{err});
        return;
    }
    defer zsdl3.quit();

    // Create a window
    const window = zsdl3.createWindow("Basic 2D Example", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
    if (window == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.debug.print("Failed to create window: {s}\n", .{err});
        return;
    }
    defer zsdl3.destroyWindow(window);

    // Create a renderer
    const renderer = zsdl3.createRenderer(window, null);
    if (renderer == null) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.debug.print("Failed to create renderer: {s}\n", .{err});
        return;
    }
    defer zsdl3.destroyRenderer(renderer);

    // Main loop
    var running = true;
    while (running) {
        // Handle events
        var event: zsdl3.SDL_Event = undefined;
        while (zsdl3.pollEvent(&event)) {
            switch (event.type) {
                zsdl3.SDL_EVENT_QUIT => running = false,
                zsdl3.SDL_EVENT_KEY_DOWN => {
                    if (event.key.scancode == zsdl3.SDL_SCANCODE_ESCAPE) {
                        running = false;
                    }
                },
                else => {},
            }
        }

        // Clear screen with a color (dark blue)
        _ = zsdl3.setRenderDrawColor(renderer, 30, 60, 90, 255);
        _ = zsdl3.renderClear(renderer);

        // Draw a simple rectangle (yellow)
        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 0, 255);
        const rect = zsdl3.SDL_FRect{
            .x = 300,
            .y = 200,
            .w = 200,
            .h = 200,
        };
        _ = zsdl3.renderFillRect(renderer, &rect);

        // Present the rendered frame
        zsdl3.renderPresent(renderer);

        // Small delay to prevent 100% CPU usage
        zsdl3.delay(16); // ~60 FPS
    }
}

```

## API Reference

All SDL3 functions are available with Zig-friendly naming conventions:

- `SDL_Init` → `init`
- `SDL_CreateWindow` → `createWindow`
- `SDL_RenderClear` → `renderClear`

### Subsystem Organization

- **Core**: `init`, `quit`, `getError`, `getVersion`
- **Video**: `createWindow`, `destroyWindow`, `getWindowSize`
- **Events**: `pollEvent`, `pushEvent`, `filterEvents`
- **Input**: `getKeyboardState`, `getMouseState`, `openJoystick`
- **Render**: `createRenderer`, `renderClear`, `renderPresent`
- **GPU**: `createGPUDevice`, `acquireGPUCommandBuffer`
- **Audio**: `openAudioDevice`, `pauseAudioDevice`
- **Time**: `getTicks`, `delay`, `addTimer`
- **Threads**: `createThread`, `createMutex`, `lockMutex`
- **Filesystem**: `ioFromFile`, `loadFile`, `saveFile`
- **And 25+ more subsystems**

For complete API details, see the [SDL3 Wiki](https://wiki.libsdl.org/SDL3/APIByCategory).

## Building and Running

### Basic Build

```bash
zig build
```

### Run Examples

```bash
# Main 2D example
zig build run

# GPU example
zig build run -- gpu_example

# Audio example
zig build run -- audio_example

# 3D example (GPU + fallback 2D)
zig build run -- 3d_example
```

### Release Build

```bash
zig build -Doptimize=ReleaseFast
```

### Testing

```bash
zig build test
```

## Project Structure

```bash
src/
├── core.zig          # Core SDL functionality
├── pixels.zig        # Pixel formats and geometry
├── video.zig         # Window and display management
├── surface.zig       # Software surfaces
├── events.zig        # Event system
├── input.zig         # Input devices
├── render.zig        # 2D rendering
├── gpu.zig           # 3D GPU operations
├── audio.zig         # Audio system
├── time.zig          # Timing utilities
├── threads.zig       # Multithreading
├── filesystem.zig    # File I/O
├── hints.zig         # Configuration
├── properties.zig    # Key-value storage
├── log.zig           # Logging system
├── clipboard.zig     # Clipboard access
├── platform.zig      # Platform utilities
├── power.zig         # Power management
├── system.zig        # System information
├── keycode.zig       # Key mappings
├── locale.zig        # Internationalization
├── messagebox.zig    # Message dialogs
├── misc.zig          # Miscellaneous utilities
├── stdinc.zig        # Standard library helpers
├── vulkan.zig        # Vulkan interop
├── tray.zig          # System tray
├── hidapi.zig        # HID devices
├── storage.zig       # User storage
├── assert.zig        # Assertions
├── sharedobject.zig  # Dynamic libraries
├── haptic.zig        # Force feedback
├── sensor.zig        # Motion sensors
├── pen.zig           # Stylus input
├── touch.zig         # Touch input
├── asyncio.zig       # Async I/O
├── atomic.zig        # Atomic operations
├── bits.zig          # Bit utilities
├── cpuinfo.zig       # CPU detection
├── dialog.zig        # File dialogs
├── endian.zig        # Byte order
├── guid.zig          # GUIDs
├── intrinsics.zig    # SIMD detection
├── metal.zig         # Metal interop
├── process.zig       # Process management
└── root.zig          # Main module exports
└── main.zig          # Basic 2D example
examples/
├── gpu_example.zig   # GPU device testing
├── audio_example.zig # Audio enumeration example
├── basic_2d.zig      # Basic 2D rendering
└── 3d_example.zig    # 3D GPU rendering with fallback
```

## Contributing

Contributions welcome! Please:

1. Follow Zig coding standards
2. Add tests for new functionality
3. Update documentation
4. Ensure cross-platform compatibility

## License

Same as SDL3: zlib license. See [LICENSE](LICENSE) for details.

## Acknowledgments

- [SDL3](https://www.libsdl.org/) - The amazing multimedia library
- [Zig](https://ziglang.org/) - The systems programming language
- SDL community for comprehensive documentation
