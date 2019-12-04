require "rails_helper"

RSpec.describe "the Playlist index page" do
  it "should display all playlists" do
    indie_pop = Playlist.create(name: "Indie Pop")
    art_rock = Playlist.create(name: "Artistic Rock")
    favorites = Playlist.create(name: "Favorites")

    radiohead = Artist.create(name: "Radiohead")
    flora_cash = Artist.create(name: "Flora Cash")

    # create songs and point to artist
    weird_fishes = radiohead.songs.create(title: "Weird Fishes", length: 518, play_count: 17981031)
    all_i_need = radiohead.songs.create(title: "All I Need", length: 238, play_count: 8911103)
    knives_out = radiohead.songs.create(title: "Knives Out", length: 414, play_count: 1312975)
    fifteen_step = radiohead.songs.create(title: "15 Step", length: 357, play_count: 33910164)
    somebody_else = flora_cash.songs.create(title: "You're Somebody Else", length: 344, play_count: 62800949)
    in_slumber = flora_cash.songs.create(title: "Born in Slumber", length: 291, play_count: 643588)

    # shovel songs (with artist foreign id) into playlists
    indie_pop.songs << in_slumber
    indie_pop.songs << somebody_else

    art_rock.songs << weird_fishes
    art_rock.songs << all_i_need
    art_rock.songs << fifteen_step
    art_rock.songs << knives_out

    favorites.songs << weird_fishes
    favorites.songs << in_slumber
    favorites.songs << somebody_else

    visit '/playlists'

    within("#playlist-#{indie_pop.id}") do
      expect(page).to have_content(indie_pop.name)

      within("#song-#{in_slumber.id}") do
        expect(page).to have_content(in_slumber.title)
      end

      within("#song-#{somebody_else.id}") do
        expect(page).to have_content(somebody_else.title)
      end
    end

    within("#playlist-#{art_rock.id}") do
      expect(page).to have_content(art_rock.name)

      within("#song-#{weird_fishes.id}") do
        expect(page).to have_content(weird_fishes.title)
      end

      within("#song-#{all_i_need.id}") do
        expect(page).to have_content(all_i_need.title)
      end

      within("#song-#{knives_out.id}") do
        expect(page).to have_content(knives_out.title)
      end

      within("#song-#{fifteen_step.id}") do
        expect(page).to have_content(fifteen_step.title)
      end
    end

    within("#playlist-#{favorites.id}") do
      expect(page).to have_content(favorites.name)

      within("#song-#{weird_fishes.id}") do
        expect(page).to have_content(weird_fishes.title)
      end

      within("#song-#{somebody_else.id}") do
        expect(page).to have_content(somebody_else.title)
      end
    end
  end
end