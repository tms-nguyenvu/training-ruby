module Greeter
  def hello
    puts "Hello"
  end
end

class Person
  include Greeter
end

class Robot
  extend Greeter
end

p = Person.new
p.hello

Robot.hello

# p Person.ancestors
# p Robot.singleton_class.ancestors

# puts p.methods
puts Greeter.methods