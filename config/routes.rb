Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to: 'pages#home'

  get '/recipes', to: 'recipes#index'
  
  resources :recipes
  
  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
end