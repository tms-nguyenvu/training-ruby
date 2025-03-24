class Vehicle 
  attr_accessor :brand, :year
  
  def initialize(brand, year)
    @brand = brand
    @year = year
  end

  def info 
    "This is a #{@brand} from #{@year}"
  end
end

class Car < Vehicle
  def start_engine
    "The #{@brand} car's engine is starting..."
  end
end

class Motorbike < Vehicle
  def start_engine
    "The #{@brand} motorbike's engine is starting..."
  end
end

car = Car.new("Toyota", 2022)
motorbike = Motorbike.new("Honda", 2021)

puts car.info
puts motorbike.info
puts car.start_engine
puts motorbike.start_engine
