// SDL3 Stdinc Bindings
// Standard includes: memory, string, math helpers

const core = @import("core.zig");

pub const Sint64 = core.Sint64;
pub const Sint32 = core.Sint32;
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

// Callback types for sort/search
pub const SDL_CompareCallback = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int;
pub const SDL_CompareCallback_r = ?*const fn (?*const anyopaque, ?*const anyopaque, ?*anyopaque) callconv(.c) c_int;

// Iconv type
pub const SDL_iconv_t = ?*anyopaque;

// Wide character type (maps to C wchar_t)
pub const SDL_wchar_t = c_int;

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

// Math functions (double)
extern fn SDL_acos(x: f64) f64;
extern fn SDL_asin(x: f64) f64;
extern fn SDL_atan(x: f64) f64;
extern fn SDL_atan2(x: f64, y: f64) f64;
extern fn SDL_ceil(x: f64) f64;
extern fn SDL_copysign(x: f64, y: f64) f64;
extern fn SDL_cos(x: f64) f64;
extern fn SDL_exp(x: f64) f64;
extern fn SDL_fabs(x: f64) f64;
extern fn SDL_floor(x: f64) f64;
extern fn SDL_fmod(x: f64, y: f64) f64;
extern fn SDL_log(x: f64) f64;
extern fn SDL_log10(x: f64) f64;
extern fn SDL_modf(x: f64, y: ?*f64) f64;
extern fn SDL_pow(x: f64, y: f64) f64;
extern fn SDL_round(x: f64) f64;
extern fn SDL_sin(x: f64) f64;
extern fn SDL_sqrt(x: f64) f64;
extern fn SDL_tan(x: f64) f64;
extern fn SDL_trunc(x: f64) f64;

// Math functions (float)
extern fn SDL_acosf(x: f32) f32;
extern fn SDL_asinf(x: f32) f32;
extern fn SDL_atanf(x: f32) f32;
extern fn SDL_atan2f(x: f32, y: f32) f32;
extern fn SDL_ceilf(x: f32) f32;
extern fn SDL_copysignf(x: f32, y: f32) f32;
extern fn SDL_cosf(x: f32) f32;
extern fn SDL_expf(x: f32) f32;
extern fn SDL_fabsf(x: f32) f32;
extern fn SDL_floorf(x: f32) f32;
extern fn SDL_fmodf(x: f32, y: f32) f32;
extern fn SDL_logf(x: f32) f32;
extern fn SDL_log10f(x: f32) f32;
extern fn SDL_modff(x: f32, y: ?*f32) f32;
extern fn SDL_powf(x: f32, y: f32) f32;
extern fn SDL_roundf(x: f32) f32;
extern fn SDL_sinf(x: f32) f32;
extern fn SDL_sqrtf(x: f32) f32;
extern fn SDL_tanf(x: f32) f32;
extern fn SDL_truncf(x: f32) f32;

// Memory allocation
extern fn SDL_malloc(size: usize) ?*anyopaque;
extern fn SDL_calloc(nmemb: usize, size: usize) ?*anyopaque;
extern fn SDL_realloc(mem: ?*anyopaque, size: usize) ?*anyopaque;
extern fn SDL_free(mem: ?*anyopaque) void;
extern fn SDL_aligned_alloc(alignment: usize, size: usize) ?*anyopaque;
extern fn SDL_aligned_free(mem: ?*anyopaque) void;

// String comparison
extern fn SDL_strcmp(str1: [*:0]const u8, str2: [*:0]const u8) c_int;
extern fn SDL_strncmp(str1: [*:0]const u8, str2: [*:0]const u8, maxlen: usize) c_int;
extern fn SDL_strcasecmp(str1: [*:0]const u8, str2: [*:0]const u8) c_int;
extern fn SDL_strncasecmp(str1: [*:0]const u8, str2: [*:0]const u8, maxlen: usize) c_int;
extern fn SDL_strndup(str: [*:0]const u8, maxlen: usize) ?[*:0]u8;
extern fn SDL_strtok_r(str: ?[*:0]u8, delim: [*:0]const u8, saveptr: ?*?[*:0]u8) ?[*:0]u8;

