Rails.application.routes.draw do
  resources :trips do
    resources :packs
  end
  resources :items
  resources :cities
  resources :users
  resources :sessions

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"

  root to: "trips#index"
end