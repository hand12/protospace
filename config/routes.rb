Rails.application.routes.draw do
  devise_for :users

  resources :products do
    resources :likes, only: [:create, :destroy]
  end

  root 'products#index'
end
