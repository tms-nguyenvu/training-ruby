require 'thor'
require 'fileutils'


module Remind
  module Commands
    class Cli < Thor
      desc "set_env", "Set SLACK_WEBHOOK_URL in .env file"
      def set_env
        webhook_url = ask("Enter your Slack Webhook URL:")

        if webhook_url.empty?
          puts 'No URL provided. Aborting...'
          return
        end

        FileUtils.touch('.env') unless File.exist?('.env')

        env_content = File.read('.env')
        if env_content.match?(/^SLACK_WEBHOOK_URL=/)
          env_content.gsub!(/^SLACK_WEBHOOK_URL=.*/, "SLACK_WEBHOOK_URL=#{webhook_url}")
        else
          env_content << "\nSLACK_WEBHOOK_URL=#{webhook_url}\n"
        end

        File.write('.env', env_content)
        puts 'SLACK_WEBHOOK_URL has been set in .env file.'
      end
    end
  end
end