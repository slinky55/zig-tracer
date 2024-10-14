const math = @import("std").math;
const expect = @import("std").testing.expect;

pub const Vec4 = packed struct {
    x: f64,
    y: f64,
    z: f64,
    w: f64,

    pub fn Add(self: Vec4, other: Vec4) Vec4 {
        return Vec4{
            .x = self.x + other.x,
            .y = self.y + other.y,
            .z = self.z + other.z,
            .w = self.w + other.w,
        };
    }

    pub fn Sub(self: Vec4, other: Vec4) Vec4 {
        return Vec4{
            .x = self.x - other.x,
            .y = self.y - other.y,
            .z = self.z - other.z,
            .w = self.w - other.w,
        };
    }

    pub fn Neg(self: Vec4) Vec4 {
        return Vec4{
            .x = -self.x,
            .y = -self.y,
            .z = -self.z,
            .w = -self.w,
        };
    }

    pub fn Scale(self: Vec4, scalar: f64) Vec4 {
        return Vec4{
            .x = self.x * scalar,
            .y = self.y * scalar,
            .z = self.z * scalar,
            .w = self.w * scalar,
        };
    }

    pub fn Mag(self: Vec4) f64 {
        const sqrs = (self.x * self.x) + (self.y * self.y) + (self.z * self.z) + (self.w + self.w);
        return math.sqrt(sqrs);
    }

    pub fn Normal(self: Vec4) Vec4 {
        const mag = self.Mag();

        return Vec4{
            .x = self.x / mag,
            .y = self.y / mag,
            .z = self.z / mag,
            .w = self.w / mag,
        };
    }

    pub fn Dot(self: Vec4, other: Vec4) f64 {
        return (self.x * other.x) +
            (self.y * other.y) +
            (self.z * other.z) +
            (self.w * other.w);
    }

    pub fn Cross(self: Vec4, other: Vec4) Vec4 {
        return Vector((self.y * other.z) - (self.z * other.y), (self.z * other.x) - (self.x * other.z), (self.x * other.y) - (self.y * other.x));
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

fn VectorEquals(a: Vec4, b: Vec4) bool {
    return (a.x == b.x) and (a.y == b.y) and (a.z == b.z) and (a.w == b.w);
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
    const vec1 = Vector(1, 2, 3);
    const vec2 = Vector(1, 2, 3);

    const expected = Vector(2, 4, 6);
    const actual = vec1.Add(vec2);

    try expect(VectorEquals(expected, actual));
}

test "Vec4 Subtraction" {
    const vec1 = Vector(2, 4, 6);
    const vec2 = Vector(1, 2, 3);

    const expected = Vector(1, 2, 3);
    const actual = vec1.Sub(vec2);

    try expect(VectorEquals(expected, actual));
}

test "Vec4 Scaling" {
    const vec1 = Vector(1, 2, 3);
    const scalar1 = 2;

    const expected1 = Vector(2, 4, 6);
    const actual1 = vec1.Scale(scalar1);

    try expect(VectorEquals(expected1, actual1));

    const vec2 = Vector(2, 4, 6);
    const scalar2 = 0.5;

    const expected2 = Vector(1, 2, 3);
    const actual2 = vec2.Scale(scalar2);

    try expect(VectorEquals(expected2, actual2));
}

test "Vec4 Negation" {
    const vec = Vector(1, 2, 3);
    const expected = Vector(-1, -2, -3);
    const actual = vec.Neg();

    try expect(VectorEquals(expected, actual));
}

test "Vec4 Magnitude" {
    const vec = Vector(1, 2, 3);
    const expected = math.sqrt(14.0);
    const actual = vec.Mag();

    try expect(expected == actual);
}

test "Vec4 Dot Product" {
    const vec1 = Vector(1, 2, 3);
    const vec2 = Vector(4, 5, 6);

    const expected = 32.0;
    const actual = vec1.Dot(vec2);

    try expect(expected == actual);
}

test "Vector Cross Product" {
    const vec1 = Vector(1, 2, 3);
    const vec2 = Vector(4, 5, 6);

    const expected = Vector(-3, 6, -3);
    const actual = vec1.Cross(vec2);

    try expect(VectorEquals(expected, actual));
}
