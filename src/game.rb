# frozen_string_literal: true

require "securerandom"
require_relative "questions_generator"

class Game
  # Base64 identifier eg. "x47b"
  # @return [String]
  attr_accessor :id

  # One of :waiting_for_players, :question, :answers or :finished
  # @return [Symbol]
  attr_accessor :status

  # Array of player names
  # @return [Array<String>]
  attr_accessor :players

  # Array of Questions that have been asked
  # @return [Array<Question>]
  attr_accessor :questions

  def initialize
    self.id = SecureRandom.base64(3) # 3 bytes long
    self.status = :waiting_for_players
    self.players = []
    self.questions = []
  end

  def waiting_for_players?
    status == :waiting_for_players
  end

  def question_in_progress?
    status == :question
  end

  # @param name [String]
  def add_player(name)
    players << name
  end

  def update
    if status == :waiting_for_players && players.size >= 5
      _ask_question
    end
  end

  def _ask_question
    self.status = :question
    self.questions << QuestionsGenerator.next
  end
end


