Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :purchase, only: [:index]
end