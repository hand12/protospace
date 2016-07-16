 Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]

  namespace :products do
    resources :newest, only: :index
  end

  resources :products do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end

  resources :tags

  root 'products#index'
end
