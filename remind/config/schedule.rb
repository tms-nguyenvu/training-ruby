# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "#{path}/log/cron_log.log"
set :environment, :development

every 1.hour do
  rake 'remind:notify_due_tasks'
end

every 1.month do
  rake 'remind:completed_tasks_last_month'
end

every 7.days do
  rake 'log:clear'
end
