Rails.application.routes.draw do
  resources :trips
  resources :cities

  root to: "trips#index"
end