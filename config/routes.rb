Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
    get  '/help',    to: 'static_pages#help'

  get  '/signup',  to: 'users#new'

  resources :reviews
  resources :products
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
