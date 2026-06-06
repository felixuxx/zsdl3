// SDL3 Stdinc Bindings
// Standard includes: memory, string, math helpers

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

// Import types
pub const Sint64 = core.Sint64;
pub const Uint64 = core.Uint64;

// Stdinc functions
pub const PFN_SDL_memset = *const fn (dst: ?*anyopaque, c: c_int, len: usize) callconv(.c) ?*anyopaque;
pub const PFN_SDL_memcpy = *const fn (dst: ?*anyopaque, src: ?*const anyopaque, len: usize) callconv(.c) ?*anyopaque;
pub const PFN_SDL_memmove = *const fn (dst: ?*anyopaque, src: ?*const anyopaque, len: usize) callconv(.c) ?*anyopaque;
pub const PFN_SDL_memcmp = *const fn (s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) callconv(.c) c_int;
pub const PFN_SDL_strlen = *const fn (str: ?[*:0]const u8) callconv(.c) usize;
pub const PFN_SDL_strlcpy = *const fn (dst: ?[*:0]u8, src: ?[*:0]const u8, maxlen: usize) callconv(.c) usize;
pub const PFN_SDL_utf8strlcpy = *const fn (dst: ?[*:0]u8, src: ?[*:0]const u8, dst_bytes: usize) callconv(.c) usize;
pub const PFN_SDL_strlcat = *const fn (dst: ?[*:0]u8, src: ?[*:0]const u8, maxlen: usize) callconv(.c) usize;
pub const PFN_SDL_strdup = *const fn (str: ?[*:0]const u8) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_strrev = *const fn (str: ?[*:0]u8) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_strupr = *const fn (str: ?[*:0]u8) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_strlwr = *const fn (str: ?[*:0]u8) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_strchr = *const fn (str: ?[*:0]const u8, c: c_int) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_strrchr = *const fn (str: ?[*:0]const u8, c: c_int) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_strstr = *const fn (haystack: ?[*:0]const u8, needle: ?[*:0]const u8) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_strcasestr = *const fn (haystack: ?[*:0]const u8, needle: ?[*:0]const u8) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_strtokr = *const fn (s1: ?[*:0]u8, s2: ?[*:0]const u8, saveptr: ?*?[*:0]u8) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_utf8strlen = *const fn (str: ?[*:0]const u8) callconv(.c) usize;
pub const PFN_SDL_utf8strnlen = *const fn (str: ?[*:0]const u8, bytes: usize) callconv(.c) usize;
pub const PFN_SDL_itoa = *const fn (value: c_int, str: ?[*:0]u8, radix: c_int) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_uitoa = *const fn (value: c_uint, str: ?[*:0]u8, radix: c_int) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_ltoa = *const fn (value: c_long, str: ?[*:0]u8, radix: c_int) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_ultoa = *const fn (value: c_ulong, str: ?[*:0]u8, radix: c_int) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_lltoa = *const fn (value: Sint64, str: ?[*:0]u8, radix: c_int) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_ulltoa = *const fn (value: Uint64, str: ?[*:0]u8, radix: c_int) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_atoi = *const fn (str: ?[*:0]const u8) callconv(.c) c_int;
pub const PFN_SDL_atof = *const fn (str: ?[*:0]const u8) callconv(.c) f64;
pub const PFN_SDL_strtol = *const fn (str: ?[*:0]const u8, endp: ?*?[*:0]u8, base: c_int) callconv(.c) c_long;
pub const PFN_SDL_strtoul = *const fn (str: ?[*:0]const u8, endp: ?*?[*:0]u8, base: c_int) callconv(.c) c_ulong;
pub const PFN_SDL_strtoll = *const fn (str: ?[*:0]const u8, endp: ?*?[*:0]u8, base: c_int) callconv(.c) Sint64;
pub const PFN_SDL_strtoull = *const fn (str: ?[*:0]const u8, endp: ?*?[*:0]u8, base: c_int) callconv(.c) Uint64;
pub const PFN_SDL_strtod = *const fn (str: ?[*:0]const u8, endp: ?*?[*:0]u8) callconv(.c) f64;
pub const PFN_SDL_abs = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_min = *const fn (x: c_int, y: c_int) callconv(.c) c_int;
pub const PFN_SDL_max = *const fn (x: c_int, y: c_int) callconv(.c) c_int;
pub const PFN_SDL_clamp = *const fn (x: c_int, a: c_int, b: c_int) callconv(.c) c_int;
pub const PFN_SDL_isalpha = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_isalnum = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_isblank = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_iscntrl = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_isdigit = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_isxdigit = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_ispunct = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_isspace = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_isupper = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_islower = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_isprint = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_isgraph = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_toupper = *const fn (x: c_int) callconv(.c) c_int;
pub const PFN_SDL_tolower = *const fn (x: c_int) callconv(.c) c_int;

