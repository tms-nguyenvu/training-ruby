# frozen_string_literal: true

require 'time'
require 'pry'
require 'tms_task_manager'
require_relative 'notifier'
require_relative '../helpers/error_handler'
require_relative '../helpers/log_handler'

module Remind
  module Service
    class Scheduler
      extend Remind::Helper::ErrorHandler
      extend Remind::Helper::LogHandler

      # Notify due tasks
      def self.start
        handle_errors do
          tasks = TmsTaskManager::Services::TaskList.list
          puts tasks
          # binding.pry
          messages = []
          tasks.each do |task|
            start_date = Time.parse(task['start_date'])
            due_date = Time.parse(task['end_date'])
            status = task['status']
            task_name = task['title']

            if status == 'completed'
              create_log(Logger::INFO, "Task '#{task_name}' (Completed: #{due_date.strftime('%Y-%m-%d')})")
            elsif Time.now < start_date
              create_log(Logger::INFO, "Task '#{task_name}' (Not Started: #{start_date.strftime('%Y-%m-%d')})")
            elsif Time.now <= due_date
              create_log(Logger::INFO, "Task '#{task_name}' (In Progress: from #{start_date.strftime('%Y-%m-%d')} to #{due_date.strftime('%Y-%m-%d')})")
            else
              create_log(Logger::ERROR, "Task '#{task_name}' (Overdue: from #{start_date.strftime('%Y-%m-%d')} to #{due_date.strftime('%Y-%m-%d')})")
              messages << "Task '#{task_name}' (Overdue: from #{start_date.strftime('%Y-%m-%d')} to #{due_date.strftime('%Y-%m-%d')})"
            end
          end

          Remind::Service::Notifier.notify(messages.join("\n"))
        end
      end
    end
  end
end
