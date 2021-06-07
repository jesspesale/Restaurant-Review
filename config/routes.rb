Rails.application.routes.draw do

  root to: "sessions#welcome"
  get '/login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get "/signup", to: "users#new"
   #the resourse :users gives us the post users for users create

  # get "/auth/google_oauth2/callback", to:   'sessions#google' 
  # Routes for Google authentication
get 'auth/:provider/callback', to: 'sessions#google'
get 'auth/failure', to: redirect('/')

  delete '/logout', to: "sessions#destroy"

  resources :reviews
  resources :restaurants do 
    resources :reviews, only: [:new, :index]
  end

  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
