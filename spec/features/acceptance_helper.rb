# frozen_string_literal: true

ENV["RACK_ENV"] = "test"

require "rubygems"
require "rack/test"
require "capybara/rspec"

RSpec.configure do |config|
  config.include Capybara
end

require_relative "./../../trivia"

Capybara.app = Sinatra::Application
Capybara.default_driver = :selenium_chrome_headless
Capybara.server = :webrick
