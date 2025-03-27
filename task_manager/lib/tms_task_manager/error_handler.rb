module TmsTaskManager
  module ErrorHandler
    def handle_errors
      yield
    rescue StandardError => error
      puts "Error: #{error.class} - #{error.message}"
    end
  end
end
