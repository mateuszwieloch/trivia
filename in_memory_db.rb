# frozen_string_literal: true

require_relative "./game"

class InMemoryDb
  attr_accessor :games

  def initialize
    self.games = []
  end

  # @return [Game] game in the waiting_for_players state
  def find_or_create_game
    game_waiting = games.find(&:waiting_for_players?)
    if game_waiting.nil?
      game_waiting = Game.new
      games << game_waiting
    end
    game_waiting
  end

  # @return [Game] game with the provided id or nil
  def find_game(id)
    games.find { |x| x.id == id }
  end
end
