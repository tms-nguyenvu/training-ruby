# frozen_string_literal: true

require 'pry'
require 'tty-table'
require_relative '../configs/database'
require_relative '../helpers/error_handler'

module TmsTaskManager
  module Services
    class TaskList
      extend TmsTaskManager::Helpers::ErrorHandler
      @db = TmsTaskManager::Configs::Database.connection

      class << self

          # Adds a new task to the database
          def create(title, description, start_date, end_date, status = 'pending')
            handle_errors do
              raise 'Status must be "pending", "in_progress" or "completed"' unless %w[pending in_progress
                                                                                      completed].include?(status.downcase)

              @db.execute('INSERT INTO tasks (title, description, start_date, end_date, status) VALUES (?, ?, ?, ?, ?)',
                          [title, description, start_date, end_date, status])
              puts "Task created successfully: #{title}"
              { success: true, message: "Task created: #{title}" }
            end
          end

          # Lists all tasks in the database
          def list
            handle_errors do
              tasks = @db.execute('SELECT id, title, description, status, start_date, end_date FROM tasks')

              if tasks.empty?
                puts 'No tasks found.'
              else
                rows = tasks.map do |task|
                  [task['id'], task['title'], task['description'], task['status'], task['start_date'], task['end_date']]
                end
                p rows
                # binding.pry
                table = TTY::Table.new(
                  ['ID', 'Title', 'Description', 'Status', 'Start Date', 'End Date'],
                  rows
                )

                puts table.render(:unicode, resize: true, alignment: [:center])
              end
              tasks
            end
          end

          # Removes a task from the database
          def remove(id)
            handle_errors do
              @db.execute('DELETE FROM tasks WHERE id = ?', [id])
              puts "Task removed successfully: #{id}"
              { success: true, message: "Task removed: #{id}" }
            end
          end

          # Deletes all tasks
          def delete_all
            handle_errors do
              @db.execute('DELETE FROM tasks')
              puts 'All tasks have been deleted.'
              { success: true, message: 'All tasks deleted' }
            end
          end

          # Gets a task from the database
          def get(id)
            handle_errors do
              task = @db.execute('SELECT * FROM tasks WHERE id = ?', [id]).first
              rows = []
              if task.nil?
                puts "Task not found: #{id}"
                { success: false, message: 'Task not found' }
              else
                rows << [task['id'], task['title'], task['description'], task['status'], task['start_date'], task['end_date']]
                table = TTY::Table.new(
                  ['ID', 'Title', 'Description', 'Status', 'Start Date', 'End Date'],
                  rows
                )
                puts table.render(:unicode, resize: true, alignment: [:center])
                task
              end
            end
          end
      end
    end
  end
end
