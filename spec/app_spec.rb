# frozen_string_literal: true

ENV["APP_ENV"] = "test"

require "./../trivia"
require "rspec"
require "rack/test"

RSpec.describe "App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context "main page" do
    it "contains the Start a New Game button" do
      get "/index.html"
      expect(last_response).to be_ok
    end
  end
end
