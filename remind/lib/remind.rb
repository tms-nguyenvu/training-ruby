# frozen_string_literal: true

require_relative 'remind/version'
require 'pry'
# binding.pry
%w[commands helpers services].each do |folder|
  Dir.glob("#{__dir__}/remind/#{folder}/*.rb").sort.each { |file| require_relative(file) }
end
module Remind
  class Error < StandardError; end
  # Your code goes here...
end
