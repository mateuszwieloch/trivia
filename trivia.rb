# frozen_string_literal: true

require "sinatra/base"
require "sinatra/json"
require_relative "./in_memory_db"
require_relative "./game"

class Trivia < Sinatra::Base
  attr_accessor :db

  def initialize(app = nil, db = InMemoryDb.new)
    super(app)
    self.db = db
  end

  get "/" do
    redirect("/index.html")
  end

  get "/game/:id" do
    game = @db.find_game(params["id"])
    return 404 if game.nil?
    return "Game ongoing, join another one" unless game.waiting_for_players?

    PlayerViewOfTheGame.from(game).to_json
  end

  run! if app_file == $PROGRAM_NAME
end
