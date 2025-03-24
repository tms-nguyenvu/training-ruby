require 'logger'

class FlexLogger
  def initialize
    @handlers = {}
    yield(self) if block_given?
  end

  def add_handler(name, filter: nil, formatter: nil, &block)
    @handlers[name] = { block: block, filter: filter, formatter: formatter }
  end


  def log(message, level)
    @handlers.each do |name, handler|
      next if handler[:filter] && !handler[:filter].call(message, level) # Apply filter

      formatted_message = handler[:formatter] ? handler[:formatter].call(message, level) : message # Apply formatter
      handler[:block].call(formatted_message, level) # Execute handler
    end
  end

  def debug(message)
    log(message, :debug)
  end

  def info(message)
    log(message, :info)
  end

  def warn(message)
    log(message, :warn)
  end

  def error(message)
    log(message, :error)
  end
end

# Example Usage
logger = FlexLogger.new

# Console handler
logger.add_handler("console") do |message, level|
  puts "[#{level.upcase}] #{message}"
end



# File handler (only logs errors, with timestamp format)
only_errors = ->(message, level) { level == :error }
timestamp_format = ->(msg, lvl) { "#{Time.now} [#{lvl.upcase}] #{msg}" }

logger.add_handler("file", filter: only_errors, formatter: timestamp_format) do |message, level|
  File.open("error.log", "a") { |file| file.puts message }
end

# Test logging
logger.debug "Đây là debug message"
logger.info "Ứng dụng đã khởi động"
logger.warn "Cảnh báo: Disk space thấp"
logger.error "Lỗi kết nối database!"
