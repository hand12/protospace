Rails.application.routes.draw do
  root 'top#index'

  get  '/top'               =>    'top#index'
  get  '/proto'             =>    'protoes#index'
  get  '/proto/new'         =>    'protoes#new'
end
