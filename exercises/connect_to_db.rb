require_relative 'log_helper'

module ConnectToDb
   DB_NAME = "student_management.db"
   include LogHelper

  def create_table
    @db = SQLite3::Database.new(DB_NAME)
    @db.execute <<~SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER,
        score REAL
      );
    SQL
    create_log(Logger::INFO, "Table 'students' has been created or already exists.")
  rescue SQLite3::Exception => error
    create_log(Logger::ERROR, "Database error: #{error.message}")
  end

  def select_by_id(student_id)
    result = @db.execute("SELECT * FROM students WHERE id = ?", student_id)
    create_log(Logger::INFO, "Fetched student with ID #{student_id}: #{result.inspect}")
    result
  rescue SQLite3::Exception => error
    create_log(Logger::ERROR, "Database error: #{error.message}")
  end
end