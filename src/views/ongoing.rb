# frozen_string_literal: true

class OngoingGameView
  def self.from(game)
    result = {
      status: game.status,
      question_number: game.questions.size,
      body: game.questions.last.body,
      answers: []
    }
    if game.question_in_progress?

    else
      result = {
        status: game.status,
        question_number: game.questions_asked.length,
      }
      return {
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

