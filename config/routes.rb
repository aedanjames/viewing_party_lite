Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/register', to: 'users#new'

  get '/login', to: 'users#login'
  post '/login', to: 'users#authenticate_user'
  delete '/login', to: 'users#logout'

  get '/discover', to: 'users#discover'
  get '/movies/:id/viewing_party/new', to: 'viewing_party#new'
  post 'movies/:id/viewing_party/new', to: 'viewing_party#create'
  delete 'viewing_party/:id', to: 'viewing_party#destroy'

  get '/dashboard', to: 'users#show'

  # get '/auth/google_oauth2', to: 'users#authenticate_user_google'
  get '/auth/google_oauth2/callback', to: 'users#authenticate_user_google'

  resources :users, only: [:new, :create]
  resources :movies, only: [:index, :show], controller: :users_movies

end
