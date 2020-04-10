# frozen_string_literal: true

source "https://rubygems.org"
ruby "2.7.1"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem "sinatra"
gem "sinatra-contrib"

group :test do
  gem "capybara"
  gem "selenium-webdriver"

  gem "rack-test"
  gem "rspec"
end

group :development do
  gem "rubocop", require: false  # linting
  gem "solargraph"               # Ruby language server for IDE autocompletion
end
