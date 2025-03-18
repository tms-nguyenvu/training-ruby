# The Arithmetic Operators

# Addition
puts ("Addition:")
puts (10 + 20)

# Subtraction
puts ("Subtraction:")
puts (40 - 20)

# Division
puts ("Division:")
puts (100 / 20)

# Multiplication
puts ("Multiplication:")
puts (10 * 20)

# Modulus
puts ("Modulus:")
puts (20 % 7)

# Exponent
puts ("Exponent:")
puts (2 ** 4)

# Comparison Operators
puts "Equal To Operator:"
puts (10 == 20)
 
puts "Not Equal To Operator:"
puts (40 != 20)
 
puts "Greater than Operator"
puts (100 > 20)
 
puts "Less than Operator"
puts (10  < 20)
 
puts "Less than Equal To Operator"
puts (2  <=  5)

puts "Greater than Equal To Operator"
puts (2  >=  5)
 
puts "Combined combination operator"
puts(20 <=> 20)
puts(10 <=> 20)
puts(20 <=> 10)


# Logical Operators
a = 10
b = 20
c = 30

if a == 10 && b == 20 && c == 30
  puts "Logical And Operator"
  puts result = a * b * c
end

if a == 10 || b == 20 || c == 30
  puts "Logical Or Operator"
  puts result = a + b + c
end

puts "Logical Not Operator"
puts !(a == 10)

# Assignment Operators
# Ruby program to demonstrate 
# the Assignments Operators
 
puts "Simple assignment operator"
puts a = 20

puts "Add AND assignment operator"
puts a += 10

puts "Subtract AND assignment operator"
puts a -= 5

puts "Multiply AND assignment operator"
puts a *= 10

puts "Divide AND assignment operator"
puts a /= 4

puts "Modulus AND assignment operator"
puts a %= 3

puts "Exponent AND assignment operator"
puts a **= 3

# Bitwise Operators
a = 10
b = 20

puts "Bitwise AND operator"
puts (a & b)

puts "Bitwise OR operator"
puts (a | b)

puts "Bitwise XOR operator"
puts (a ^ b)

puts "Bitwise Complement operator"
puts (~a)

puts "Binary right shift operator"
puts (a >> 2)

puts "Binary left shift operator"
puts (a << 2)

# Ternary Operators
puts "Ternary Operator"
puts (a == 10) ? "a is 10" : "a is not 10"

# Range Operators

# Array value separator
$, =", "  

# using .. Operator
range_op = (7 .. 10).to_a

# displaying result
puts "#{range_op}"

# using ... Operator
range_op1 = (7 ... 10).to_a

# displaying result
puts "#{range_op1}"


# Defined? Operator

# Ruby program to demonstrate 
# the defined? Operator

# variables
GFG =  1
Geeks = 70


puts ("define? Operator Results")

# using defined? Operator
# it returns constant
puts defined? GFG        

# it returns constant
puts defined? Geeks 

# it returns nil
puts defined? f
       
# it returns expression
puts defined? 50   


#Dot “.” and Double Colon “::” Operators
CONS = 5   

# define module
module Geeks
    
   CONS = 5
   
   # set global CONS to 7
   ::CONS = 7   
   
    # set local CONS to 10
   CONS = 10    
end

# displaying global CONS value
puts CONS     

# displaying local "Geeks" CONS value
# using :: operator
puts Geeks::CONS   

class Gfg
    def Geeks2
        puts "Dot Operator"
    end
end

# calling Geeks2 module using 
# Dot(.) operator
puts Gfg.new.Geeks2