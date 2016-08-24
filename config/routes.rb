Rails.application.routes.draw do
  resources :orders
  resources :order_items
  resources :products

  root "products#index"

end