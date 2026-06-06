// SDL3 Stdinc Bindings
// Standard includes: memory, string, math helpers

const core = @import("core.zig");
const dynamic = @import("dynamic.zig");

// Import types
pub const Sint64 = core.Sint64;
pub const Uint64 = core.Uint64;

pub const wchar_t = if (@import("builtin").os.tag == .windows) u16 else u32;

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

// Memory functions
pub const PFN_SDL_malloc = *const fn (size: usize) callconv(.c) ?*anyopaque;
pub const PFN_SDL_calloc = *const fn (nmemb: usize, size: usize) callconv(.c) ?*anyopaque;
pub const PFN_SDL_realloc = *const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const PFN_SDL_free = *const fn (mem: ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_aligned_alloc = *const fn (alignment: usize, size: usize) callconv(.c) ?*anyopaque;
pub const PFN_SDL_aligned_free = *const fn (mem: ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_memset4 = *const fn (dst: ?*anyopaque, val: c_int, dwords: usize) callconv(.c) ?*anyopaque;

// Additional string functions
pub const PFN_SDL_strcmp = *const fn (str1: ?[*:0]const u8, str2: ?[*:0]const u8) callconv(.c) c_int;
pub const PFN_SDL_strncmp = *const fn (str1: ?[*:0]const u8, str2: ?[*:0]const u8, maxlen: usize) callconv(.c) c_int;
pub const PFN_SDL_strcasecmp = *const fn (str1: ?[*:0]const u8, str2: ?[*:0]const u8) callconv(.c) c_int;
pub const PFN_SDL_strncasecmp = *const fn (str1: ?[*:0]const u8, str2: ?[*:0]const u8, maxlen: usize) callconv(.c) c_int;
pub const PFN_SDL_strndup = *const fn (str: ?[*:0]const u8, maxlen: usize) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_strnlen = *const fn (str: ?[*:0]const u8, maxlen: usize) callconv(.c) usize;
pub const PFN_SDL_strnstr = *const fn (haystack: ?[*:0]const u8, needle: ?[*:0]const u8, maxlen: usize) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_strpbrk = *const fn (str: ?[*:0]const u8, accept: ?[*:0]const u8) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_strtok_r = *const fn (str: ?[*:0]u8, delim: ?[*:0]const u8, saveptr: ?*?[*:0]u8) callconv(.c) ?[*:0]u8;
pub const PFN_SDL_vsnprintf = *const fn (dst: ?[*:0]u8, maxlen: usize, fmt: ?[*:0]const u8, ap: ?*anyopaque) callconv(.c) c_int;
pub const PFN_SDL_vasprintf = *const fn (dst: ?*?[*:0]u8, fmt: ?[*:0]const u8, ap: ?*anyopaque) callconv(.c) c_int;
pub const PFN_SDL_vsscanf = *const fn (text: ?[*:0]const u8, fmt: ?[*:0]const u8, ap: ?*anyopaque) callconv(.c) c_int;
pub const PFN_SDL_vswprintf = *const fn (dst: ?[*:0]wchar_t, maxlen: usize, fmt: ?[*:0]const wchar_t, ap: ?*anyopaque) callconv(.c) c_int;

// Wide string functions
pub const PFN_SDL_wcslen = *const fn (str: ?[*:0]const wchar_t) callconv(.c) usize;
pub const PFN_SDL_wcsdup = *const fn (str: ?[*:0]const wchar_t) callconv(.c) ?[*:0]wchar_t;
pub const PFN_SDL_wcslcat = *const fn (dst: ?[*:0]wchar_t, src: ?[*:0]const wchar_t, maxlen: usize) callconv(.c) usize;
pub const PFN_SDL_wcslcpy = *const fn (dst: ?[*:0]wchar_t, src: ?[*:0]const wchar_t, maxlen: usize) callconv(.c) usize;
pub const PFN_SDL_wcscmp = *const fn (str1: ?[*:0]const wchar_t, str2: ?[*:0]const wchar_t) callconv(.c) c_int;
pub const PFN_SDL_wcsncmp = *const fn (str1: ?[*:0]const wchar_t, str2: ?[*:0]const wchar_t, maxlen: usize) callconv(.c) c_int;
pub const PFN_SDL_wcscasecmp = *const fn (str1: ?[*:0]const wchar_t, str2: ?[*:0]const wchar_t) callconv(.c) c_int;
pub const PFN_SDL_wcsncasecmp = *const fn (str1: ?[*:0]const wchar_t, str2: ?[*:0]const wchar_t, maxlen: usize) callconv(.c) c_int;
pub const PFN_SDL_wcsnlen = *const fn (str: ?[*:0]const wchar_t, maxlen: usize) callconv(.c) usize;
pub const PFN_SDL_wcsnstr = *const fn (haystack: ?[*:0]const wchar_t, needle: ?[*:0]const wchar_t, maxlen: usize) callconv(.c) ?[*:0]wchar_t;
pub const PFN_SDL_wcsstr = *const fn (haystack: ?[*:0]const wchar_t, needle: ?[*:0]const wchar_t) callconv(.c) ?[*:0]wchar_t;
pub const PFN_SDL_wcstol = *const fn (str: ?[*:0]const wchar_t, endp: ?*?[*:0]wchar_t, base: c_int) callconv(.c) c_long;

// Math functions (double)
pub const PFN_SDL_acos = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_asin = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_atan = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_atan2 = *const fn (y: f64, x: f64) callconv(.c) f64;
pub const PFN_SDL_ceil = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_copysign = *const fn (x: f64, y: f64) callconv(.c) f64;
pub const PFN_SDL_cos = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_exp = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_fabs = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_floor = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_fmod = *const fn (x: f64, y: f64) callconv(.c) f64;
pub const PFN_SDL_log = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_log10 = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_lround = *const fn (x: f64) callconv(.c) c_long;
pub const PFN_SDL_modf = *const fn (x: f64, iptr: ?*f64) callconv(.c) f64;
pub const PFN_SDL_pow = *const fn (x: f64, y: f64) callconv(.c) f64;
pub const PFN_SDL_round = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_scalbn = *const fn (x: f64, n: c_int) callconv(.c) f64;
pub const PFN_SDL_sin = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_sqrt = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_tan = *const fn (x: f64) callconv(.c) f64;
pub const PFN_SDL_trunc = *const fn (x: f64) callconv(.c) f64;

// Math functions (float)
pub const PFN_SDL_acosf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_asinf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_atanf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_atan2f = *const fn (y: f32, x: f32) callconv(.c) f32;
pub const PFN_SDL_ceilf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_copysignf = *const fn (x: f32, y: f32) callconv(.c) f32;
pub const PFN_SDL_cosf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_expf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_fabsf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_floorf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_fmodf = *const fn (x: f32, y: f32) callconv(.c) f32;
pub const PFN_SDL_logf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_log10f = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_lroundf = *const fn (x: f32) callconv(.c) c_long;
pub const PFN_SDL_modff = *const fn (x: f32, iptr: ?*f32) callconv(.c) f32;
pub const PFN_SDL_powf = *const fn (x: f32, y: f32) callconv(.c) f32;
pub const PFN_SDL_roundf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_scalbnf = *const fn (x: f32, n: c_int) callconv(.c) f32;
pub const PFN_SDL_sinf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_sqrtf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_tanf = *const fn (x: f32) callconv(.c) f32;
pub const PFN_SDL_truncf = *const fn (x: f32) callconv(.c) f32;

// Float classification
pub const PFN_SDL_isinf = *const fn (x: f64) callconv(.c) c_int;
pub const PFN_SDL_isinff = *const fn (x: f32) callconv(.c) c_int;
pub const PFN_SDL_isnan = *const fn (x: f64) callconv(.c) c_int;
pub const PFN_SDL_isnanf = *const fn (x: f32) callconv(.c) c_int;

// Random functions
pub const PFN_SDL_rand = *const fn () callconv(.c) Uint64;
pub const PFN_SDL_srand = *const fn (seed: Uint64) callconv(.c) void;
pub const PFN_SDL_rand_r = *const fn (state: ?*Uint64) callconv(.c) Uint64;
pub const PFN_SDL_rand_bits = *const fn () callconv(.c) core.Uint32;
pub const PFN_SDL_rand_bits_r = *const fn (state: ?*Uint64) callconv(.c) core.Uint32;
pub const PFN_SDL_randf = *const fn () callconv(.c) f32;
pub const PFN_SDL_randf_r = *const fn (state: ?*Uint64) callconv(.c) f32;

// Environment functions
pub const PFN_SDL_getenv = *const fn (name: ?[*:0]const u8) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_getenv_unsafe = *const fn (name: ?[*:0]const u8) callconv(.c) ?[*:0]const u8;
pub const PFN_SDL_setenv_unsafe = *const fn (name: ?[*:0]const u8, value: ?[*:0]const u8, overwrite: bool) callconv(.c) bool;
pub const PFN_SDL_unsetenv_unsafe = *const fn (name: ?[*:0]const u8) callconv(.c) bool;

// Sort functions
pub const PFN_SDL_qsort = *const fn (base: ?*anyopaque, nmemb: usize, size: usize, compare: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int) callconv(.c) void;
pub const PFN_SDL_qsort_r = *const fn (base: ?*anyopaque, nmemb: usize, size: usize, compare: ?*const fn (?*const anyopaque, ?*const anyopaque, ?*anyopaque) callconv(.c) c_int, userdata: ?*anyopaque) callconv(.c) void;
pub const PFN_SDL_bsearch = *const fn (key: ?*const anyopaque, base: ?*const anyopaque, nmemb: usize, size: usize, compare: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int) callconv(.c) ?*anyopaque;
pub const PFN_SDL_bsearch_r = *const fn (key: ?*const anyopaque, base: ?*const anyopaque, nmemb: usize, size: usize, compare: ?*const fn (?*const anyopaque, ?*const anyopaque, ?*anyopaque) callconv(.c) c_int, userdata: ?*anyopaque) callconv(.c) ?*anyopaque;

// Iconv functions
pub const PFN_SDL_iconv_open = *const fn (tocode: ?[*:0]const u8, fromcode: ?[*:0]const u8) callconv(.c) ?*anyopaque;
pub const PFN_SDL_iconv_close = *const fn (cd: ?*anyopaque) callconv(.c) c_int;
pub const PFN_SDL_iconv = *const fn (cd: ?*anyopaque, inbuf: ?*?[*]const u8, inbytesleft: ?*usize, outbuf: ?*?[*]u8, outbytesleft: ?*usize) callconv(.c) usize;
pub const PFN_SDL_iconv_string = *const fn (tocode: ?[*:0]const u8, fromcode: ?[*:0]const u8, inbuf: ?[*]const u8, inbytesleft: usize) callconv(.c) ?[*:0]u8;

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
    strtokr: ?PFN_SDL_strtokr,
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
    min: ?PFN_SDL_min,
    max: ?PFN_SDL_max,
    clamp: ?PFN_SDL_clamp,
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
    malloc: ?PFN_SDL_malloc,
    calloc: ?PFN_SDL_calloc,
    realloc: ?PFN_SDL_realloc,
    free: ?PFN_SDL_free,
    aligned_alloc: ?PFN_SDL_aligned_alloc,
    aligned_free: ?PFN_SDL_aligned_free,
    memset4: ?PFN_SDL_memset4,
    strcmp: ?PFN_SDL_strcmp,
    strncmp: ?PFN_SDL_strncmp,
    strcasecmp: ?PFN_SDL_strcasecmp,
    strncasecmp: ?PFN_SDL_strncasecmp,
    strndup: ?PFN_SDL_strndup,
    strnlen: ?PFN_SDL_strnlen,
    strnstr: ?PFN_SDL_strnstr,
    strpbrk: ?PFN_SDL_strpbrk,
    strtok_r: ?PFN_SDL_strtok_r,
    vsnprintf: ?PFN_SDL_vsnprintf,
    vasprintf: ?PFN_SDL_vasprintf,
    vsscanf: ?PFN_SDL_vsscanf,
    vswprintf: ?PFN_SDL_vswprintf,
    wcslen: ?PFN_SDL_wcslen,
    wcsdup: ?PFN_SDL_wcsdup,
    wcslcat: ?PFN_SDL_wcslcat,
    wcslcpy: ?PFN_SDL_wcslcpy,
    wcscmp: ?PFN_SDL_wcscmp,
    wcsncmp: ?PFN_SDL_wcsncmp,
    wcscasecmp: ?PFN_SDL_wcscasecmp,
    wcsncasecmp: ?PFN_SDL_wcsncasecmp,
    wcsnlen: ?PFN_SDL_wcsnlen,
    wcsnstr: ?PFN_SDL_wcsnstr,
    wcsstr: ?PFN_SDL_wcsstr,
    wcstol: ?PFN_SDL_wcstol,
    acos: ?PFN_SDL_acos,
    asin: ?PFN_SDL_asin,
    atan: ?PFN_SDL_atan,
    atan2: ?PFN_SDL_atan2,
    ceil: ?PFN_SDL_ceil,
    copysign: ?PFN_SDL_copysign,
    cos: ?PFN_SDL_cos,
    exp: ?PFN_SDL_exp,
    fabs: ?PFN_SDL_fabs,
    floor: ?PFN_SDL_floor,
    fmod: ?PFN_SDL_fmod,
    log: ?PFN_SDL_log,
    log10: ?PFN_SDL_log10,
    lround: ?PFN_SDL_lround,
    modf: ?PFN_SDL_modf,
    pow: ?PFN_SDL_pow,
    round: ?PFN_SDL_round,
    scalbn: ?PFN_SDL_scalbn,
    sin: ?PFN_SDL_sin,
    sqrt: ?PFN_SDL_sqrt,
    tan: ?PFN_SDL_tan,
    trunc: ?PFN_SDL_trunc,
    acosf: ?PFN_SDL_acosf,
    asinf: ?PFN_SDL_asinf,
    atanf: ?PFN_SDL_atanf,
    atan2f: ?PFN_SDL_atan2f,
    ceilf: ?PFN_SDL_ceilf,
    copysignf: ?PFN_SDL_copysignf,
    cosf: ?PFN_SDL_cosf,
    expf: ?PFN_SDL_expf,
    fabsf: ?PFN_SDL_fabsf,
    floorf: ?PFN_SDL_floorf,
    fmodf: ?PFN_SDL_fmodf,
    logf: ?PFN_SDL_logf,
    log10f: ?PFN_SDL_log10f,
    lroundf: ?PFN_SDL_lroundf,
    modff: ?PFN_SDL_modff,
    powf: ?PFN_SDL_powf,
    roundf: ?PFN_SDL_roundf,
    scalbnf: ?PFN_SDL_scalbnf,
    sinf: ?PFN_SDL_sinf,
    sqrtf: ?PFN_SDL_sqrtf,
    tanf: ?PFN_SDL_tanf,
    truncf: ?PFN_SDL_truncf,
    isinf: ?PFN_SDL_isinf,
    isinff: ?PFN_SDL_isinff,
    isnan: ?PFN_SDL_isnan,
    isnanf: ?PFN_SDL_isnanf,
    rand: ?PFN_SDL_rand,
    srand: ?PFN_SDL_srand,
    rand_r: ?PFN_SDL_rand_r,
    rand_bits: ?PFN_SDL_rand_bits,
    rand_bits_r: ?PFN_SDL_rand_bits_r,
    randf: ?PFN_SDL_randf,
    randf_r: ?PFN_SDL_randf_r,
    getenv: ?PFN_SDL_getenv,
    getenv_unsafe: ?PFN_SDL_getenv_unsafe,
    setenv_unsafe: ?PFN_SDL_setenv_unsafe,
    unsetenv_unsafe: ?PFN_SDL_unsetenv_unsafe,
    qsort: ?PFN_SDL_qsort,
    qsort_r: ?PFN_SDL_qsort_r,
    bsearch: ?PFN_SDL_bsearch,
    bsearch_r: ?PFN_SDL_bsearch_r,
    iconv_open: ?PFN_SDL_iconv_open,
    iconv_close: ?PFN_SDL_iconv_close,
    iconv: ?PFN_SDL_iconv,
    iconv_string: ?PFN_SDL_iconv_string,

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
            .{ "malloc", "SDL_malloc" },
            .{ "calloc", "SDL_calloc" },
            .{ "realloc", "SDL_realloc" },
            .{ "free", "SDL_free" },
            .{ "aligned_alloc", "SDL_aligned_alloc" },
            .{ "aligned_free", "SDL_aligned_free" },
            .{ "memset4", "SDL_memset4" },
            .{ "strcmp", "SDL_strcmp" },
            .{ "strncmp", "SDL_strncmp" },
            .{ "strcasecmp", "SDL_strcasecmp" },
            .{ "strncasecmp", "SDL_strncasecmp" },
            .{ "strndup", "SDL_strndup" },
            .{ "strnlen", "SDL_strnlen" },
            .{ "strnstr", "SDL_strnstr" },
            .{ "strpbrk", "SDL_strpbrk" },
            .{ "strtok_r", "SDL_strtok_r" },
            .{ "vsnprintf", "SDL_vsnprintf" },
            .{ "vasprintf", "SDL_vasprintf" },
            .{ "vsscanf", "SDL_vsscanf" },
            .{ "vswprintf", "SDL_vswprintf" },
            .{ "wcslen", "SDL_wcslen" },
            .{ "wcsdup", "SDL_wcsdup" },
            .{ "wcslcat", "SDL_wcslcat" },
            .{ "wcslcpy", "SDL_wcslcpy" },
            .{ "wcscmp", "SDL_wcscmp" },
            .{ "wcsncmp", "SDL_wcsncmp" },
            .{ "wcscasecmp", "SDL_wcscasecmp" },
            .{ "wcsncasecmp", "SDL_wcsncasecmp" },
            .{ "wcsnlen", "SDL_wcsnlen" },
            .{ "wcsnstr", "SDL_wcsnstr" },
            .{ "wcsstr", "SDL_wcsstr" },
            .{ "wcstol", "SDL_wcstol" },
            .{ "acos", "SDL_acos" },
            .{ "asin", "SDL_asin" },
            .{ "atan", "SDL_atan" },
            .{ "atan2", "SDL_atan2" },
            .{ "ceil", "SDL_ceil" },
            .{ "copysign", "SDL_copysign" },
            .{ "cos", "SDL_cos" },
            .{ "exp", "SDL_exp" },
            .{ "fabs", "SDL_fabs" },
            .{ "floor", "SDL_floor" },
            .{ "fmod", "SDL_fmod" },
            .{ "log", "SDL_log" },
            .{ "log10", "SDL_log10" },
            .{ "lround", "SDL_lround" },
            .{ "modf", "SDL_modf" },
            .{ "pow", "SDL_pow" },
            .{ "round", "SDL_round" },
            .{ "scalbn", "SDL_scalbn" },
            .{ "sin", "SDL_sin" },
            .{ "sqrt", "SDL_sqrt" },
            .{ "tan", "SDL_tan" },
            .{ "trunc", "SDL_trunc" },
            .{ "acosf", "SDL_acosf" },
            .{ "asinf", "SDL_asinf" },
            .{ "atanf", "SDL_atanf" },
            .{ "atan2f", "SDL_atan2f" },
            .{ "ceilf", "SDL_ceilf" },
            .{ "copysignf", "SDL_copysignf" },
            .{ "cosf", "SDL_cosf" },
            .{ "expf", "SDL_expf" },
            .{ "fabsf", "SDL_fabsf" },
            .{ "floorf", "SDL_floorf" },
            .{ "fmodf", "SDL_fmodf" },
            .{ "logf", "SDL_logf" },
            .{ "log10f", "SDL_log10f" },
            .{ "lroundf", "SDL_lroundf" },
            .{ "modff", "SDL_modff" },
            .{ "powf", "SDL_powf" },
            .{ "roundf", "SDL_roundf" },
            .{ "scalbnf", "SDL_scalbnf" },
            .{ "sinf", "SDL_sinf" },
            .{ "sqrtf", "SDL_sqrtf" },
            .{ "tanf", "SDL_tanf" },
            .{ "truncf", "SDL_truncf" },
            .{ "isinf", "SDL_isinf" },
            .{ "isinff", "SDL_isinff" },
            .{ "isnan", "SDL_isnan" },
            .{ "isnanf", "SDL_isnanf" },
            .{ "rand", "SDL_rand" },
            .{ "srand", "SDL_srand" },
            .{ "rand_r", "SDL_rand_r" },
            .{ "rand_bits", "SDL_rand_bits" },
            .{ "rand_bits_r", "SDL_rand_bits_r" },
            .{ "randf", "SDL_randf" },
            .{ "randf_r", "SDL_randf_r" },
            .{ "getenv", "SDL_getenv" },
            .{ "getenv_unsafe", "SDL_getenv_unsafe" },
            .{ "setenv_unsafe", "SDL_setenv_unsafe" },
            .{ "unsetenv_unsafe", "SDL_unsetenv_unsafe" },
            .{ "qsort", "SDL_qsort" },
            .{ "qsort_r", "SDL_qsort_r" },
            .{ "bsearch", "SDL_bsearch" },
            .{ "bsearch_r", "SDL_bsearch_r" },
            .{ "iconv_open", "SDL_iconv_open" },
            .{ "iconv_close", "SDL_iconv_close" },
            .{ "iconv", "SDL_iconv" },
            .{ "iconv_string", "SDL_iconv_string" },
        }, &.{ "strtokr", "min", "max", "clamp", "malloc", "calloc", "realloc", "free", "aligned_alloc", "aligned_free", "memset4", "strcmp", "strncmp", "strcasecmp", "strncasecmp", "strndup", "strnlen", "strnstr", "strpbrk", "strtok_r", "vsnprintf", "vasprintf", "vsscanf", "vswprintf", "wcslen", "wcsdup", "wcslcat", "wcslcpy", "wcscmp", "wcsncmp", "wcscasecmp", "wcsncasecmp", "wcsnlen", "wcsnstr", "wcsstr", "wcstol", "acos", "asin", "atan", "atan2", "ceil", "copysign", "cos", "exp", "fabs", "floor", "fmod", "log", "log10", "lround", "modf", "pow", "round", "scalbn", "sin", "sqrt", "tan", "trunc", "acosf", "asinf", "atanf", "atan2f", "ceilf", "copysignf", "cosf", "expf", "fabsf", "floorf", "fmodf", "logf", "log10f", "lroundf", "modff", "powf", "roundf", "scalbnf", "sinf", "sqrtf", "tanf", "truncf", "isinf", "isinff", "isnan", "isnanf", "rand", "srand", "rand_r", "rand_bits", "rand_bits_r", "randf", "randf_r", "getenv", "getenv_unsafe", "setenv_unsafe", "unsetenv_unsafe", "qsort", "qsort_r", "bsearch", "bsearch_r", "iconv_open", "iconv_close", "iconv", "iconv_string" });
    }
};
