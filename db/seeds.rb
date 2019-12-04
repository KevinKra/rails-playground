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