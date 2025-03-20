module ConnectToDb
   DB_NAME = "student_management.db"


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
  end

  def select_by_id(student_id)
    @db.execute("SELECT * FROM students WHERE id = ?", student_id)
  rescue SQLite3::Exception => error
    puts "Database error: #{error.message}"
  end
end