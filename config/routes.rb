Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'cards#index'
  resources :users, only: [:show]
  resources :cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
