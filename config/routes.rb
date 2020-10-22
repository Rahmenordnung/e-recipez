Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to: 'pages#home'

  get '/recipes', to: 'recipes#index'
  
  resources :recipes
  
  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]
  
end