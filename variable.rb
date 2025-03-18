# [a-z] or _ : local variable
# ${var} : global variable
# @{var} : instance variable
# @@{var} : class variable
# [A-Z] : constant variable

# Local Variable
def hello 
  hello = "Hello world"
  puts hello
end
hello

# Global Variable
class Hello
  $hello = "Hello world"
  puts "#{$hello} inside class"
end

puts "#{$hello} outside class"

# Instance Variable
class HelloWorld
  def initialize n
    @hello = n
  end
  
  def say_hello
    puts "#{@hello} hello world"
  end
end

hello = HelloWorld.new("Vu")
hello.say_hello

# Class Variable
class Hello
  @@hello = "Hello world"
  puts "#{@@hello} inside class"
end

# Constant Variable
PI = 3.14
puts PI