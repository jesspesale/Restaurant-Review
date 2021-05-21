Rails.application.routes.draw do

  root to: "sessions#welcome"
  get '/login' to: "sessions#new"
  post 'login' to: "sessions#create"
  get "/signup" to: "users#new"
   #the resourse :users gives us the post users for users create

  resources :reviews
  resources :restaurants
  resources :users




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
