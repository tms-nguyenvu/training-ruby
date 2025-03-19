class Employee
  attr_accessor :name, :salary

  def initialize(name, salary)
    @name = name
    @salary = salary
  end

  def calculate_bonus
    raise NotImplementedError, "Subclasses must implement this method"
  end
end

class Manager < Employee
  def calculate_bonus
    @salary * 0.1
  end
end

class Developer < Employee
  def calculate_bonus
    @salary * 0.05
  end
end

manager = Manager.new("John Doe", 50000)  
developer = Developer.new("Jane Doe", 40000)

puts "Manager bonus: #{manager.calculate_bonus}"
puts "Developer bonus: #{developer.calculate_bonus}"
