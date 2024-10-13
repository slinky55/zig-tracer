const fmax = @import("./math.zig").fmax;
const math = @import("std").math;

const expect = @import("std").testing.expect;

pub const Vec4 = struct {
    x: f64, y: f64, z: f64, w: f64,

    pub fn Add(_other: Vec4) Vec4 {
        const self = @This();
        return Vec4{
            .x = self.x + _other.x,
            .y = self.y + _other.y,
            .z = self.z + _other.z,
            .w = self.w + _other.w,
        };
    }

    pub fn Sub(_other: Vec4) Vec4 {
        const self = @This();
        return Vec4{
            .x = self.x - _other.x,
            .y = self.y - _other.y,
            .z = self.z - _other.z,
            .w = self.w - _other.w,
        };
    }

    pub fn Neg() Vec4 {
        const self = @This();
        return Vec4{
            .x = -self.x,
            .y = -self.y,
            .z = -self.z,
            .w = -self.w,
        };
    }

    pub fn Scale(_scalar: f64) Vec4 {
        const self = @This();
        return Vec4 {
            .x = self.x * _scalar,
            .y = self.y * _scalar,
            .z = self.z * _scalar,
            .w = self.w * _scalar,
        };
    }

    pub fn Mag() f64 {
        const self = @This();
        const sqrs = (self.x * self.x) + (self.y * self.y) + (self.z * self.z) + (self.w + self.w);
        return math.sqrt(sqrs);
    }

    pub fn Normal() Vec4 {
        const self = @This();
        const mag = self.Mag();

        return Vec4 {
            .x = self.x / mag,
            .y = self.y / mag,
            .z = self.z / mag,
            .w = self.w / mag,
        };
    }


};

pub fn Point(x: f64, y: f64, z: f64) Vec4 {
    return Vec4{
        .x = x,
        .y = y,
        .z = z,
        .w = 1,
    };
}

pub fn Vector(x: f64, y: f64, z: f64) Vec4 {
    return Vec4{
        .x = x,
        .y = y,
        .z = z,
        .w = 0,
    };
}


test "Point Creation" {
    const x = 1;
    const y = 2;
    const z = 3;

    const value = Point(x, y, z);

    try expect(value.w == 1);
}

test "Vector Creation" {
    const x = 1;
    const y = 2;
    const z = 3;

    const value = Vector(x, y, z);

    try expect(value.w == 0);
}


test "Vec4 Addition" {
    const vec1 = Vec4{
        .x = 1,
        .y = 2,
        .z = 3,
        .w = 1,
    };

    const vec2 = Vec4{
        .x = 1,
        .y = 2,
        .z = 3,
        .w = 1,
    };

    const expected = Vec4{
        .x = 2,
        .y = 4,
        .z = 6,
        .w = 1,
    };

    const actual = vec1.Add(vec2);

    try expect(expected.x == actual.x);
    try expect(expected.y == actual.y);
    try expect(expected.z == actual.z);
    try expect(expected.w == actual.w);
}