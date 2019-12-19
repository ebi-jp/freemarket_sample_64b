Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"
  resources :users, only: [:index,:show]
  resources :items, only: [:index]
  resources :purchase, only: [:index]
  # resources :card, only: [:index]
  # get 'card', to: 'card#index'
  get 'card', to: 'card#index'
  post 'show', to: 'card#show'
  post 'pay', to: 'card#pay'
  post 'delete', to: 'card#delete'
end
