Rails.application.routes.draw do
  root 'users#index'

  resource :sessions, only: [:new, :create, :destroy]
  resources :users, only: :index

  namespace :admins do
    resources :users
  end
end
