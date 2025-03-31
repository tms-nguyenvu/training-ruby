# frozen_string_literal: true

require 'time'
require 'tms_task_manager'


module Remind
  module Service
    class Report
      extend Remind::Helper::ErrorHandler
      extend Remind::Helper::LogHandler

      # Notify completed tasks last month
      def self.completed_tasks_last_month
        handle_errors do
          tasks = TmsTaskManager::Services::TaskList.list
          current_time = Time.now
          one_month_ago = current_time - (30 * 24 * 60 * 60)
          messages = []
          completed_tasks = tasks.select do |task|
            task['status'] == 'completed' &&
              Time.parse(task['end_date']) >= one_month_ago &&
              Time.parse(task['end_date']) <= current_time
          end

          if completed_tasks.empty?
            create_log(Logger::INFO, 'No completed tasks in the last month')
          else
            completed_tasks.each do |task|
              create_log(Logger::INFO, "Task '#{task['title']}' (Completed: #{task['end_date']})")
              messages << "Task '#{task['title']}' (Completed: #{task['end_date']})"
            end
          end

          Remind::Service::Notifier.notify(messages.join("\n"))
        end
      end
    end
  end
end
