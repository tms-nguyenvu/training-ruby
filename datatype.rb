# Number data types
distance = 0.1
time =  9.87 / 3600
speed = distance / time
puts "Speed: #{speed} m/s"

# Boolean data types
if true 
   puts "It is True!"
else
   puts "It is False!"
end

if nil
   puts "nil is True!"
else
   puts "nil is False!"
end

if 0
   puts "0 is True!"
else
   puts "0 is False!"
end

# String data types
puts "String Data Type";
puts 'escape using "\\"';
puts 'That\'s right';

# Hash data types
hsh = colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
hsh.each do |key, value|
   print key, " is ", value, "\n"
end

person = { name: "Alice", age: 25 }
person[:city] = "New York"  # add new key
person[:age] = 26           # update existing key
person.delete(:age) # delete key
puts person  
puts person.key?(:name)  # => true
puts person.key?(:email) # => false
puts person.fetch(:email, "Not found")  # => "Not found"
hash1 = { a: 1, b: 2 }
hash2 = { b: 3, c: 4 }
merged = hash1.merge(hash2)
puts merged  # => {:a=>1, :b=>3, :c=>4}
person = {
  name: "Alice",
  address: { city: "New York", zip: "10001" }
}

puts person[:address][:city]  # => "New York"


# Array data types
array = ["fred", 10, 3.14, "hello", ]
array.each do |element|
   puts element
end

# Symbol data types
domain = { :sk => "sk", :pk => "pk" }
puts domain[:sk]
puts domain[:pk]




