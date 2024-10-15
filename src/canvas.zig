const Allocator = @import("std").mem.Allocator;
const ArrayList = @import("std").ArrayList;

const Color = @import("color.zig").Color;

pub const Canvas = struct {
    width: usize,
    height: usize,
    pixels: []Color,

    pub fn New(width: usize, height: usize, allocator: Allocator) Canvas {
        return Canvas{
            .width = width,
            .height = height,
            .pixels = try allocator.alloc(Color, width * height),
        };
    }

    pub fn WritePixel(self: Canvas, x: usize, y: usize, color: Color) void {
        const idx = y * self.width + x;
        self.pixels[idx] = color;
    }
};
