# frozen_string_literal: true

require_relative "question"
require_relative "answer"

class QuestionsGenerator
  def self.next
    Question.new("How old is author of this program?",
                 [Answer.new("26yo", false),
                  Answer.new("30yo", true),
                  Answer.new("34yo", false),
                  Answer.new("38yo", false)])
  end
end
