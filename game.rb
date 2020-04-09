# frozen_string_literal: true

require "json"
require "securerandom"

class Game
  # @return [String]
  attr_accessor :id     # base64 identifier eg. "x47b"
  # @return [Symbol]
  attr_accessor :state
  # @return [Array<Question>]
  attr_accessor :questions_asked

  def initialize(id = nil)
    self.id = id || SecureRandom.base64(3) # 3 bytes long
    self.state = :waiting_for_players
    self.questions_asked = []
  end

  def waiting_for_players?
    state == :waiting_for_players
  end
end


class PlayerViewOfTheGame
  attr_accessor :id
  attr_accessor :state

  def self.from(game)
    result = PlayerViewOfTheGame.new
    result.id = game.id
    result.state = game.state
    result
  end

  def to_json(options={})
    {
      "id" => id,
      "state" => state
    }.to_json(options)
  end
end
