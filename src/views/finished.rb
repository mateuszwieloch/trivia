# frozen_string_literal: true

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
