Rails.application.routes.draw do
  get 'recipes/new'
  post 'recipes/new'
  root 'recipes#new'
  resources :recipes
  resources :users
end
