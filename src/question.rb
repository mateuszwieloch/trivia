# frozen_string_literal: true

class Question
  # @return [String]
  attr_accessor :body
  # @return [Array<String>]
  attr_accessor :answers

  def initialize(body, answers)
    self.body = body
    self.answers = answers
  end
end
