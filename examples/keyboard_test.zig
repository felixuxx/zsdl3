// Keyboard Test Example
// Demonstrates improved keycode and scancode functionality

const std = @import("std");
const zsdl3 = @import("zsdl3");

pub fn main() !void {
    // Initialize SDL with video subsystem
    if (zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        defer zsdl3.quit();

        // Create window
        const window = zsdl3.createWindow("Keyboard Test - ZSDL3", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
        if (window) |win| {
            defer zsdl3.destroyWindow(win);

            // Create renderer
            const renderer = zsdl3.createRenderer(win, null, 0);
            if (renderer) |rend| {
                defer zsdl3.destroyRenderer(rend);

                var running = true;
                var current_mod: u16 = 0;
                var key_info: [256]u8 = "Press any key to see details...".*;

                while (running) {
                    // Handle events
                    var event: zsdl3.SDL_Event = undefined;
                    while (zsdl3.pollEvent(&event)) {
                        switch (event.type) {
                            zsdl3.SDL_EVENT_QUIT => {
                                running = false;
                            },
                            zsdl3.SDL_EVENT_KEY_DOWN => {
                                const key_event = event.key;

                                // Get scancode and keycode details
                                const scancode = key_event.scancode;
                                const keycode = key_event.key;
                                current_mod = key_event.mod;

                                // Format key information
                                const scancode_name = zsdl3.getScancodeName(scancode) orelse "UNKNOWN";
                                const keycode_name = zsdl3.getKeyName(keycode) orelse "UNKNOWN";

                                _ = std.fmt.bufPrint(&key_info, "Key: {s} (scancode: {s}, code: 0x{X:0>8}, mod: 0x{X:0>4})", .{ keycode_name, scancode_name, keycode, current_mod }) catch |err| {
                                    std.log.err("Failed to format key info: {}", .{err});
                                };

                                // Test utility functions
                                if (zsdl3.isPrintable(keycode)) {
                                    std.debug.print("Printable character: '{c}'\n", .{@intCast(keycode)});
                                }

                                if (zsdl3.isScancodeKeycode(keycode)) {
                                    if (zsdl3.keycodeToScancode(keycode)) |sc| {
                                        std.debug.print("Scancode from keycode: {}\n", .{sc});
                                    }
                                }
                            },
                            zsdl3.SDL_EVENT_KEY_UP => {
                                const key_event = event.key;
                                current_mod = key_event.mod;
                                std.debug.print("Key released\n");
                            },
                            else => {},
                        }
                    }

                    // Clear screen
                    _ = zsdl3.setRenderDrawColor(rend, 50, 50, 50, 255);
                    _ = zsdl3.renderClear(rend);

                    // Draw key indicators
                    drawKeyIndicator(rend, 100, 100, zsdl3.SDL_SCANCODE_W);
                    drawKeyIndicator(rend, 150, 100, zsdl3.SDL_SCANCODE_A);
                    drawKeyIndicator(rend, 200, 100, zsdl3.SDL_SCANCODE_S);
                    drawKeyIndicator(rend, 250, 100, zsdl3.SDL_SCANCODE_D);
                    drawKeyIndicator(rend, 175, 150, zsdl3.SDL_SCANCODE_SPACE);

                    // Draw modifier indicators
                    drawModifierIndicator(rend, 50, 200, zsdl3.KMOD_SHIFT, current_mod);
                    drawModifierIndicator(rend, 150, 200, zsdl3.KMOD_CTRL, current_mod);
                    drawModifierIndicator(rend, 250, 200, zsdl3.KMOD_ALT, current_mod);

                    zsdl3.renderPresent(rend);
                    zsdl3.delay(16); // ~60 FPS
                }
            }
        }
    }
}

fn drawKeyIndicator(renderer: *zsdl3.SDL_Renderer, x: f32, y: f32, scancode: zsdl3.SDL_Scancode) void {
    const keyboard_state = zsdl3.getKeyboardState(null);
    const is_pressed = keyboard_state[@intCast(scancode)] != 0;

    if (is_pressed) {
        _ = zsdl3.setRenderDrawColor(renderer, 100, 200, 100, 255);
    } else {
        _ = zsdl3.setRenderDrawColor(renderer, 80, 80, 80, 255);
    }

    const rect = zsdl3.SDL_FRect{ .x = x, .y = y, .w = 40, .h = 40 };
    _ = zsdl3.renderFillRect(renderer, &rect);

    _ = zsdl3.setRenderDrawColor(renderer, 200, 200, 200, 255);
    // Draw border
    const border_rect = zsdl3.SDL_FRect{ .x = x, .y = y, .w = 40, .h = 40 };
    _ = zsdl3.renderRect(renderer, &border_rect);
}

fn drawModifierIndicator(renderer: *zsdl3.SDL_Renderer, x: f32, y: f32, modifier: u16, current_mod: u16) void {
    const is_active = (current_mod & modifier) != 0;

    if (is_active) {
        _ = zsdl3.setRenderDrawColor(renderer, 200, 100, 100, 255);
    } else {
        _ = zsdl3.setRenderDrawColor(renderer, 60, 60, 60, 255);
    }

    const rect = zsdl3.SDL_FRect{ .x = x, .y = y, .w = 80, .h = 30 };
    _ = zsdl3.renderFillRect(renderer, &rect);
}
