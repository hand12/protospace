Rails.application.routes.draw do
  devise_for :users

  resources :products do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end

  root 'products#index'
end
