# frozen_string_literal: true

require_relative "./acceptance_helper"

describe "New game", type: :feature do
  it "flow" do
    visit "/"
    expect(page).to have_button("new-game")
    click_button("new-game")
    expect(page).to have_current_path(/game\/....$/)
  end
end
