# Bài 1

# def greet(name)
#   if block_given?
#     yield(name)
#   else
#     puts "Chào mừng, #{name}!"
#   end
  
# end

# greet("Ruby") { |name| puts "Xin chào, #{name}!" }
# greet("Newbie")


# Bài 2

# def greet_proc(name, &proc)
#   proc.call(name)
# end

# hello_proc = proc { |name| puts "Hello, #{name}!" }

# greet_proc("Ruby", &hello_proc)


# Bài 3

# def test_proc(name, age, proc)
#   proc.call(name, age)  
# end

# hello_proc = proc { |name, age| puts "#{name} is #{age} years old." }

# test_proc("Vu", 23, hello_proc) 

# def test_lambda(name, age, lambda_func)
#   lambda_func.call(name, age)  
# end

# hello_lambda = ->(name, age) { puts "#{name} is #{age} years old." }

# test_lambda("Vu", 23, hello_lambda) 


# Bài 4

# apply_discount = proc { |price| price - (price * 0.1) }
# apply_tax = ->(price) { price + (price * 0.08) }

# def final_price(price, discount, tax)
#   price_after_discount = discount.call(price)
#   final_price = tax.call(price_after_discount)

#   puts "Final price after discount and tax: #{final_price.round(2)}"
# end

# final_price(100, apply_discount, apply_tax)

# Bài 5

# even_numbers = proc { |number| number.even? }

# greater_than_five = ->(number) { number > 5 }

# def filter_numbers(numbers, filter)
#   numbers.select { |number| filter.call(number) }  
# end

# numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# puts "Even numbers: #{filter_numbers(numbers, even_numbers)}"

# puts "Numbers greater than 5: #{filter_numbers(numbers, greater_than_five)}"


# Bài 6


calculations = {
  add: ->(a, b) { a + b },
  subtract: ->(a, b) { a - b },
  multiply: ->(a, b) { a * b },
  divide: ->(a, b) { a / b.to_f } 
}

operations = {
  add: "+",
  subtract: "-",
  multiply: "*",
  divide: "/"
}

def calculate(a, b, operation_key, calculations, operations)
  operation = calculations[operation_key]  
  operator = operations[operation_key]     
  result = operation.call(a, b)            

  puts "#{a} #{operator} #{b} = #{result}"
end

# Gọi hàm với symbol để lấy đúng phép toán
calculate(10, 5, :add, calculations, operations)
calculate(10, 5, :subtract, calculations, operations)
calculate(10, 5, :multiply, calculations, operations)
calculate(10, 5, :divide, calculations, operations)

