Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/home/index", to: "home#index"
  root "home#index"
  resources :posts do 
    resources :comments 
  end

  resources :comments do
    resources :replies, only: %i[ new create edit update delete ]
  end
  
  resources :category, only: %i[ index new create edit update ]
end
