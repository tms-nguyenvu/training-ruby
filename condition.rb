# If condition
a = 4
b = 2
if a > b
    puts "#{a} lớn hơn #{b}"
end

# If else
a = 1
b = 2
if a > b
    puts "#{a} lớn hơn #{b}"
else
    puts "#{a} nhỏ hơn #{b}"
end

# If elsif
num = 8
if num == 3
  puts "Number is 3"
elsif num == 10
  puts "Number is 10"
elsif num == 7
  puts "Number is 7"
else
  puts "Not found"
end

# Unless
a = 42
unless a < 10
 puts "Yes"
else
 puts "No"
end

# Case with

dow = 2
case dow
when 0
  puts "Chủ nhật"
when 1
  puts "Thứ Hai"
when 2
  puts "Thứ Ba"
end

dow = 3
case dow
when 0,7
  puts "Ngày nghỉ"
when 1,2,3,4,6
  puts "Ngày làm việc"
end

dow = 5
case dow
when 0,7
  puts "Ngày nghỉ"
when 1
  puts "Học PHP"
when 2,3
    puts "Học Ruby"
else
    puts "Học Linux"
end
