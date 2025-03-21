# class Student
#   def initialize(name, age, score)
#     @name = name
#     @age = age
#     @score = score
#   end

#   def name
#     @name
#   end

#   def age
#     @age
#   end

#   def score
#     @score
#   end

#   def name=(name)
#     @name = name
#   end

#   def age=(age)
#     @age = age
#   end

#   def score=(score)
#     @score = score
#   end

#   def info
#     "Name: #{@name}, Age: #{@age}, Score: #{@score}"
#   end

#   def obtain
#     @score > 5
#   end

# end

# student1 = Student.new("John", 20, 8)
# student2 = Student.new("Jane", 21, 9)

# puts student1.obtain
# puts student1.info

# puts student2.obtain
# puts student2.info


# class Student
#   attr_accessor :name, :age

#   attr_reader :score

#   attr_writer :address
#   def initialize(name, age, score)
#     @name = name
#     @age = age  
#     @score = score
#     @address = "Da Nang"
#   end


#   def info
#     "Name: #{@name}, Age: #{@age}, Score: #{@score}, Address: #{@address}"
#   end
# end


# student = Student.new("John", 20, 8)
# puts student.info



# class Person
#   attr_accessor :name, :age

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

#   def info
#     "Name: #{@name}, Age: #{@age}"
#   end

#   def introduce
#     puts "Hello, my name is #{@name} and I'm #{@age} years old."
#   end
# end

# class Student < Person
#   attr_accessor :score

#   def initialize(name, age, score)
#     super(name, age)
#     @score = score
#   end

#   def introduce
#     puts "#{super}, and I'm a student with a score of #{@score}."
#   end
# end

# person = Person.new("John", 20)
# person.introduce


# student = Student.new("John", 20, 8)
# student.introduce


# module Display
#   def uppercase
#     self.upcase
#   end

#   def lowercase
#     self.downcase
#   end

#   def capitalize
#     self.capitalize
#   end
# end

# class String
#   include Display
# end

# name = "john"
# puts name.uppercase 
# puts name.downcase
# puts name.capitalize
