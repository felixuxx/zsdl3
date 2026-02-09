// Simple Text Editor Example
// Demonstrates text input, editing, and rendering

const std = @import("std");
const zsdl3 = @import("zsdl3");

const MAX_TEXT_LENGTH = 10000;
const LINE_HEIGHT = 24;
const PADDING = 10;
const CURSOR_BLINK_RATE = 500; // milliseconds

pub fn main() void {
    // Initialize SDL with video subsystem
    if (!zsdl3.init(zsdl3.SDL_INIT_VIDEO)) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.debug.print("Failed to initialize SDL: {s}\n", .{err});
        return;
    }
    defer zsdl3.quit();

    // Initialize TTF
    if (!zsdl3.ttf.init()) {
        const err = zsdl3.getError() orelse "Unknown error";
        std.debug.print("Failed to initialize TTF: {s}\n", .{err});
        return;
    }
    defer zsdl3.ttf.quit();

    // Create a window
    const window = zsdl3.createWindow("Simple Text Editor", 800, 600, zsdl3.SDL_WINDOW_RESIZABLE);
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

    // Try to open a font
    const font_paths = [_][:0]const u8{
        "/usr/share/fonts/Adwaita/AdwaitaSans-Regular.ttf",
        "/usr/share/fonts/TTF/Vera.ttf",
        "/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf",
        "/usr/share/fonts/truetype/liberation/LiberationMono-Regular.ttf",
        "/System/Library/Fonts/Menlo.ttc",
        "C:/Windows/Fonts/consola.ttf",
        "consola.ttf",
    };

    var font: ?*zsdl3.ttf.TTF_Font = null;
    
    for (font_paths) |path| {
        font = zsdl3.ttf.openFont(path, @as(f32, @floatFromInt(LINE_HEIGHT)));
        if (font != null) {
            std.debug.print("Successfully loaded font from: {s}\n", .{path});
            break;
        }
    }
    defer if (font) |f| zsdl3.ttf.closeFont(f);

    if (font == null) {
        std.debug.print("Warning: Could not load any font file.\n", .{});
        std.debug.print("The editor will not be able to display text.\n", .{});
    }

    // Text buffer (using a simple array for simplicity)
    var text_buffer: [MAX_TEXT_LENGTH]u8 = undefined;
    var text_len: usize = 0;
    var cursor_pos: usize = 0;
    const scroll_y: f32 = 0; // TODO: Implement scrolling
    
    // Initialize with some sample text
    const sample_text = "Welcome to Simple Text Editor!\n\nType here...\n\n";
    @memcpy(text_buffer[0..sample_text.len], sample_text);
    text_len = sample_text.len;
    cursor_pos = text_len;

    // Enable text input
    _ = zsdl3.input.startTextInput(window);

    // Main loop
    var running = true;
    var cursor_visible = true;
    var last_cursor_toggle: u64 = 0;

    while (running) {
        // Handle events
        var event: zsdl3.SDL_Event = undefined;
        while (zsdl3.pollEvent(&event)) {
            switch (event.type) {
                zsdl3.SDL_EVENT_QUIT => running = false,
                zsdl3.SDL_EVENT_KEY_DOWN => {
                    if (event.key.scancode == zsdl3.SDL_SCANCODE_ESCAPE) {
                        running = false;
                    } else if (event.key.scancode == zsdl3.SDL_SCANCODE_BACKSPACE) {
                        // Handle backspace
                        if (cursor_pos > 0) {
                            cursor_pos -= 1;
                            // Remove character at cursor
                            for (cursor_pos..text_len) |i| {
                                text_buffer[i] = text_buffer[i + 1];
                            }
                            text_len -= 1;
                        }
                    } else if (event.key.scancode == zsdl3.SDL_SCANCODE_RETURN) {
                        // Handle enter/return
                        if (text_len < MAX_TEXT_LENGTH - 1) {
                            // Insert newline
                            for (cursor_pos..text_len) |i| {
                                text_buffer[text_len - i + cursor_pos] = text_buffer[text_len - i + cursor_pos - 1];
                            }
                            text_buffer[cursor_pos] = '\n';
                            cursor_pos += 1;
                            text_len += 1;
                        }
                    } else if (event.key.scancode == zsdl3.SDL_SCANCODE_LEFT) {
                        // Move cursor left
                        if (cursor_pos > 0) {
                            cursor_pos -= 1;
                        }
                    } else if (event.key.scancode == zsdl3.SDL_SCANCODE_RIGHT) {
                        // Move cursor right
                        if (cursor_pos < text_len) {
                            cursor_pos += 1;
                        }
                    } else if (event.key.scancode == zsdl3.SDL_SCANCODE_UP) {
                        // Move cursor up (simple: move to start of previous line)
                        var pos = cursor_pos;
                        var found_newline = false;
                        // Find previous newline
                        while (pos > 0) {
                            pos -= 1;
                            if (text_buffer[pos] == '\n') {
                                found_newline = true;
                                break;
                            }
                        }
                        if (found_newline) {
                            cursor_pos = pos;
                        } else if (pos == 0) {
                            cursor_pos = 0;
                        }
                    } else if (event.key.scancode == zsdl3.SDL_SCANCODE_DOWN) {
                        // Move cursor down (simple: move to start of next line)
                        var pos = cursor_pos;
                        // Find next newline
                        while (pos < text_len) {
                            if (text_buffer[pos] == '\n') {
                                cursor_pos = pos + 1;
                                break;
                            }
                            pos += 1;
                        }
                        if (pos >= text_len) {
                            cursor_pos = text_len;
                        }
                    }
                },
                zsdl3.SDL_EVENT_TEXT_INPUT => {
                    // Handle text input
                    if (text_len < MAX_TEXT_LENGTH - 1) {
                        const input_text = std.mem.span(event.text.text);
                        if (input_text.len > 0) {
                            // Insert text at cursor position
                            const insert_len = @min(input_text.len, MAX_TEXT_LENGTH - text_len - 1);
                            // Shift existing text right
                            var i = text_len;
                            while (i > cursor_pos) : (i -= 1) {
                                text_buffer[i + insert_len] = text_buffer[i];
                            }
                            // Insert new text
                            @memcpy(text_buffer[cursor_pos..cursor_pos + insert_len], input_text[0..insert_len]);
                            cursor_pos += insert_len;
                            text_len += insert_len;
                        }
                    }
                },
                else => {},
            }
        }

        // Toggle cursor visibility
        const current_time = zsdl3.getTicks();
        if (current_time - last_cursor_toggle > CURSOR_BLINK_RATE) {
            cursor_visible = !cursor_visible;
            last_cursor_toggle = current_time;
        }

        // Clear screen with background color
        _ = zsdl3.setRenderDrawColor(renderer, 30, 30, 35, 255);
        _ = zsdl3.renderClear(renderer);

        // Render text if font is available
        if (font) |f| {
            const text_color = zsdl3.SDL_Color{ .r = 220, .g = 220, .b = 220, .a = 255 };
            
            var y_pos: f32 = PADDING - scroll_y;
            var current_line_start: usize = 0;
            var line_num: usize = 0;
            var cursor_line: usize = 0;
            var cursor_x_in_line: usize = 0;
            
            // First pass: find cursor position
            var char_count: usize = 0;
            for (0..text_len) |i| {
                if (i == cursor_pos) {
                    cursor_line = line_num;
                    cursor_x_in_line = char_count;
                    break;
                }
                if (text_buffer[i] == '\n') {
                    line_num += 1;
                    char_count = 0;
                } else {
                    char_count += 1;
                }
            }
            if (cursor_pos == text_len) {
                cursor_line = line_num;
                cursor_x_in_line = char_count;
            }
            
            // Second pass: render text line by line
            line_num = 0;
            current_line_start = 0;
            for (0..text_len + 1) |i| {
                if (i == text_len or text_buffer[i] == '\n') {
                    // Render this line
                    const line_len = i - current_line_start;
                    if (line_len > 0) {
                        // Create null-terminated string for this line
                        var line_buf: [1024]u8 = undefined;
                        @memcpy(line_buf[0..line_len], text_buffer[current_line_start..i]);
                        line_buf[line_len] = 0;
                        
                        if (zsdl3.ttf.renderTextBlended(f, line_buf[0..line_len :0].ptr, 0, text_color)) |surf| {
                            defer zsdl3.destroySurface(surf);
                            if (zsdl3.createTextureFromSurface(renderer, surf)) |tex| {
                                defer zsdl3.destroyTexture(tex);
                                var tex_w: f32 = 0;
                                var tex_h: f32 = 0;
                                if (zsdl3.textureSize(tex, &tex_w, &tex_h)) {
                                    const text_rect = zsdl3.SDL_FRect{
                                        .x = PADDING,
                                        .y = y_pos,
                                        .w = tex_w,
                                        .h = tex_h,
                                    };
                                    _ = zsdl3.renderTexture(renderer, tex, null, &text_rect);
                                    
                                    // Draw cursor if on this line
                                    if (line_num == cursor_line and cursor_visible) {
                                        // Calculate cursor x position
                                        var cursor_x: f32 = PADDING;
                                        if (cursor_x_in_line > 0) {
                                            // Measure text up to cursor
                                            var cursor_buf: [1024]u8 = undefined;
                                            const cursor_text_len = @min(cursor_x_in_line, line_len);
                                            @memcpy(cursor_buf[0..cursor_text_len], text_buffer[current_line_start..current_line_start + cursor_text_len]);
                                            cursor_buf[cursor_text_len] = 0;
                                            
                                            var w: c_int = 0;
                                            var h: c_int = 0;
                                            if (zsdl3.ttf.getStringSize(f, cursor_buf[0..cursor_text_len :0].ptr, cursor_text_len, &w, &h)) {
                                                cursor_x = PADDING + @as(f32, @floatFromInt(w));
                                            }
                                        }
                                        
                                        // Draw cursor line
                                        _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255);
                                        const cursor_rect = zsdl3.SDL_FRect{
                                            .x = cursor_x,
                                            .y = y_pos,
                                            .w = 2,
                                            .h = tex_h,
                                        };
                                        _ = zsdl3.renderFillRect(renderer, &cursor_rect);
                                    }
                                }
                            }
                        }
                    } else {
                        // Empty line - still draw cursor if needed
                        if (line_num == cursor_line and cursor_visible) {
                            _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255);
                            const cursor_rect = zsdl3.SDL_FRect{
                                .x = PADDING,
                                .y = y_pos,
                                .w = 2,
                                .h = @as(f32, @floatFromInt(LINE_HEIGHT)),
                            };
                            _ = zsdl3.renderFillRect(renderer, &cursor_rect);
                        }
                    }
                    
                    y_pos += LINE_HEIGHT;
                    line_num += 1;
                    current_line_start = i + 1;
                }
            }
            
            // Draw cursor at end of text if at end
            if (cursor_pos == text_len and cursor_visible) {
                const cursor_y: f32 = PADDING + @as(f32, @floatFromInt(cursor_line * LINE_HEIGHT)) - scroll_y;
                _ = zsdl3.setRenderDrawColor(renderer, 255, 255, 255, 255);
                const cursor_rect = zsdl3.SDL_FRect{
                    .x = PADDING,
                    .y = cursor_y,
                    .w = 2,
                    .h = @as(f32, @floatFromInt(LINE_HEIGHT)),
                };
                _ = zsdl3.renderFillRect(renderer, &cursor_rect);
            }
        } else {
            // Show message if no font available
            _ = zsdl3.setRenderDrawColor(renderer, 255, 100, 100, 255);
            const msg_rect = zsdl3.SDL_FRect{
                .x = 50,
                .y = 250,
                .w = 700,
                .h = 100,
            };
            _ = zsdl3.renderFillRect(renderer, &msg_rect);
        }

        // Present the rendered frame
        zsdl3.renderPresent(renderer);

        // Small delay to prevent 100% CPU usage
        zsdl3.delay(16); // ~60 FPS
    }

    // Disable text input
    _ = zsdl3.input.stopTextInput(window);
}
