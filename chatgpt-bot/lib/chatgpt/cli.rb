# frozen_string_literal: true

require "http"
require "json"
require "dotenv/load"
require_relative "cli/version"

module Chatgpt
  module Cli
    GEMINI_API_KEY = nil  # Ban đầu chưa có API Key
    MODEL_ID = "gemini-2.0-flash"

    def self.set_api_key(api_key)
      @api_key = api_key
    end

    def self.ask(prompt)
      unless @api_key
        puts "❌ API Key chưa được thiết lập!"
        return
      end

      url = "https://generativelanguage.googleapis.com/v1/models/#{MODEL_ID}:generateContent?key=#{@api_key}"

      body = {
        "generationConfig": {
          "temperature": 0.7,   
          "topK": 40,          
          "topP": 0.9,         
          "maxOutputTokens": 500 
        },
        "safetySettings": [
          {"category": "HARM_CATEGORY_HARASSMENT", "threshold": "BLOCK_ONLY_HIGH"},
          {"category": "HARM_CATEGORY_HATE_SPEECH", "threshold": "BLOCK_MEDIUM_AND_ABOVE"}
        ],
        "contents": [
          {
            "parts": [
              { "text": prompt }
            ]
          }
        ]
      }

      response = HTTP.post(url, json: body)
      json_response = JSON.parse(response.body.to_s)

      if json_response["candidates"] && json_response["candidates"][0]["content"]["parts"]
        result = json_response["candidates"][0]["content"]["parts"].map { |part| part["text"] }.join("\n")
        puts "**ChatGPT:**\n#{result}"
      else
        puts "Error: #{json_response["error"]["message"]}"
      end

    rescue => e
      puts "Error: #{e.message}"
    end
  end
end

