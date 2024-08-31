module VC

  class Vec2
    attr_reader :x1, :x2

    def initialize(x1, x2)
      @x1 = x1 + 0.0
      @x2 = x2 + 0.0
    end

    def ==(b)
      return true if @x1 == b.x1 and @x2 == b.x2
      false
    end

    def +(b)
      new_x1 = @x1 + b.x1
      new_x2 = @x2 + b.x2
      Vec2.new(new_x1, new_x2)
    end

    def -(b)
      new_x1 = @x1 - b.x1
      new_x2 = @x2 - b.x2
      Vec2.new(new_x1, new_x2)
    end

    def multiply(scalar)
      new_x1 = @x1 * scalar
      new_x2 = @x2 * scalar
      Vec2.new(new_x1, new_x2)
    end

    def self.from_points(p1, p2)
      new_x1 = p2.x1 - p1.x1
      new_x2 = p2.x2 - p1.x2
      Vec2.new(new_x1, new_x2)
    end

    def self.unit(direction)
      return Vec2.new(1, 0) if direction == :i
      return Vec2.new(0, 1) if direction == :j
    end

    def dot_product(b)
      @x1 * b.x1 + @x2 * b.x2
    end

    def norm
      Math.sqrt(@x1 * @x1 + @x2 * @x2)
    end

    def is_orthogonal_with(b)
      return  true if self.dot_product(b) == 0.0
      false
    end

    def self.angle(a, b)
      Math.acos(a.dot_product(b) / (a.norm * b.norm))
    end

    def project_on(b)
      scale = self.dot_product(b) / b.dot_product(b)
      b.multiply(scale)
    end
  end

  class Vec3
    attr_reader :x1, :x2, :x3

    def initialize(x1, x2, x3)
      @x1 = x1 + 0.0
      @x2 = x2 + 0.0
      @x3 = x3 + 0.0
    end

    def ==(b)
      return true if @x1 == b.x1 and @x2 == b.x2 and @x3 == b.x3
      false
    end

    def +(b)
      new_x1 = @x1 + b.x1
      new_x2 = @x2 + b.x2
      new_x3 = @x3 + b.x3
      Vec3.new(new_x1, new_x2, new_x3)
    end

    def -(b)
      new_x1 = @x1 - b.x1
      new_x2 = @x2 - b.x2
      new_x3 = @x3 - b.x3
      Vec3.new(new_x1, new_x2, new_x3)
    end

    def multiply(scalar)
      new_x1 = @x1 * scalar
      new_x2 = @x2 * scalar
      new_x3 = @x3 * scalar
      Vec3.new(new_x1, new_x2, new_x3)
    end

    def self.from_points(p1, p2)
      new_x1 = p2.x1 - p1.x1
      new_x2 = p2.x2 - p1.x2
      new_x3 = p2.x3 - p1.x3
      Vec3.new(new_x1, new_x2, new_x3)
    end

    def self.unit(direction)
      return Vec3.new(1, 0, 0) if direction == :i
      return Vec3.new(0, 1, 0) if direction == :j
      return Vec3.new(0, 0, 1) if direction == :k
    end

    def dot_product(b)
      @x1 * b.x1 + @x2 * b.x2 + @x3 * b.x3
    end

    def norm
      Math.sqrt(@x1 * @x1 + @x2 * @x2 + @x3 * @x3)
    end

    def is_orthogonal_with(b)
      return true if self.dot_product(b) == 0.0
      false
    end

    def self.angle(a, b)
      Math.acos(a.dot_product(b) / (a.norm * b.norm))
    end

    def project_on(b)
      scale = self.dot_product(b) / b.dot_product(b)
      b.multiply(scale)
    end

    def cross_product(b)
      new_x1 = @x2 * b.x3 - @x3 * b.x2
      new_x2 = @x3 * b.x1 - @x1 * b.x3
      new_x3 = @x1 * b.x2 - @x2 * b.x1
      Vec3.new(new_x1, new_x2, new_x3)
    end

    def self.area_of_triangle(a, b, c)
      ab = Vec3.from_points(a, b)
      ac = Vec3.from_points(a, c)
      ab.cross_product(ac).norm / 2
    end

    def self.volume_of_parallelepiped(a, b, c)
      a.cross_product(b).dot_product(c).abs
    end

    def self.torque(r, f, theta)
      r.norm * f.norm * Math.sin(theta)
    end

  end

  class ParametricLine
    def initialize(point, line_vec3)
      @point = point
      @line_vec3 = line_vec3
    end
  end

  class Cycloid
    def initialize(radius)
      @radius = radius
    end

    def get_vec2(time)
      Vec2.new(time - Math.sin(time), 1 - Math.cos(time)).multiply(@radius)
    end
  end

end