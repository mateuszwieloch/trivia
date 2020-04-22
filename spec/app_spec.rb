# frozen_string_literal: true

ENV["APP_ENV"] = "test"

require "./../trivia"
require "rspec"
require "rack/test"

RSpec.describe "App" do
  include Rack::Test::Methods

  let(:app) { Trivia.new }

  context "GET /" do
    it "route exists" do
      get "/index.html"
      expect(last_response).to be_ok
    end
  end

  context "GET /game/:id" do

    it "returns 404 if game doesn't exist" do
      get "/game/non_existing_id"
      expect(last_response.status).to eq(404)
    end

  end
end