// Printf/scan
extern fn SDL_snprintf(text: [*:0]u8, maxlen: usize, fmt: [*:0]const u8, ...) c_int;
extern fn SDL_vsnprintf(text: [*:0]u8, maxlen: usize, fmt: [*:0]const u8, ap: [*c]u8) c_int;
extern fn SDL_asprintf(strp: ?*?[*:0]u8, fmt: [*:0]const u8, ...) c_int;
extern fn SDL_vasprintf(strp: ?*?[*:0]u8, fmt: [*:0]const u8, ap: [*c]u8) c_int;
extern fn SDL_swprintf(text: [*:0]c_int, maxlen: usize, fmt: [*:0]const c_int, ...) c_int;
extern fn SDL_sscanf(text: [*:0]const u8, fmt: [*:0]const u8, ...) c_int;

// Sort/search
extern fn SDL_qsort(base: ?*anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) void;
extern fn SDL_qsort_r(base: ?*anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback_r, userdata: ?*anyopaque) void;
extern fn SDL_bsearch(key: ?*const anyopaque, base: ?*const anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) ?*anyopaque;
extern fn SDL_bsearch_r(key: ?*const anyopaque, base: ?*const anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback_r, userdata: ?*anyopaque) ?*anyopaque;

// Random
extern fn SDL_srand(seed: Uint64) void;
extern fn SDL_rand(n: Sint32) Sint32;
extern fn SDL_rand_r(state: ?*Uint64, n: Sint32) Sint32;
extern fn SDL_rand_bits() Uint32;
extern fn SDL_rand_bits_r(state: ?*Uint64) Uint32;
extern fn SDL_randf() f32;
extern fn SDL_randf_r(state: ?*Uint64) f32;

// Unsafe env
extern fn SDL_getenv(name: [*:0]const u8) ?[*:0]const u8;

// Misc
extern fn SDL_memset4(dst: ?*anyopaque, val: Uint32, dwords: usize) ?*anyopaque;

// Iconv
extern fn SDL_iconv(cd: SDL_iconv_t, inbuf: ?*?[*:0]const u8, inbytesleft: ?*usize, outbuf: ?*?[*:0]u8, outbytesleft: ?*usize) usize;
extern fn SDL_iconv_open(tocode: [*:0]const u8, fromcode: [*:0]const u8) SDL_iconv_t;
extern fn SDL_iconv_close(cd: SDL_iconv_t) c_int;
extern fn SDL_iconv_string(tocode: [*:0]const u8, fromcode: [*:0]const u8, inbuf: [*:0]const u8, inbytesleft: usize) ?[*:0]u8;

// Unsafe environment access
extern fn SDL_getenv_unsafe(name: [*:0]const u8) ?[*:0]const u8;
extern fn SDL_setenv_unsafe(name: [*:0]const u8, value: [*:0]const u8, overwrite: c_int) c_int;
extern fn SDL_unsetenv_unsafe(name: [*:0]const u8) c_int;

// Memory introspection
extern fn SDL_GetNumAllocations() c_int;

// String utilities
extern fn SDL_strnlen(str: [*:0]const u8, maxlen: usize) usize;
extern fn SDL_strnstr(haystack: [*:0]const u8, needle: [*:0]const u8, maxlen: usize) ?[*:0]const u8;
extern fn SDL_strpbrk(str: [*:0]const u8, breakset: [*:0]const u8) ?[*:0]u8;

// Printf/scanf variants
extern fn SDL_vsscanf(text: [*:0]const u8, fmt: [*:0]const u8, ap: [*c]u8) c_int;
extern fn SDL_vswprintf(text: [*:0]SDL_wchar_t, maxlen: usize, fmt: [*:0]const SDL_wchar_t, ap: [*c]u8) c_int;

