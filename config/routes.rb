Rails.application.routes.draw do
  resources :posts
  devise_for :users, :controllers => {:registrations => "registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/home/index", to: "home#index"
  root "home#index"
end
