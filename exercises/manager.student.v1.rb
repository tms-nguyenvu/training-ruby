class StudentManager

  def initialize
    @students = []
  end

  # Add a new student to the list of students
  def add_student
    print "Enter student id: "
    id = gets.chomp

    # Check if the ID already exists
    if @students.any? { |student| student[:id] == id }
      puts "ID already exists \n\n"
      return
    end

    print "Enter student name: "
    name = gets.chomp
    print "Enter student age: "
    age = gets.chomp.to_i

    print "Enter student score: "
    score = gets.chomp.to_f

    # Check if the score is between 0 and 10
    if score < 0 || score > 10
      puts "Score must be between 0 and 10 \n\n"
      return
    end

    @students << {
      id: id,
      name: name,
      age: age,
      score: score
    }
    puts "Add student successfully \n\n"
  end


  # Display the list of students.
  def display_students
    if @students.empty?
      puts "Empty list of students \n\n"
      return
    end

    puts "List of students:"
    @students.each_with_index do |student, index|
      puts "#{index + 1}. Student ID: #{student[:id]} | Name: #{student[:name]} | Age: #{student[:age]} | Score: #{student[:score]}"
    end
    puts "\n"
  end  


  # Finds a student by ID.
  def find_student
    puts "Enter student id: "
    id = gets.chomp
    student = @students.find { |student| student[:id] == id }

    if student
      puts "Student ID: #{student[:id]} | Name: #{student[:name]} | Age: #{student[:age]} | Score: #{student[:score]} \n\n"
    else
      puts "Student not found! \n\n"
    end
  end

  # Calculates and displays the average score of all students.
  def average_score
    if @students.empty?
      puts "Empty list of students \n\n"
      return
    end

    average_score = @students.sum { |student| student[:score] } / @students.size.to_f
    puts "Average score: #{average_score.round(2)} \n\n"
  end

  # Finds and displays the student with the highest score.
  def top_student
    if @students.empty?
      puts "Empty list of students \n\n"
      return
    end

    max_score = @students.max_by { |student| student[:score] }
    puts "Student has highest score ID: #{max_score[:id]} | name: #{max_score[:name]} | score: #{max_score[:score]} \n\n"
  end

  # Filters the list of students by a given age.
  def filter_by_age
    print "Enter age: \n"
    age = gets.chomp.to_i
    filtered_students = @students.select { |student| student[:age] == age }

    if(filtered_students.empty?)
      puts "No student has age #{age} \n\n"
    else
      puts "List of students has age #{age}:"
      filtered_students.each do |student|
        puts "Student ID: #{student[:id]} | Name: #{student[:name]} | Age: #{student[:age]} | Score: #{student[:score]}"
      end
      puts "\n"
    end
  end

  # Deletes a student from the list by their ID.
  def delete_student
    print "Enter student ID to delete: "
    id = gets.chomp
    initial_size = @students.size
    @students.reject! { |student| student[:id] == id }

    if @students.size < initial_size
      puts "Student deleted successfully! \n\n"
    else
      puts "Student ID not found! \n\n"
    end
  end

  # Loops indefinitely until the user chooses to exit.
  def menu
    loop do
      puts "----------------------------------------"
      puts " STUDENT MANAGEMENT SYSTEM"
      puts "----------------------------------------"
      puts "1. Add student"
      puts "2. Display all students"
      puts "3. Find student by ID"
      puts "4. Calculate average score"
      puts "5. Find top student"
      puts "6. Filter students by age"
      puts "7. Delete student by ID"
      puts "8. Exit"
      print "Enter your choice: "

      choice = gets.chomp.to_i
      puts "\n"

      case choice
      when 1 then add_student
      when 2 then display_students
      when 3 then find_student
      when 4 then average_score
      when 5 then top_student
      when 6 then filter_by_age
      when 7 then delete_student
      when 8 then break
      else
        puts "Invalid choice! Please try again.\n\n"
      end
    end
  end
end


manager = StudentManager.new
manager.menu