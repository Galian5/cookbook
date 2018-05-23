Rails.application.routes.draw do
  get 'sessions/new'

  root 'recipes#index'
  resources :recipes
  resources :users
  get '/pages/:page' => 'pages#show'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
