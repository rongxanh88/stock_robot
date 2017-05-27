Rails.application.routes.draw do
  root 'sessions#home'

  resources :users, only: [:new, :create]
  resources :tickers, only: [:index, :show]

  resources :sectors, only: [:index] do
    resources :tickers, only: [:index], module: "sector"
  end

  resources :industries, only: [:index] do
    resources :tickers, only: [:index], module: "industry"
  end
  
  resources :securities, only: [:index] do
    resources :tickers, only: [:index], module: "security"
  end

  resources :securities, only: [:new, :create, :destroy], as: "admin_security"

  get '/home', to: 'sessions#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
