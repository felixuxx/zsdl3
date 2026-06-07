# ZSDL3 — Runtime-loaded Zig bindings for SDL3

[![Zig](https://img.shields.io/badge/Zig-0.16.0+-orange.svg)](https://ziglang.org)
[![SDL3](https://img.shields.io/badge/SDL-3.4.4+-blue.svg)](https://www.libsdl.org/)

Thin, zero-overhead, **runtime-loaded** bindings for SDL3, SDL3_image, and SDL3_ttf — no `@cImport`, no compile-time dependency on SDL development libraries.

> **Need Zig 0.15.2?** Use the [`zig-0.15.2`](https://github.com/felixuxx/zsdl3/tree/zig-0.15.2) branch.

---

## Install

The only requirement is the SDL3 shared library on your system at runtime.

```bash
# macOS
brew install sdl3 sdl3_ttf sdl3_image
# Linux — SDL3 .so must be findable via LD_LIBRARY_PATH or ldconfig
# Windows — SDL3.dll must be in PATH or next to the executable
```

Build SDL3 from source if your package manager doesn't have it yet.

## Depend on it

```bash
zig fetch --save git+https://github.com/felixuxx/zsdl3#cleanup
```

Then in `build.zig`:

```zig
const zsdl3 = b.dependency("zsdl3", .{});
exe.root_module.addImport("zsdl3", zsdl3.module("zsdl3"));
```

No `linkSystemLibrary` needed — all symbols are resolved at runtime via `dlopen`/`LoadLibrary`.

## Build

```bash
git clone https://github.com/felixuxx/zsdl3.git
cd zsdl3
zig build          # builds main binary + all examples
zig build run      # run the app
```

### Run examples

| Step | Example |
|---|---|
| `zig build run-basic-2d` | window + yellow rect |
| `zig build run-cube-3d` | rotating 3D cube |
| `zig build run-renderer` | renderer smoke test |
| `zig build run-gpu` | GPU device + shader formats |
| `zig build run-image` | load PNG via SDL3_image |
| `zig build run-ttf` | render TTF text |
| `zig build run-text-editor` | text editor with file dialogs |
| `zig build run-audio` | sine wave playback |
| `zig build run-dialog` | native file dialogs |
| `zig build run-process` | process creation/management |
| `zig build run-clipboard` | clipboard read/write |

## Usage

```zig
const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    var sdl = try zsdl3.SDL.load();
    defer sdl.unload();

    if (!sdl.core.init(zsdl3.SDL_INIT_VIDEO)) return error.SDLInitFailed;
    defer sdl.core.quit();

    const window = sdl.video.createWindow("Demo", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE) orelse return error.WindowCreateFailed;
    defer sdl.video.destroyWindow(window);

    const renderer = sdl.render.createRenderer(window, null) orelse return error.RendererCreateFailed;
    defer sdl.render.destroyRenderer(renderer);

    while (true) {
        var event: zsdl3.SDL_Event = undefined;
        while (sdl.events.pollEvent(&event)) if (event.type == zsdl3.SDL_EVENT_QUIT) return;
        _ = sdl.render.setRenderDrawColor(renderer, 30, 60, 90, 255);
        _ = sdl.render.renderClear(renderer);
        sdl.render.renderPresent(renderer);
        sdl.time.delay(16);
    }
}
```

All functions use short Zig-friendly names (`init`, `createWindow`, `pollEvent`), dispatched by subsystem (`sdl.video.*`, `sdl.audio.*`, `sdl.gpu.*`, …). Full API at [SDL3 Wiki](https://wiki.libsdl.org/SDL3/APIByCategory).

### Sub-libraries

SDL3_image and SDL3_ttf are loaded on demand:

```zig
var img = try zsdl3.Image.load();
defer img.unload();
_ = img.functions.load("icon.png");
```

```zig
var ttf = try zsdl3.TTF.load();
defer ttf.unload();
const font = ttf.functions.openFont("sans.ttf", 24) orelse return;
```

## Structure

```
src/        — 50 subsystem files (core, video, render, gpu, audio, image, ttf, …)
examples/   — 11 runnable examples
```

Each subsystem exposes PFN type aliases and a dispatch struct. The loader in `src/dynamic.zig` maps Zig field names to `SDL_CamelCase` symbols via `dlsym`.

## Coverage

| Library | Bound | Unbound | Coverage |
|---|---|---|---|
| **SDL3 core** (3.4.4) | 1,149 | 121 | **~90%** |
| **SDL3_image** | 102 | 0 | **100%** |
| **SDL3_ttf** | 117 | 0 | **100%** |

Remaining SDL3 symbols are mostly niche APIs (platform-specific, async I/O, HID, tray).

---

**License:** zlib (same as SDL3) — see [LICENSE](LICENSE).