// Wide character string functions
extern fn SDL_wcslen(wstr: [*:0]const SDL_wchar_t) usize;
extern fn SDL_wcsnlen(wstr: [*:0]const SDL_wchar_t, maxlen: usize) usize;
extern fn SDL_wcslcpy(dst: [*:0]SDL_wchar_t, src: [*:0]const SDL_wchar_t, maxlen: usize) usize;
extern fn SDL_wcslcat(dst: [*:0]SDL_wchar_t, src: [*:0]const SDL_wchar_t, maxlen: usize) usize;
extern fn SDL_wcsdup(wstr: [*:0]const SDL_wchar_t) ?[*:0]SDL_wchar_t;
extern fn SDL_wcsstr(haystack: [*:0]const SDL_wchar_t, needle: [*:0]const SDL_wchar_t) ?[*:0]SDL_wchar_t;
extern fn SDL_wcsnstr(haystack: [*:0]const SDL_wchar_t, needle: [*:0]const SDL_wchar_t, maxlen: usize) ?[*:0]SDL_wchar_t;
extern fn SDL_wcscmp(str1: [*:0]const SDL_wchar_t, str2: [*:0]const SDL_wchar_t) c_int;
extern fn SDL_wcsncmp(str1: [*:0]const SDL_wchar_t, str2: [*:0]const SDL_wchar_t, maxlen: usize) c_int;
extern fn SDL_wcscasecmp(str1: [*:0]const SDL_wchar_t, str2: [*:0]const SDL_wchar_t) c_int;
extern fn SDL_wcsncasecmp(str1: [*:0]const SDL_wchar_t, str2: [*:0]const SDL_wchar_t, maxlen: usize) c_int;
extern fn SDL_wcstol(str: [*:0]const SDL_wchar_t, endp: ?*?[*:0]SDL_wchar_t, base: c_int) c_long;

// Float classification
extern fn SDL_isinf(x: f64) c_int;
extern fn SDL_isinff(x: f32) c_int;
extern fn SDL_isnan(x: f64) c_int;
extern fn SDL_isnanf(x: f32) c_int;

