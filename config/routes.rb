Rails.application.routes.draw do
  get 'recipes/new'
  root 'recipes#new'
  resources :recipes
  resources :users
end
