# frozen_string_literal: true

require_relative 'lib/tms_task_manager/version'

Gem::Specification.new do |spec|
  spec.name = 'tms_task_manager'
  spec.version = TmsTaskManager::VERSION
  spec.authors = ['nguyenvu-tms']
  spec.email = ['vu.nguyen1@tomosia.com']

  spec.summary = 'A simple task management library for Ruby applications.'
  spec.description = 'TmsTaskManager provides an easy way to create, manage, and track tasks using a simple Ruby-based interface with database support.'
  spec.homepage = 'https://rubygems.org/gems/tms_task_manager'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/tms-nguyenvu/training-ruby/tree/exercise-03'
  spec.metadata['changelog_uri'] = 'https://github.com/tms-nguyenvu/training-ruby/tree/exercise-03/blob/main/CHANGELOG.md'

  File.basename(__FILE__)
  spec.files = Dir.glob('{lib,exe}/**/*', File::FNM_DOTMATCH).reject { |f| File.directory?(f) }

  spec.bindir = 'exe'
  spec.executables = ['tms_task_manager']
  spec.require_paths = ['lib']

  # Dependencies
  spec.add_dependency 'pry', '~> 0.14'
  spec.add_dependency 'sqlite3', '>= 1.5', '< 3.0'

  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rubocop', '~> 1.50'
end
