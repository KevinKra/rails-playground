require 'rails_helper'

describe Artist, type: :model do
  before(:each) do
    @artist_1 = Artist.create(name: "Radiohead")

    @song_1 = @artist_1.songs.create(title: "Weird Fishes", length: 5, play_count: 17981031)
    @song_2 = @artist_1.songs.create(title: "All I Need", length: 5, play_count: 8911103)
    @song_3 = @artist_1.songs.create(title: "Knives Out", length: 3, play_count: 1312975)
    @song_4 = @artist_1.songs.create(title: "15 Step", length: 3, play_count: 33910164)
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :songs }
  end

  describe "instance methods" do
    it ".average_song_length" do
      expect(@artist_1.average_song_length).to eq(4)
    end
  end
end