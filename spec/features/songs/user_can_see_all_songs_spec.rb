require "rails_helper"

RSpec.describe "songs index page", type: :feature do
  it "can see all songs titles and play count" do
    artist_1 = Artist.create(name: "Radiohead")

    song_1 = artist_1.songs.create(title: "Weird Fishes", length: 518, play_count: 17981031)
    song_2 = artist_1.songs.create(title: "All I Need", length: 238, play_count: 8911103)
    song_3 = artist_1.songs.create(title: "Knives Out", length: 414, play_count: 1312975)
    song_4 = artist_1.songs.create(title: "15 Step", length: 357, play_count: 33910164)

    visit "/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_1.length)
    expect(page).to have_content(song_1.play_count)

    expect(page).to have_content(song_2.title)
    expect(page).to have_content(song_2.length)
    expect(page).to have_content(song_2.play_count)
  end
end