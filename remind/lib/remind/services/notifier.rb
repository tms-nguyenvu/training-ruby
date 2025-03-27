# frozen_string_literal: true

require 'net/http'
require 'json'
require 'dotenv/load'
require 'pry'
require_relative '../helpers/error_handler'

module Remind
  module Service
    class Notifier
      extend Remind::Helper::ErrorHandler
      # Send message to slack
      def self.notify(message)
        handle_errors do
          payload = { "text": message }.to_json
          uri = URI(ENV['SLACK_WEBHOOK_URL'])
          Net::HTTP.post(uri, payload, 'Content-Type' => 'application/json')
        end
      end
    end
  end
end
