# frozen_string_literal: true

require_relative '../remind'

namespace :log do
  desc 'Clear log'
  task :clear do
    Remind::Helper::LogHandler.clear_log
  end
end
