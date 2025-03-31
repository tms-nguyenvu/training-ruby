# frozen_string_literal: true

module TmsTaskManager
  module Helpers
    module ErrorHandler
      def handle_errors
        yield
      rescue StandardError => e
        puts "Error: #{e.class} - #{e.message}"
      end
    end
  end
end
