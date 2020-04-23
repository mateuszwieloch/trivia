# frozen_string_literal: true

require "sinatra/base"
require "sinatra/json"
require_relative "src/db/in_memory"
require_relative "src/game"

class Trivia < Sinatra::Base
  attr_accessor :db

  def initialize(app = nil, db = InMemoryDb.new)
    super(app)
    self.db = db
  end

  get "/" do
    redirect("/index.html")
  end

  post "/join" do
    name = params["name"]
    return 400 if name.nil? || name.to_s.empty?

    game = @db.find_or_create_game
    game.add_player(name)
    game.id
  end

  get "/game/:id/waiting" do
    game = @db.find_game(params["id"])
    return 404 if game.nil?
    game.update
    WaitingGameView.from(game).to_json
  end

  get "/game/:id/ongoing" do
    game = @db.find_game(params["id"])
    return 404 if game.nil?
    game.update
    OngoingGameView.from(game).to_json
  end

  run! if app_file == $PROGRAM_NAME
end
