require 'fileutils'
require 'logger'

module LogHelper
  def create_file(file_path)
    begin
      unless File.exist?(file_path)
        FileUtils.touch(file_path)
      end
    rescue => error
      puts "Error: #{error.message}"
    end
  end

  def create_log(level, message)
    log_file = "log.log"
    logger = Logger.new(log_file, File::WRONLY | File::APPEND | File::CREAT)
    logger.formatter = proc do |severity, datetime, _progname, msg|
      "#{datetime.strftime("%Y-%m-%d %H:%M:%S")} - #{severity} - #{msg}\n"
    end
    logger.add(level, message)
  end
end

