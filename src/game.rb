# frozen_string_literal: true

require "json"
require "securerandom"

class Game
  # @return [String]
  attr_accessor :id      # base64 identifier eg. "x47b"
  # @return [String]
  attr_accessor :status  # waiting_for_players, question, answers or finished
  # @return [Array<String>]
  attr_accessor :players
  # @return [Array<Question>]
  attr_accessor :questions_asked

  def initialize(id = nil)
    self.id = id || SecureRandom.base64(3) # 3 bytes long
    self.status = :waiting_for_players
    self.players = []
    self.questions_asked = []
  end

  def waiting_for_players?
    status == :waiting_for_players
  end

  # @param name [String]
  def add_player(name)
    players << name
  end
end


class WaitingGameView
  def self.from(game)
    {
      status: game.status,
      playersCount: game.players.size
    }
  end
end

class QuestionGameView
  def self.from(game)
    {
      status: game.status,
      question_number: 0,
      question: "How old are you?",
      answers: ["5yo", "15yo", "30yo", "very old"]
    }
  end
end

class AnswersGameView
  def self.from(game)
    {
      status: game.status,
      question: "How old are you?",
      answers: [
        {
          answer: "5yo",
          count: 2,
          correct: false
        },
        {
          answer: "15yo",
          count: 0,
          correct: false
        },
        {
          answer: "30yo",
          count: 1,
          correct: true
        },
        {
          answer: "very old",
          count: 0,
          correct: false
        },
        {
          answer: "unanswered",
          count: 2,
          correct: false
        }
      ]
    }
  end
end

class FinishedGameView
  def self.from(game)
    {
      status: game.status,
      stats: [
        {
          question: "How old are you?",
          answers: [
            {
              answer: "5yo",
              count: 2,
              correct: false
            },
            {
              answer: "15yo",
              count: 0,
              correct: false
            },
            {
              answer: "30yo",
              count: 1,
              correct: true
            },
            {
              answer: "very old",
              count: 0,
              correct: false
            },
            {
              answer: "unanswered",
              count: 2,
              correct: false
            }
          ]
        }
      ]
    }
  end
end
