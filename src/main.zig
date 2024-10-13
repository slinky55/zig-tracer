const std = @import("std");

const print = std.debug.print;

const Vector = @import("./vec.zig").Vector;
const Vec4 = @import("./vec.zig").Vec4;

pub fn main() !void {
    const vec = Vector(1, 2, 3);
    const actual = vec.Mag();
    const expected = std.math.sqrt(14);

    print("magnitude: {}\n", .{actual});
    print("expected: {}\n", .{expected});
}
