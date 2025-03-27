# frozen_string_literal: true

require_relative 'remind/version'
require_relative 'remind/services/scheduler'
require_relative 'remind/services/report'
require_relative 'remind/helpers/log_handler'
require_relative 'remind/commands/cli'
module Remind
  class Error < StandardError; end
  # Your code goes here...
end
