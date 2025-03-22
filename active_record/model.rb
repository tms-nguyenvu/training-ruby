class Model 
  def self.attribute(name)
    define_method(name) do
      @attributes[name]
    end

    define_method("#{name}=") do |value|
      @attributes[name] = value
    end
  end

  def initialize
    @attributes = {}
  end
end

class User < Model
  attribute :id
  attribute :name
end


user = User.new
user.id = 101
user.name = "Alice"

puts user.id  
puts user.name