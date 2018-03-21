Rails.application.routes.draw do
  get 'sessions/new'

  #main page
  root 'static_pages#home'
  #end main page

  #yelp api
  post '/', to: 'static_pages#home'
  #end

  #static pages
  get '/products', to: 'products#index'
  get  '/contact',    to: 'static_pages#contact'
  #end static pages

  #login
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #end login

  #updating a product
  # post '/products', to: 'products#index'
  post '/products/create', to: 'products#create', as: :create_product
  #end

  resources :reviews
  resources :products
  resources :users
end
