require "sqlite3"

module TmsTaskManager
  class Database
    DB_PATH = File.expand_path("../../remind.db", __FILE__)

    class << self
      def connection
        @db ||= SQLite3::Database.new(DB_PATH).tap do |db|
          db.results_as_hash = true  
        end
      end
      def setup
        connection.execute_batch <<-SQL
          CREATE TABLE IF NOT EXISTS tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title VARCHAR(255),
            description TEXT,
            start_date DATETIME,
            end_date DATETIME,
            status VARCHAR(20) CHECK( status IN ('pending', 'in_progress', 'completed') )
          );

          CREATE TABLE IF NOT EXISTS categories (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title VARCHAR(255),
            description TEXT,
            slug VARCHAR(255) UNIQUE
          );

          CREATE TABLE IF NOT EXISTS task_category (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            task_id INTEGER,
            category_id INTEGER,
            FOREIGN KEY (task_id) REFERENCES tasks(id),
            FOREIGN KEY (category_id) REFERENCES categories(id)
          );
        SQL
      end
    end
  end
end
