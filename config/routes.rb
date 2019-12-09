Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  get 'purchase', to: 'purchase#index'
end