Rails.application.routes.draw do
  root 'recipes#index'
  resources :recipes
  resources :users
  get '/pages/:page' => 'pages#show'
end
