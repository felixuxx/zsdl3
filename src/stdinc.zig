// SDL3 Stdinc Bindings
// Standard includes: memory, string, math helpers

const core = @import("core.zig");

pub const Sint64 = core.Sint64;
pub const Uint64 = core.Uint64;
pub const Uint16 = core.Uint16;
pub const Uint32 = core.Uint32;

// Allocator callback types
pub const SDL_malloc_func = ?*const fn (size: usize) callconv(.c) ?*anyopaque;
pub const SDL_calloc_func = ?*const fn (nmemb: usize, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;

// Environment opaque type
pub const SDL_Environment = opaque {};

// Stdinc functions
extern fn SDL_memset(dst: ?*anyopaque, c: c_int, len: usize) ?*anyopaque;
extern fn SDL_memcpy(dst: ?*anyopaque, src: ?*const anyopaque, len: usize) ?*anyopaque;
extern fn SDL_memmove(dst: ?*anyopaque, src: ?*const anyopaque, len: usize) ?*anyopaque;
extern fn SDL_memcmp(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
extern fn SDL_strlen(str: ?[*:0]const u8) usize;
extern fn SDL_strlcpy(dst: ?[*:0]u8, src: ?[*:0]const u8, maxlen: usize) usize;
extern fn SDL_utf8strlcpy(dst: ?[*:0]u8, src: ?[*:0]const u8, dst_bytes: usize) usize;
extern fn SDL_strlcat(dst: ?[*:0]u8, src: ?[*:0]const u8, maxlen: usize) usize;
extern fn SDL_strdup(str: ?[*:0]const u8) ?[*:0]u8;
extern fn SDL_strrev(str: ?[*:0]u8) ?[*:0]u8;
extern fn SDL_strupr(str: ?[*:0]u8) ?[*:0]u8;
extern fn SDL_strlwr(str: ?[*:0]u8) ?[*:0]u8;
extern fn SDL_strchr(str: ?[*:0]const u8, c: c_int) ?[*:0]u8;
extern fn SDL_strrchr(str: ?[*:0]const u8, c: c_int) ?[*:0]u8;
extern fn SDL_strstr(haystack: ?[*:0]const u8, needle: ?[*:0]const u8) ?[*:0]u8;
extern fn SDL_strcasestr(haystack: ?[*:0]const u8, needle: ?[*:0]const u8) ?[*:0]u8;
extern fn SDL_strtokr(s1: ?[*:0]u8, s2: ?[*:0]const u8, saveptr: ?*?[*:0]u8) ?[*:0]u8;
extern fn SDL_utf8strlen(str: ?[*:0]const u8) usize;
extern fn SDL_utf8strnlen(str: ?[*:0]const u8, bytes: usize) usize;
extern fn SDL_itoa(value: c_int, str: ?[*:0]u8, radix: c_int) ?[*:0]u8;
extern fn SDL_uitoa(value: c_uint, str: ?[*:0]u8, radix: c_int) ?[*:0]u8;
extern fn SDL_ltoa(value: c_long, str: ?[*:0]u8, radix: c_int) ?[*:0]u8;
extern fn SDL_ultoa(value: c_ulong, str: ?[*:0]u8, radix: c_int) ?[*:0]u8;
extern fn SDL_lltoa(value: Sint64, str: ?[*:0]u8, radix: c_int) ?[*:0]u8;
extern fn SDL_ulltoa(value: Uint64, str: ?[*:0]u8, radix: c_int) ?[*:0]u8;
extern fn SDL_atoi(str: ?[*:0]const u8) c_int;
extern fn SDL_atof(str: ?[*:0]const u8) f64;
extern fn SDL_strtol(str: ?[*:0]const u8, endp: ?*?[*:0]u8, base: c_int) c_long;
extern fn SDL_strtoul(str: ?[*:0]const u8, endp: ?*?[*:0]u8, base: c_int) c_ulong;
extern fn SDL_strtoll(str: ?[*:0]const u8, endp: ?*?[*:0]u8, base: c_int) Sint64;
extern fn SDL_strtoull(str: ?[*:0]const u8, endp: ?*?[*:0]u8, base: c_int) Uint64;
extern fn SDL_strtod(str: ?[*:0]const u8, endp: ?*?[*:0]u8) f64;
extern fn SDL_abs(x: c_int) c_int;
extern fn SDL_min(x: c_int, y: c_int) c_int;
extern fn SDL_max(x: c_int, y: c_int) c_int;
extern fn SDL_clamp(x: c_int, a: c_int, b: c_int) c_int;
extern fn SDL_isalpha(x: c_int) c_int;
extern fn SDL_isalnum(x: c_int) c_int;
extern fn SDL_isblank(x: c_int) c_int;
extern fn SDL_iscntrl(x: c_int) c_int;
extern fn SDL_isdigit(x: c_int) c_int;
extern fn SDL_isxdigit(x: c_int) c_int;
extern fn SDL_ispunct(x: c_int) c_int;
extern fn SDL_isspace(x: c_int) c_int;
extern fn SDL_isupper(x: c_int) c_int;
extern fn SDL_islower(x: c_int) c_int;
extern fn SDL_isprint(x: c_int) c_int;
extern fn SDL_isgraph(x: c_int) c_int;
extern fn SDL_toupper(x: c_int) c_int;
extern fn SDL_tolower(x: c_int) c_int;
extern fn SDL_StepUTF8(pstr: ?*?[*:0]const u8, pslen: ?*usize) Uint32;
extern fn SDL_StepBackUTF8(start: ?[*:0]const u8, pstr: ?*?[*:0]const u8) Uint32;
extern fn SDL_UCS4ToUTF8(codepoint: Uint32, dst: ?[*:0]u8) ?[*:0]u8;
extern fn SDL_crc16(crc: Uint16, data: ?*const anyopaque, len: usize) Uint16;
extern fn SDL_crc32(crc: Uint32, data: ?*const anyopaque, len: usize) Uint32;
extern fn SDL_murmur3_32(data: ?*const anyopaque, len: usize, seed: Uint32) Uint32;

// Memory function query/set
extern fn SDL_GetMemoryFunctions(malloc_func: ?*SDL_malloc_func, calloc_func: ?*SDL_calloc_func, realloc_func: ?*SDL_realloc_func, free_func: ?*SDL_free_func) void;
extern fn SDL_SetMemoryFunctions(malloc_func: SDL_malloc_func, calloc_func: SDL_calloc_func, realloc_func: SDL_realloc_func, free_func: SDL_free_func) bool;
extern fn SDL_GetOriginalMemoryFunctions(malloc_func: ?*SDL_malloc_func, calloc_func: ?*SDL_calloc_func, realloc_func: ?*SDL_realloc_func, free_func: ?*SDL_free_func) void;

// Environment functions
extern fn SDL_GetEnvironment() ?*SDL_Environment;
extern fn SDL_CreateEnvironment(populated: bool) ?*SDL_Environment;
extern fn SDL_DestroyEnvironment(env: ?*SDL_Environment) void;
extern fn SDL_GetEnvironmentVariable(env: ?*SDL_Environment, name: ?[*:0]const u8) ?[*:0]const u8;
extern fn SDL_GetEnvironmentVariables(env: ?*SDL_Environment) ?[*]?[*:0]u8;
extern fn SDL_SetEnvironmentVariable(env: ?*SDL_Environment, name: ?[*:0]const u8, value: ?[*:0]const u8, overwrite: bool) bool;
extern fn SDL_UnsetEnvironmentVariable(env: ?*SDL_Environment, name: ?[*:0]const u8) bool;

// Public API
pub const memset = SDL_memset;
pub const memcpy = SDL_memcpy;
pub const memmove = SDL_memmove;
pub const memcmp = SDL_memcmp;
pub const strlen = SDL_strlen;
pub const strlcpy = SDL_strlcpy;
pub const utf8strlcpy = SDL_utf8strlcpy;
pub const strlcat = SDL_strlcat;
pub const strdup = SDL_strdup;
pub const strrev = SDL_strrev;
pub const strupr = SDL_strupr;
pub const strlwr = SDL_strlwr;
pub const strchr = SDL_strchr;
pub const strrchr = SDL_strrchr;
pub const strstr = SDL_strstr;
pub const strcasestr = SDL_strcasestr;
pub const strtokr = SDL_strtokr;
pub const utf8strlen = SDL_utf8strlen;
pub const utf8strnlen = SDL_utf8strnlen;
pub const itoa = SDL_itoa;
pub const uitoa = SDL_uitoa;
pub const ltoa = SDL_ltoa;
pub const ultoa = SDL_ultoa;
pub const lltoa = SDL_lltoa;
pub const ulltoa = SDL_ulltoa;
pub const atoi = SDL_atoi;
pub const atof = SDL_atof;
pub const strtol = SDL_strtol;
pub const strtoul = SDL_strtoul;
pub const strtoll = SDL_strtoll;
pub const strtoull = SDL_strtoull;
pub const strtod = SDL_strtod;
pub const abs = SDL_abs;
pub const min = SDL_min;
pub const max = SDL_max;
pub const clamp = SDL_clamp;
pub const isalpha = SDL_isalpha;
pub const isalnum = SDL_isalnum;
pub const isblank = SDL_isblank;
pub const iscntrl = SDL_iscntrl;
pub const isdigit = SDL_isdigit;
pub const isxdigit = SDL_isxdigit;
pub const ispunct = SDL_ispunct;
pub const isspace = SDL_isspace;
pub const isupper = SDL_isupper;
pub const islower = SDL_islower;
pub const isprint = SDL_isprint;
pub const isgraph = SDL_isgraph;
pub const toupper = SDL_toupper;
pub const tolower = SDL_tolower;
pub const stepUTF8 = SDL_StepUTF8;
pub const stepBackUTF8 = SDL_StepBackUTF8;
pub const ucs4ToUTF8 = SDL_UCS4ToUTF8;
pub const crc16 = SDL_crc16;
pub const crc32 = SDL_crc32;
pub const murmur3_32 = SDL_murmur3_32;
pub const getMemoryFunctions = SDL_GetMemoryFunctions;
pub const setMemoryFunctions = SDL_SetMemoryFunctions;
pub const getOriginalMemoryFunctions = SDL_GetOriginalMemoryFunctions;
pub const getEnvironment = SDL_GetEnvironment;
pub const createEnvironment = SDL_CreateEnvironment;
pub const destroyEnvironment = SDL_DestroyEnvironment;
pub const getEnvironmentVariable = SDL_GetEnvironmentVariable;
pub const getEnvironmentVariables = SDL_GetEnvironmentVariables;
pub const setEnvironmentVariable = SDL_SetEnvironmentVariable;
pub const unsetEnvironmentVariable = SDL_UnsetEnvironmentVariable;
