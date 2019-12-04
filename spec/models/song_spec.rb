require "rails_helper"

RSpec.describe Song do
  before(:each) do
    @artist_1 = Artist.create(name: "Radiohead")

    @song_1 = @artist_1.songs.create(title: "Weird Fishes", length: 518, play_count: 17981031)
    @song_2 = @artist_1.songs.create(title: "All I Need", length: 238, play_count: 8911103)
    @song_3 = @artist_1.songs.create(title: "Knives Out", length: 414, play_count: 1312975)
    @song_4 = @artist_1.songs.create(title: "15 Step", length: 357, play_count: 33910164)
  end

  describe "relationships" do
    it { should belong_to :artist }
    it { should have_many :playlist_songs }
    it { should have_many(:playlists).through(:playlist_songs)}
  end

  describe "class methods" do
    it ".song_count" do
      expect(Song.song_count).to eq(4)
    end
  end



end