Rails.application.routes.draw do
  resources :repos do
    # nested resource for pushes
    resources :pushes, only: [:show, :index, :new]
  end
  resources :pushes
  root "home#index"
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
end