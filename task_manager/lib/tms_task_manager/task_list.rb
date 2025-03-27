require 'pry'
require_relative 'database'
require_relative 'error_handler'

module TmsTaskManager
  class TaskList
    extend ErrorHandler
    @db = TmsTaskManager::Database.connection

    # Adds a new task to the database
    def self.create(title, description, start_date, end_date, status = "pending")
      handle_errors do
        raise 'Status must be "pending", "in_progress" or "completed"' unless %w[pending in_progress completed].include?(status.downcase)

        @db.execute("INSERT INTO tasks (title, description, start_date, end_date, status) VALUES (?, ?, ?, ?, ?)", 
                    [title, description, start_date, end_date, status])
        puts "Task created: #{title}"
      end
    end

    # Lists all tasks in the database
    def self.list
      handle_errors do
        tasks = @db.execute("SELECT id, title, status, start_date, end_date FROM tasks")

        if tasks.empty?
          puts "No tasks found"
        else
          puts tasks
        end
      end
    end

    # Removes a task from the database
    def self.remove(id)
      handle_errors do
        @db.execute("DELETE FROM tasks WHERE id = ?", [id])
        puts "Task removed: #{id}"
      end
    end
    
    # Deletes all tasks
    def self.delete_all
      handle_errors do
        @db.execute("DELETE FROM tasks")
        puts "All tasks deleted"
      end
    end

    # Gets a task from the database
    def self.get(id)
      handle_errors do
        task = @db.execute("SELECT * FROM tasks WHERE id = ?", [id]).first
        if task.nil?
          puts "Task not found"
        else
          puts "#{task}"
        end
      end
    end
  end
end
