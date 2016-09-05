Rails.application.routes.draw do
  
  match "/auth/:provider/callback", to: "sessions#create", via: :get
  match "/login" => "sessions#new", as: :login, via: :get
  match "/login-facebook" => redirect("/auth/facebook"), as: :facebookLogin, via: :get
  match "/login-twitter" => redirect("/auth/twitter"), as: :twitterLogin, via: :get
  match "/logout" => "sessions#destroy", as: :logout, via: :get

  resources :products do
    member do
      get :delete
    end
  end

  resources :addresses
  
  resources :orders do 
  	member do
  		get :confirm, as: :confirm 
  	end
  end
  
  resources :order_items

  root "products#index"

end