class Person
  def initialize
    @attributes = {}
  end
  def self.attribute(name)
    define_method(name) do
      @attributes[name]
    end

    define_method("#{name}=") do |value|
      @attributes[name] = value
    end
  end

end

Person.attribute(:name)
Person.attribute(:age)

# Test
p1 = Person.new
p1.name = "David"
p1.age = 25
puts p1.name  # => "David"
puts p1.age   # => 25