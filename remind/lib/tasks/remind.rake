# frozen_string_literal: true

require_relative '../remind'

namespace :remind do
  desc 'Notify due tasks'
  task :notify_due_tasks do
    Remind::Service::Scheduler.start
  end

  desc 'Notify completed tasks last month'
  task :completed_tasks_last_month do
    Remind::Service::Report.completed_tasks_last_month
  end
end
