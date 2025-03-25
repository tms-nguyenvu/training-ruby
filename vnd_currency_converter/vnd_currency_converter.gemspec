# frozen_string_literal: true

require_relative "lib/vnd_currency_converter/version"

Gem::Specification.new do |spec|
  spec.name = "vnd_currency_converter"
  spec.version = VndCurrencyConverter::VERSION
  spec.authors = ["tms-nguyenvu"]
  spec.email = ["vu.nguyen1@tomosia.com"]

  spec.summary = "Gem chuyển đổi tiền tệ từ VND sang các loại tiền khác."
  spec.description = "Hỗ trợ chuyển đổi tiền tệ với tỷ giá cập nhật từ API."
  spec.homepage = "https://github.com/yourusername/vnd_currency_converter"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://example.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tms-nguyenvu/training-ruby/tree/exercise-03"
  spec.metadata["changelog_uri"] = "https://github.com/tms-nguyenvu/training-ruby/tree/exercise-03"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = Dir.glob("lib/**/*.rb")

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "http", "~> 5.1"
  spec.add_runtime_dependency "json", "~> 2.6"
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  
end
