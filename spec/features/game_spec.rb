# frozen_string_literal: true

require_relative "./acceptance_helper"

describe "the Join Game page", type: :feature do

  it "navigates to the Lobby page upon joining" do
    visit "/"
    fill_in("Name", with: "Mateusz")
    click_button("Join")
    expect(page).to have_selector("div#lobby.visible")
  end

  it "doesn't navigate unless name provided" do
    visit "/"
    click_button("Join")
    expect(page).not_to have_selector("div#lobby.visible")
  end
end
