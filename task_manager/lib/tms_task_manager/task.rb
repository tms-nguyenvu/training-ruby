require_relative 'database'
require_relative 'error_handler'
module TmsTaskManager
  class Task
    extend ErrorHandler
    @db = TmsTaskManager::Database.connection

      # Updates the status of a task
    def self.update_status(id, status)
      handle_errors do
        raise 'Status must be "pending", "in_progress" or "completed"' unless %w[pending in_progress completed].include?(status.downcase)

        task = @db.execute("SELECT * FROM tasks WHERE id = ?", [id]).first
        if task.nil?
          puts "Task not found"
          return
        end

        @db.execute("UPDATE tasks SET status = ? WHERE id = ?", [status, id])
        puts "Task updated: #{id}"
      end
    end
    
  end
end