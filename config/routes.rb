Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"
  resources :users, only: [:index,:show,:new]
  resources :items, only: [:index]
  resources :purchase, only: [:index]
end
