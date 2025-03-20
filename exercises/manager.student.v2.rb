require 'sqlite3'
require_relative 'connect_to_db'
require_relative 'person'
require_relative 'student_management_error'

class StudentManager < Person
  include ConnectToDb 
  
  def initialize()
    @db = SQLite3::Database.new(DB_NAME)
    create_table
    super(name, age)
  end

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
      puts "8. Update student by ID"
      puts "9. Exit"
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
      when 8 then update_student
      when 9 then break
      else
        puts "Invalid choice! Please try again.\n\n"
      end
    end
  end

  private
  # Add a new student to the list of students
  def add_student
    begin
      print "Enter student id: "
      id = gets.chomp

      # Check if the ID already exists
      if select_by_id(id).any?
        raise IDAlreadyExistsError.new(id)
      end

      print "Enter student name: "
      name = gets.chomp
      print "Enter student age: "
      age = gets.chomp.to_i

      print "Enter student score: "
      score = gets.chomp.to_f

      # Check if the score is between 0 and 10    
      if score < 0 || score > 10
        raise InvalidScoreError.new(score)
      end
      @db.execute("INSERT INTO students (id, name, age, score) VALUES (?, ?, ?, ?)", [id, name, age, score])
      puts "Student added successfully! \n\n"
    rescue IDAlreadyExistsError, InvalidScoreError, InvalidAgeError => error
      puts "Error: #{error.message}"
    rescue SQLite3::Exception => error
    puts "Database error: #{error.message}"
    end
  end

  # Display the list of students
  def display_students
    begin
      puts "\n===List of students:==="
      @db.execute("SELECT * FROM students") do |row|
        if row.nil?
          raise EmptyDatabaseError.new()
        end
        puts "Student ID: #{row[0]} | Name: #{row[1]} | Age: #{row[2]} | Score: #{row[3]}"
      end
      puts "\n"
      rescue EmptyDatabaseError => error
        puts "Error: #{error.message}"
      rescue SQLite3::Exception => error
        puts "Database error: #{error.message}"
    end
  end

  # Find a student by ID
  def find_student
    begin
      print "Enter student id: "
      id = gets.chomp
      student = select_by_id(id).first
      if student
        puts "\n Student ID: #{student[0]} | Name: #{student[1]} | Age: #{student[2]} | Score: #{student[3]}"
      else
        raise StudentNotFoundError.new(id)
      end
    rescue StudentNotFoundError => error
      puts "Error: #{error.message}"
    rescue SQLite3::Exception => error
      puts "Database error: #{error.message}"
    end
  end


  # Calculates and displays the average score of all students
  def average_score
    begin
      total_score = @db.execute("SELECT SUM(score) FROM students").first[0]
      count = @db.execute("SELECT COUNT(*) FROM students").first[0]
      if count > 0
        average_score = total_score.to_f / count
        puts "Average score: #{average_score.round(2)} \n\n"
      else
        raise EmptyDatabaseError.new()
      end
    rescue EmptyDatabaseError => error
      puts "Error: #{error.message}"
    rescue SQLite3::Exception => error
      puts "Database error: #{error.message}"
    end
  end

  # Finds and displays the student with the highest score
  def top_student
    begin
      top_student = @db.execute("SELECT * FROM students ORDER BY score DESC LIMIT 1").first
      if top_student
        puts "Student has highest score ID: #{top_student[0]} | name: #{top_student[1]} | score: #{top_student[3]} \n\n"
      else
        raise EmptyDatabaseError.new()
      end
    rescue EmptyDatabaseError => error
      puts "Error: #{error.message}"
    rescue SQLite3::Exception => error
      puts "Database error: #{error.message}"
    end
  end

  # Filters the list of students by a given age
  def filter_by_age
    begin
      print "Enter age:"
      age = gets.chomp.to_i
      filtered_students = @db.execute("SELECT * FROM students WHERE age = ?", age)
      if filtered_students.empty?
        raise EmptyDatabaseError.new("No student has age #{age}")
      else
        puts "List of students has age #{age}: \n\n"
        filtered_students.each do |student|
          puts "Student ID: #{student[0]} | Name: #{student[1]} | Age: #{student[2]} | Score: #{student[3]}"
        end
        puts "\n"
      end
    rescue EmptyDatabaseError => error
      puts "Error: #{error.message}"
    rescue SQLite3::Exception => error
      puts "Database error: #{error.message}"
    end
  end

  # Deletes a student from the list by their ID
  def delete_student
    begin
      print "Enter student id: "
      id = gets.chomp
      if select_by_id(id).empty?
        raise StudentNotFoundError.new(id)
      end
      @db.execute("DELETE FROM students WHERE id = ?", id)
      puts "Student deleted successfully! \n\n"
    rescue StudentNotFoundError => error
      puts "Error: #{error.message}"
    rescue SQLite3::Exception => error
      puts "Database error: #{error.message}"
    end 
  end

  # Updates a student from the list by their ID
  def update_student
    begin
      print "Enter student id: "
      id = gets.chomp
      if select_by_id(id).empty?
        raise StudentNotFoundError.new(id)
      end
      print "Enter student name: "
      name = gets.chomp
      print "Enter student age: "
      age = gets.chomp.to_i
      print "Enter student score: "
      score = gets.chomp.to_f
      @db.execute("UPDATE students SET name = ?, age = ?, score = ? WHERE id = ?", [name, age, score, id])
      puts "Student updated successfully! \n\n"
    rescue StudentNotFoundError => error
      puts "Error: #{error.message}"
    rescue SQLite3::Exception => error
      puts "Database error: #{error.message}"
    end
  end
end

manager = StudentManager.new
manager.menu