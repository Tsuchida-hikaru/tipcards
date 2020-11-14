Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#index'
  resources :pages, only: :index
  resources :users, only: [:show]
  resources :cards, only: [:create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
