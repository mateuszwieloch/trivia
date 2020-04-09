# frozen_string_literal: true

ENV["APP_ENV"] = "test"

require "./../trivia"
require "rspec"
require "rack/test"

RSpec.describe "App" do
  include Rack::Test::Methods

  let(:app) { Trivia.new }

  context "GET /" do
    it "contains the Start a New Game button" do
      get "/index.html"
      expect(last_response).to be_ok
    end
  end

  context "GET /game/:id" do

    it "returns 404 if game doesn't exist" do
      get "/game/non_existing_id"
      expect(last_response.status).to eq(404)
    end

    context "when game is not accepting new players" do
      let(:app) do
        db = InMemoryDb.new
        game = Game.new("x47b")
        game.state = :waiting_for_answers
        db.games << game
        Trivia.new(nil, db)
      end

      it "returns message" do
        get "/game/x47b"
        expect(last_response).to be_ok
        expect(last_response.body).to include("Game ongoing")
      end
    end

    context "when game in waiting_for_players state" do
      let(:app) do
        db = InMemoryDb.new
        game = Game.new("x47b")
        game.state = :waiting_for_players
        db.games << game
        Trivia.new(nil, db)
      end

      it "returns game info" do
        get "/game/x47b"
        expect(last_response).to be_ok
        expect(last_response.body).to include("x47b")
        expect(last_response.body).to include("waiting_for_players")
      end
    end
  end
end
