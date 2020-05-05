Rails.application.routes.draw do

  root :to => "users#new"
  resources :users, only: [:show, :create, :new]
  resources :sessions, only: [:show, :create, :new]
  get '/signin', :to => "sessions#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
