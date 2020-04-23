# frozen_string_literal: true

class WaitingGameView
  def self.from(game)
    {
      status: game.status,
      playersCount: game.players.size
    }
  end
end
