const std = @import("std");

const print = std.debug.print;

const vec = @import("vec.zig");

pub fn main() !void {
    const vec1 = vec.Vector(1, 2, 3);

    print("x: {}, y: {}, z: {}\n", .{ vec1.x, vec1.y, vec1.z });
}
