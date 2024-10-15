pub const Color = struct {
    red: f32,
    green: f32,
    blue: f32,

    pub fn New(red: f32, green: f32, blue: f32) Color {
        return Color{
            .red = red,
            .green = green,
            .blue = blue,
        };
    }

    pub fn Add(self: Color, other: Color) Color {
        return Color{
            .red = self.red + other.red,
            .green = self.green + other.green,
            .blue = self.blue + other.blue,
        };
    }

    pub fn Sub(self: Color, other: Color) Color {
        return Color{
            .red = self.red - other.red,
            .green = self.green - other.green,
            .blue = self.blue - other.blue,
        };
    }

    pub fn Scale(self: Color, scalar: f64) Color {
        return Color{
            .red = self.red * scalar,
            .green = self.green * scalar,
            .blue = self.blue * scalar,
        };
    }

    pub fn Blend(self: Color, other: Color) Color {
        return Color{
            .red = self.red * other.red,
            .green = self.green * other.green,
            .blue = self.blue * other.blue,
        };
    }
};
