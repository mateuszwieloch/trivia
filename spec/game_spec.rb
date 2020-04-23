# frozen_string_literal: true

require "./src/game"

RSpec.describe Game do
  describe "constructor" do
    it "initializes the id field" do
      expect(subject.id.size).to be > 3
    end

    it "sets status to :waiting_for_players" do
      expect(subject.status).to eq(:waiting_for_players)
    end
  end

  describe "#add_player" do
    it "adds player name to players field" do
      subject.add_player("Alex")
      subject.add_player("Becca")
      expect(subject.players).to include("Alex")
      expect(subject.players).to include("Becca")
    end
  end

  describe "#update" do
    context "in waiting_for_players status" do
      it "changes status if enough players joined" do
        subject.add_player("first")
        subject.add_player("second")
        subject.add_player("third")
        subject.add_player("fourth")
        subject.update
        expect(subject.status).to eq(:waiting_for_players)
        subject.add_player("fifth")
        subject.update
        expect(subject.status).to eq(:question)
      end
    end
  end
end
