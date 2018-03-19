Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  get '/products', to: 'products#index'
  get  '/contact',    to: 'static_pages#contact'

  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/products', to: 'products#index'

  resources :reviews
  resources :products
  resources :users
end
