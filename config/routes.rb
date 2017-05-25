Rails.application.routes.draw do
  root 'sessions#home'

  resources :users, only: [:new, :create]
  resources :tickers, only: [:index]

  get '/home', to: 'sessions#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
