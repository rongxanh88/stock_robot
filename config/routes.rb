Rails.application.routes.draw do
  root 'sessions#home'

  resources :users, only: [:new, :create]

  get '/home', to: 'sessions#home'
  get '/login', to: 'sessions#new'
end
