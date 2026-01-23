# ZSDL3 - Zig Bindings for SDL3

Pure Zig bindings for SDL3 without @cImport. Provides low-level access to SDL3's multimedia capabilities for game and application development.

## Features

- **Core SDL**: Initialization, error handling, app metadata
- **Video**: Window management, display handling
- **Events**: Event polling and handling
- **Input**: Keyboard, mouse, joystick, gamepad support
- **Render**: 2D accelerated rendering
- **Audio**: Playback and recording
- **Time**: Timers and delays
- **Threads**: Multithreading support
- **Filesystem**: File I/O abstractions

## Installation

Clone the repository and build with Zig:

```bash
git clone https://github.com/your-repo/zsdl3.git
cd zsdl3
zig build
```

Requires SDL3 installed on your system.

## Usage

```zig
const zsdl3 = @import("zsdl3");

// Initialize SDL
if (zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
    defer zsdl3.quit();

    // Create window
    const window = zsdl3.createWindow("My App", 800, 600, 0);
    if (window) |win| {
        defer zsdl3.destroyWindow(win);

        // Create renderer
        const renderer = zsdl3.createRenderer(win, null, 0);
        if (renderer) |rend| {
            defer zsdl3.destroyRenderer(rend);

            // Game loop
            var running = true;
            while (running) {
                var event: zsdl3.SDL_Event = undefined;
                while (zsdl3.pollEvent(&event)) {
                    if (event.type == zsdl3.SDL_EVENT_QUIT) running = false;
                }

                // Render
                _ = zsdl3.renderClear(rend);
                // ... draw ...
                zsdl3.renderPresent(rend);
            }
        }
    }
}
```

## API Reference

All SDL3 functions are available with Zig-friendly names (e.g., `SDL_Init` becomes `init`).

See SDL3 documentation at https://wiki.libsdl.org/SDL3/APIByCategory for detailed function descriptions.

## Building

- `zig build`: Build the library
- `zig build run`: Run the example
- `zig build test`: Run tests

## License

Same as SDL3: zlib license.