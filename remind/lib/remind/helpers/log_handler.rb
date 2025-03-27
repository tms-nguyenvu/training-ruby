# frozen_string_literal: true

require 'fileutils'
require 'logger'

module Remind
  module Helper
    module LogHandler
      def self.clear_log(filename = 'log/log.log')
        File.exist?(filename) ? File.truncate(filename, 0) : return
      end

      def create_log(level, message, filename = 'log/log.log')
        FileUtils.touch(filename) unless File.exist?(filename)
        logger = Logger.new(filename, File::WRONLY | File::APPEND | File::CREAT)

        logger.formatter = proc do |severity, datetime, _progname, msg|
          "#{datetime.strftime('%Y-%m-%d %H:%M:%S')} - #{severity} - #{msg}\n"
        end
        logger.add(level, message)
      end
    end
  end
end
