# frozen_string_literal: true

ENV["RACK_ENV"] = "test"

require "capybara/rspec"
require "rubygems"
require "rack/test"

RSpec.configure do |config|
  config.include Capybara
end

require_relative "./../../trivia"

Capybara.app = Trivia.new
Capybara.default_driver = :selenium_chrome_headless
Capybara.server = :webrick
