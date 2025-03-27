# frozen_string_literal: true

require_relative '../configs/database'
require_relative '../helpers/error_handler'

module TmsTaskManager
  module Services
    class Task
      extend TmsTaskManager::Helpers::ErrorHandler
      @db = TmsTaskManager::Configs::Database.connection

      # Updates the status of a task
      def self.update_status(id, status)
        handle_errors do
          raise 'Status must be "pending", "in_progress" or "completed"' unless %w[pending in_progress completed].include?(status.downcase)

          task = @db.execute('SELECT * FROM tasks WHERE id = ?', [id]).first
          if task.nil?
            puts "Task not found: #{id}"
            return { success: false, message: 'Task not found' }
          end

          @db.execute('UPDATE tasks SET status = ? WHERE id = ?', [status, id])
          updated_task = task.merge('status' => status)
          puts "Task updated successfully: ID: #{id}, New Status: #{status}"
          { success: true, message: "Task updated: #{id}", task: updated_task }
        end
      end
    end
  end
end
