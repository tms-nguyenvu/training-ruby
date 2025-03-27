# frozen_string_literal: true

require 'pry'
require_relative 'log_handler'
module Remind
  module Helper
    module ErrorHandler
      include Remind::Helper::LogHandler
      def handle_errors
        yield
      rescue StandardError => e
        puts "Error: #{e.class} - #{e.message}"
        # binding.pry
        create_log(Logger::ERROR, e.message || 'Unknown error', 'log/log.log')
      end
    end
  end
end
