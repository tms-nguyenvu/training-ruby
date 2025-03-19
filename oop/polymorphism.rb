class Shape 
  def area
    raise NotImplementedError, "Subclasses must implement this method"
  end
end

class Rectangle < Shape
  def initialize(width, height)
    @width = width
    @height = height
  end
  def area
    @width * @height
  end
end

class Circle < Shape
  def initialize(radius)
    @radius = radius
  end
  
  def area
    @radius * @radius * Math::PI
  end
end

rect = Rectangle.new(10, 20)
circle = Circle.new(5)

puts "Rectangle area: #{rect.area}"
puts "Circle area: #{circle.area}"