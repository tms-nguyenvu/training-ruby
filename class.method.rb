# Check the data type of a variable using class method
num=10
puts "Data type of 'num': #{num.class}"

string="Hello"
puts "Data type of 'string': #{string.class}"

array=[1,2,3]
puts "Data type of 'array': #{array.class}"

# Check the data type of a variable using instance method
puts "Is 'num' an Integer? #{num.is_a?(Integer)}"
puts "Is 'string' a String? #{string.is_a?(String)}"
puts "Is 'array' an Array? #{array.is_a?(Array)}"

# Check the data type of a variable using 'kind_of?' method
puts "Is 'num' an Integer? #{num.kind_of?(Integer)}"
puts "Is 'string' a String? #{string.kind_of?(String)}"
puts "Is 'array' an Array? #{array.kind_of?(Array)}"