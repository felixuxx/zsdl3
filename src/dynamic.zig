const std = @import("std");
const builtin = @import("builtin");

pub const LibraryHandle = if (builtin.os.tag == .windows)
    std.os.windows.HMODULE
else
    *anyopaque;

pub const LoadError = error{
    LibraryNotFound,
    SymbolNotFound,
};

pub fn loadLibrary(name: [:0]const u8) LoadError!LibraryHandle {
    switch (builtin.os.tag) {
        .linux, .freebsd, .openbsd, .netbsd => {
            const handle = std.c.dlopen(name, @bitCast(@as(u32, 0x00001)));
            if (handle) |h| return h;
            return LoadError.LibraryNotFound;
        },
        .windows => {
            const kernel32 = std.os.windows.kernel32;
            const handle = kernel32.LoadLibraryA(name);
            if (handle) |h| return h;
            return LoadError.LibraryNotFound;
        },
        .macos, .ios => {
            const handle = std.c.dlopen(name, @bitCast(@as(u32, 0x00001)));
            if (handle) |h| return h;
            return LoadError.LibraryNotFound;
        },
        else => @compileError("Unsupported platform for SDL bindings"),
    }
}

pub fn getSymbol(handle: LibraryHandle, name: [:0]const u8) ?*anyopaque {
    switch (builtin.os.tag) {
        .linux, .freebsd, .openbsd, .netbsd, .macos, .ios => {
            return std.c.dlsym(handle, name);
        },
        .windows => {
            const kernel32 = std.os.windows.kernel32;
            return kernel32.GetProcAddress(handle, name);
        },
        else => @compileError("Unsupported platform for SDL bindings"),
    }
}

pub fn unloadLibrary(handle: LibraryHandle) void {
    switch (builtin.os.tag) {
        .linux, .freebsd, .openbsd, .netbsd, .macos, .ios => {
            _ = std.c.dlclose(handle);
        },
        .windows => {
            const kernel32 = std.os.windows.kernel32;
            _ = kernel32.FreeLibrary(handle);
        },
        else => @compileError("Unsupported platform for SDL bindings"),
    }
}

fn makeSymbolName(comptime zig_name: []const u8, comptime prefix: []const u8) [prefix.len + zig_name.len:0]u8 {
    comptime {
        var buf: [prefix.len + zig_name.len:0]u8 = undefined;
        @memcpy(buf[0..prefix.len], prefix);
        buf[prefix.len] = std.ascii.toUpper(zig_name[0]);
        if (zig_name.len > 1) {
            @memcpy(buf[prefix.len + 1 .. prefix.len + zig_name.len], zig_name[1..]);
        }
        return buf;
    }
}

pub fn loadFunctions(comptime T: type, handle: LibraryHandle, comptime prefix: [:0]const u8, comptime overrides: anytype, comptime optionals: []const [:0]const u8) !T {
    @setEvalBranchQuota(50000);
    var self: T = undefined;
    inline for (@typeInfo(T).@"struct".fields) |field| {
        if (field.name[0] == '_') continue;

        const c_name: [:0]const u8 = comptime blk: {
            for (overrides) |override| {
                if (std.mem.eql(u8, field.name, override[0])) {
                    break :blk override[1];
                }
            }
            const arr = makeSymbolName(field.name, prefix);
            break :blk &arr;
        };

        const ptr = getSymbol(handle, c_name);
        if (ptr) |p| {
            @field(self, field.name) = @ptrCast(@alignCast(p));
        } else {
            const is_optional = comptime try_opt: {
                for (optionals) |opt| {
                    if (std.mem.eql(u8, opt, field.name)) break :try_opt true;
                }
                break :try_opt false;
            };
            if (!is_optional) return LoadError.SymbolNotFound;
            @field(self, field.name) = null;
        }
    }
    return self;
}
