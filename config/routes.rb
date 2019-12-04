Rails.application.routes.draw do
  get "/songs", to: "songs#index"

  get "/playlists", to: "playlists#index"
end
