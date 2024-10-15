const std = @import("std");

const print = std.debug.print;

const Canvas = @import("canvas.zig").Canvas;
const Color = @import("color.zig").Color;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};

    var arena = std.heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();

    const allocator = arena.allocator();

    const canvas = Canvas.New(100, 100, allocator);

    print("{}", .{canvas.width});
}
