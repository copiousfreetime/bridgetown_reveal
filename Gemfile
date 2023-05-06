# frozen_string_literal: true

source "https://rubygems.org"
gemspec

gem "bridgetown", ENV["BRIDGETOWN_VERSION"] if ENV["BRIDGETOWN_VERSION"]
gem "rake", "~> 13.0"

group :test do
  gem "debug"
  gem "minitest"
  gem "minitest-profile"
  gem "minitest-reporters"
  gem "rubocop-bridgetown", "~> 0.3"
end
