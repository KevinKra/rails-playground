require "rails_helper"

RSpec.describe "songs index page", type: :feature do
  it "can see all songs titles and play count" do
    song_1 = Song.create(title: "Weird Fishes", length: 518, play_count: 17981031)
    song_2 = Song.create(title: "All I Need", length: 238, play_count: 8911103)

    visit "/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_1.length)
    expect(page).to have_content(song_1.play_count)

    expect(page).to have_content(song_2.title)
    expect(page).to have_content(song_2.length)
    expect(page).to have_content(song_2.play_count)
  end
end