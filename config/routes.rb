Rails.application.routes.draw do

  root to: "sessions#welcome"
  get '/login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get "/signup", to: "users#new"
  
  get 'auth/:provider/callback', to: 'sessions#google'
  get 'auth/failure', to: redirect('/')
  
  delete '/logout', to: "sessions#destroy"
  
  get '/restaurants/ordered', to: "restaurants#ordered"

  resources :reviews
  resources :restaurants do 
    resources :reviews, only: [:new, :index]
  end
  
  resources :users
  #the resourse :users gives us the post users for users create (to go with new above)
  

end
