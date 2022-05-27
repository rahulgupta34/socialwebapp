Rails.application.routes.draw do
  get 'comments/new'
  
  devise_for :users, :controllers => {:registrations => "registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/home/index", to: "home#index"
  root "home#index"
  resources :posts do 
    resources :comments 
  end
  
end
