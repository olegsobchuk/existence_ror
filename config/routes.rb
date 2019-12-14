Rails.application.routes.draw do
  root 'users#index'

  resource :sessions, only: [:new, :create, :destroy]
  resources :users, only: :index

  namespace :admin do
    resources :users, except: :show
    resources :admins, except: :show
    resources :activities, only: [:index, :update]
  end
end