// Math rounding/scaling
extern fn SDL_lround(x: f64) c_long;
extern fn SDL_lroundf(x: f32) c_long;
extern fn SDL_scalbn(x: f64, n: c_int) f64;
extern fn SDL_scalbnf(x: f32, n: c_int) f32;

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
pub const malloc = SDL_malloc;
pub const calloc = SDL_calloc;
pub const realloc = SDL_realloc;
pub const free = SDL_free;
pub const alignedAlloc = SDL_aligned_alloc;
pub const alignedFree = SDL_aligned_free;
pub const strcmp = SDL_strcmp;
pub const strncmp = SDL_strncmp;
pub const strcasecmp = SDL_strcasecmp;
pub const strncasecmp = SDL_strncasecmp;
pub const strndup = SDL_strndup;
pub const strtok_r = SDL_strtok_r;
pub const snprintf = SDL_snprintf;
pub const vsnprintf = SDL_vsnprintf;
pub const asprintf = SDL_asprintf;
pub const vasprintf = SDL_vasprintf;
pub const swprintf = SDL_swprintf;
pub const sscanf = SDL_sscanf;
pub const qsort = SDL_qsort;
pub const qsort_r = SDL_qsort_r;
pub const bsearch = SDL_bsearch;
pub const bsearch_r = SDL_bsearch_r;
pub const srand = SDL_srand;
pub const rand = SDL_rand;
pub const rand_r = SDL_rand_r;
pub const randBits = SDL_rand_bits;
pub const randBits_r = SDL_rand_bits_r;
pub const randf = SDL_randf;
pub const randf_r = SDL_randf_r;
pub const getenv = SDL_getenv;
pub const memset4 = SDL_memset4;
pub const iconv = SDL_iconv;
pub const iconvOpen = SDL_iconv_open;
pub const iconvClose = SDL_iconv_close;
pub const iconvString = SDL_iconv_string;
pub const getenvUnsafe = SDL_getenv_unsafe;
pub const setenvUnsafe = SDL_setenv_unsafe;
pub const unsetenvUnsafe = SDL_unsetenv_unsafe;
pub const getNumAllocations = SDL_GetNumAllocations;
pub const strnlen = SDL_strnlen;
pub const strnstr = SDL_strnstr;
pub const strpbrk = SDL_strpbrk;
pub const vsscanf = SDL_vsscanf;
pub const vswprintf = SDL_vswprintf;
pub const wcslen = SDL_wcslen;
pub const wcsnlen = SDL_wcsnlen;
pub const wcslcpy = SDL_wcslcpy;
pub const wcslcat = SDL_wcslcat;
pub const wcsdup = SDL_wcsdup;
pub const wcsstr = SDL_wcsstr;
pub const wcsnstr = SDL_wcsnstr;
pub const wcscmp = SDL_wcscmp;
pub const wcsncmp = SDL_wcsncmp;
pub const wcscasecmp = SDL_wcscasecmp;
pub const wcsncasecmp = SDL_wcsncasecmp;
pub const wcstol = SDL_wcstol;
pub const isinf = SDL_isinf;
pub const isinff = SDL_isinff;
pub const isnan = SDL_isnan;
pub const isnanf = SDL_isnanf;
pub const lround = SDL_lround;
pub const lroundf = SDL_lroundf;
pub const scalbn = SDL_scalbn;
pub const scalbnf = SDL_scalbnf;
pub const getMemoryFunctions = SDL_GetMemoryFunctions;
pub const setMemoryFunctions = SDL_SetMemoryFunctions;
pub const getOriginalMemoryFunctions = SDL_GetOriginalMemoryFunctions;
pub const acos = SDL_acos;
pub const asin = SDL_asin;
pub const atan = SDL_atan;
pub const atan2 = SDL_atan2;
pub const ceil = SDL_ceil;
pub const copysign = SDL_copysign;
pub const cos = SDL_cos;
pub const exp = SDL_exp;
pub const fabs = SDL_fabs;
pub const floor = SDL_floor;
pub const fmod = SDL_fmod;
pub const log = SDL_log;
pub const log10 = SDL_log10;
pub const modf = SDL_modf;
pub const pow = SDL_pow;
pub const round = SDL_round;
pub const sin = SDL_sin;
pub const sqrt = SDL_sqrt;
pub const tan = SDL_tan;
pub const trunc = SDL_trunc;
pub const acosf = SDL_acosf;
pub const asinf = SDL_asinf;
pub const atanf = SDL_atanf;
pub const atan2f = SDL_atan2f;
pub const ceilf = SDL_ceilf;
pub const copysignf = SDL_copysignf;
pub const cosf = SDL_cosf;
pub const expf = SDL_expf;
pub const fabsf = SDL_fabsf;
pub const floorf = SDL_floorf;
pub const fmodf = SDL_fmodf;
pub const logf = SDL_logf;
pub const log10f = SDL_log10f;
pub const modff = SDL_modff;
pub const powf = SDL_powf;
pub const roundf = SDL_roundf;
pub const sinf = SDL_sinf;
pub const sqrtf = SDL_sqrtf;
pub const tanf = SDL_tanf;
pub const truncf = SDL_truncf;
pub const getEnvironment = SDL_GetEnvironment;
pub const createEnvironment = SDL_CreateEnvironment;
pub const destroyEnvironment = SDL_DestroyEnvironment;
pub const getEnvironmentVariable = SDL_GetEnvironmentVariable;
pub const getEnvironmentVariables = SDL_GetEnvironmentVariables;
pub const setEnvironmentVariable = SDL_SetEnvironmentVariable;
pub const unsetEnvironmentVariable = SDL_UnsetEnvironmentVariable;