pub const StdincFunctions = struct {
    memset: PFN_SDL_memset,
    memcpy: PFN_SDL_memcpy,
    memmove: PFN_SDL_memmove,
    memcmp: PFN_SDL_memcmp,
    strlen: PFN_SDL_strlen,
    strlcpy: PFN_SDL_strlcpy,
    utf8strlcpy: PFN_SDL_utf8strlcpy,
    strlcat: PFN_SDL_strlcat,
    strdup: PFN_SDL_strdup,
    strrev: PFN_SDL_strrev,
    strupr: PFN_SDL_strupr,
    strlwr: PFN_SDL_strlwr,
    strchr: PFN_SDL_strchr,
    strrchr: PFN_SDL_strrchr,
    strstr: PFN_SDL_strstr,
    strcasestr: PFN_SDL_strcasestr,
    strtokr: PFN_SDL_strtokr,
    utf8strlen: PFN_SDL_utf8strlen,
    utf8strnlen: PFN_SDL_utf8strnlen,
    itoa: PFN_SDL_itoa,
    uitoa: PFN_SDL_uitoa,
    ltoa: PFN_SDL_ltoa,
    ultoa: PFN_SDL_ultoa,
    lltoa: PFN_SDL_lltoa,
    ulltoa: PFN_SDL_ulltoa,
    atoi: PFN_SDL_atoi,
    atof: PFN_SDL_atof,
    strtol: PFN_SDL_strtol,
    strtoul: PFN_SDL_strtoul,
    strtoll: PFN_SDL_strtoll,
    strtoull: PFN_SDL_strtoull,
    strtod: PFN_SDL_strtod,
    abs: PFN_SDL_abs,
    min: PFN_SDL_min,
    max: PFN_SDL_max,
    clamp: PFN_SDL_clamp,
    isalpha: PFN_SDL_isalpha,
    isalnum: PFN_SDL_isalnum,
    isblank: PFN_SDL_isblank,
    iscntrl: PFN_SDL_iscntrl,
    isdigit: PFN_SDL_isdigit,
    isxdigit: PFN_SDL_isxdigit,
    ispunct: PFN_SDL_ispunct,
    isspace: PFN_SDL_isspace,
    isupper: PFN_SDL_isupper,
    islower: PFN_SDL_islower,
    isprint: PFN_SDL_isprint,
    isgraph: PFN_SDL_isgraph,
    toupper: PFN_SDL_toupper,
    tolower: PFN_SDL_tolower,

    pub fn load(handle: dynamic.LibraryHandle) !StdincFunctions {
        return dynamic.loadFunctions(StdincFunctions, handle, "SDL_", .{
            .{ "memset", "SDL_memset" },
            .{ "memcpy", "SDL_memcpy" },
            .{ "memmove", "SDL_memmove" },
            .{ "memcmp", "SDL_memcmp" },
            .{ "strlen", "SDL_strlen" },
            .{ "strlcpy", "SDL_strlcpy" },
            .{ "utf8strlcpy", "SDL_utf8strlcpy" },
            .{ "strlcat", "SDL_strlcat" },
            .{ "strdup", "SDL_strdup" },
            .{ "strrev", "SDL_strrev" },
            .{ "strupr", "SDL_strupr" },
            .{ "strlwr", "SDL_strlwr" },
            .{ "strchr", "SDL_strchr" },
            .{ "strrchr", "SDL_strrchr" },
            .{ "strstr", "SDL_strstr" },
            .{ "strcasestr", "SDL_strcasestr" },
            .{ "strtokr", "SDL_strtokr" },
            .{ "utf8strlen", "SDL_utf8strlen" },
            .{ "utf8strnlen", "SDL_utf8strnlen" },
            .{ "itoa", "SDL_itoa" },
            .{ "uitoa", "SDL_uitoa" },
            .{ "ltoa", "SDL_ltoa" },
            .{ "ultoa", "SDL_ultoa" },
            .{ "lltoa", "SDL_lltoa" },
            .{ "ulltoa", "SDL_ulltoa" },
            .{ "atoi", "SDL_atoi" },
            .{ "atof", "SDL_atof" },
            .{ "strtol", "SDL_strtol" },
            .{ "strtoul", "SDL_strtoul" },
            .{ "strtoll", "SDL_strtoll" },
            .{ "strtoull", "SDL_strtoull" },
            .{ "strtod", "SDL_strtod" },
            .{ "abs", "SDL_abs" },
            .{ "min", "SDL_min" },
            .{ "max", "SDL_max" },
            .{ "clamp", "SDL_clamp" },
            .{ "isalpha", "SDL_isalpha" },
            .{ "isalnum", "SDL_isalnum" },
            .{ "isblank", "SDL_isblank" },
            .{ "iscntrl", "SDL_iscntrl" },
            .{ "isdigit", "SDL_isdigit" },
            .{ "isxdigit", "SDL_isxdigit" },
            .{ "ispunct", "SDL_ispunct" },
            .{ "isspace", "SDL_isspace" },
            .{ "isupper", "SDL_isupper" },
            .{ "islower", "SDL_islower" },
            .{ "isprint", "SDL_isprint" },
            .{ "isgraph", "SDL_isgraph" },
            .{ "toupper", "SDL_toupper" },
            .{ "tolower", "SDL_tolower" },
        }, &.{ "strtokr", "min", "max", "clamp" });
    }
};
