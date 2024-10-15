const std = @import("std");

const print = std.debug.print;

const Canvas = @import("canvas.zig").Canvas;
const Color = @import("color.zig").Color;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const gpalloc = gpa.allocator();

    var arena = std.heap.ArenaAllocator.init(gpalloc);
    defer arena.deinit();

    const allocator = arena.allocator();

    const canvas = Canvas.New(100, 100, allocator);

    print("canvas created: width {}, height {}", .{ canvas.width, canvas.height });
}
