require 'sqlite3'
require_relative 'active_record'

class StudentManager
  include ActiveRecord::Query

  @table_name = "students"  
  def self.table_name
    @table_name
  end

  def self.setup_db
    create_table(SQLite3::Database.new("student_management.db"), 
    self.class.table_name,  
    [
      { name: "id", type: "INTEGER PRIMARY KEY" },
      { name: "name", type: "TEXT" },
      { name: "age", type: "INTEGER" },
      { name: "score", type: "REAL" }
    ])
  end

end


# StudentManager.create(id: 2, name: "Nguyen Van A", age: 20, score: 8.5)
# users = StudentManager.all()
# p users



user2 = StudentManager.find(2)
user2.update(name: "Nguyen Van B")
p user2

p StudentManager.all()