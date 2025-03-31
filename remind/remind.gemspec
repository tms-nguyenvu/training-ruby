# frozen_string_literal: true

require_relative 'lib/remind/version'

Gem::Specification.new do |spec|
  spec.name = 'tms-remind'
  spec.version = Remind::VERSION
  spec.authors = ['tms-nguyenvu']
  spec.email = ['vu.nguyen1@tomosia.com']

spec.summary = 'A task reminder and notification gem.'
  spec.description = 'Remind is a Ruby gem that helps manage task reminders and send notifications via Slack.'
  spec.homepage = "https://github.com/tms-nguyenvu/training-ruby/tree/exercise-03/remind"
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = "https://github.com/tms-nguyenvu/training-ruby/tree/exercise-03/remind"
  spec.metadata['changelog_uri'] = "https://github.com/tms-nguyenvu/training-ruby/tree/exercise-03/remind"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = Dir["**/*"].reject { |f| f.end_with?(".gem") }

  spec.bindir = 'exe'
  spec.executables = ['remind']
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # Dependencies
  spec.add_dependency 'pry', '~> 0.14'
  spec.add_dependency 'sqlite3', '>= 1.5', '< 3.0'
  spec.add_dependency 'tms_task_manager', '~> 0.1.6'
  spec.add_dependency 'thor'
  spec.add_dependency 'whenever', '~> 1.0'
  spec.add_dependency 'logger', '~> 1.7'
  spec.add_dependency 'dotenv'
  # For development
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rubocop', '~> 1.50'
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
