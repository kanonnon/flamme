Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:show, :new, :create]
  
  resources :posts do
    collection do
      get :ranking
    end
  end
  resources :favorites, only: [:create, :destroy]
end