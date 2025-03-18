# While
i = 0
sum = 0

while i < 20 
  sum += i
  i += 1
end
puts sum

# Until
a = 0 
until a > 10
  puts "a = #{a}"
  a += 2
end

# For
for i in 1..50
  break if i > 30
  puts i
end

# Next
for i in 0..10
  next if i % 2 == 0
  puts i
end

# Do
x = 0
loop do
  puts x
  x += 1
  break if x > 10
end