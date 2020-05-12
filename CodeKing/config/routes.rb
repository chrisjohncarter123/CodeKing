Rails.application.routes.draw do

  #home
  root "home#index"

  #users
  get "signup", to: "users#new", as: "signup"
  resources :users, only: [:show, :index, :new, :create, :edit, :update, :delete, :destroy]
  #sessions
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  resources :sessions, only: [:new, :create, :destroy]

  #repos
  resources :repos, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    # nested resource for pushes
    resources :pushes, only: [:show, :index, :new, :create, :edit, :update]
  end

  #pushes
  resources :pushes, only: [:show, :index, :new, :create]

end