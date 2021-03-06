Rails.application.routes.draw do
  root 'sessions#home'

  resources :users, only: [:new, :create]
  resources :tickers, only: [:index, :show, :update]

  resources :tags, only: [:index, :edit, :update, :destroy] do
    resources :tickers, only: [:index], module: "tag"
  end

  resources :sectors, only: [:index] do
    resources :tickers, only: [:index], module: "sector"
  end

  resources :industries, only: [:index] do
    resources :tickers, only: [:index], module: "industry"
  end
  
  resources :securities, only: [:index] do
    resources :tickers, only: [:index], module: "security"
  end

  namespace :admin do
    resources :securities, only: [:new, :create, :destroy, :edit, :update]
    resources :users, only: [:edit, :update, :destroy]
    resources :sectors, only: [:new, :create, :destroy, :edit, :update]
    resources :industries, only: [:new, :create, :destroy, :edit, :update]
  end

  get '/home', to: 'sessions#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  get '/console', to: 'sessions#console'
  get '/search', to: 'tickers#search'
end
