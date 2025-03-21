require 'sqlite3'

db = SQLite3::Database.new('test.db')

rows = db.execute <<~SQL
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER
  );
SQL

stmt = db.prepare "INSERT INTO users (name, age) VALUES (?, ?)"

stmt.execute("John", 25)
stmt.execute("Jane", 30)

stmt.execute( "SELECT * FROM users") do |row|
  puts rows.join(", ")
end

db.close