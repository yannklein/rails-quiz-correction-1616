Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  #
  ## GET /search?query=thriller
  get "/search" => "songs#search"

  # GET /songs/named/thriller
  get "/songs/named/:name" => "songs#search2"

  # get '/songs/new, to: 'songs#new'
  # post '/songs', to: 'songs#create'
  # get '/songs/:id', to: 'songs#show'
  # get '/songs', to: 'songs#index'
  # get '/songs/:id/edit', to: 'songs#edit'
  # put '/songs/:id', to: 'songs#update'
  # delete '/songs/:id', to: 'songs#destroy'
  #
  resources :songs do
    resources :reviews, only: [:new, :create]
  end
end
