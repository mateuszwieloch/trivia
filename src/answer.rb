# frozen_string_literal: true

class Answer
  # @return [String]
  attr_accessor :body
  # @return [Boolean]
  attr_accessor :is_correct
  # @return [Array<String>]
  attr_accessor :guessed_by

  def initialize(body, is_correct)
    self.body = body
    self.is_correct = is_correct
  end
end
