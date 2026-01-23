// SDL3 Endian Bindings
// Byte order conversion

// Endian macros (implemented as functions)
pub inline fn SDL_Swap16(x: u16) u16 {
    return @byteSwap(x);
}

pub inline fn SDL_Swap32(x: u32) u32 {
    return @byteSwap(x);
}

pub inline fn SDL_Swap64(x: u64) u64 {
    return @byteSwap(x);
}

pub inline fn SDL_SwapFloat(x: f32) f32 {
    const swapped = SDL_Swap32(@as(u32, @bitCast(x)));
    return @as(f32, @bitCast(swapped));
}

// Endian detection
pub const SDL_BYTEORDER = if (@import("builtin").target.cpu.arch.endian() == .little) 1234 else 4321;
pub const SDL_LIL_ENDIAN = 1234;
pub const SDL_BIG_ENDIAN = 4321;
