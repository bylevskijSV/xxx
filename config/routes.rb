Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # post 'pizzas/add_to_cart/:id', to: 'pizzas#add_to_cart', as: 'add_to_cart'
  # delete '/pizzas/remove_from_cart/:id', to: 'pizzas#remove_from_cart', as: 'remove_from_cart'

  resources :menu, only: [:index]
  # resources :pizzas
  resource  :carts, only: [:show]
  resources :orders, only: [:edit, :update]

  resources :order_items
  root 'home#index'
  get 'delivery', to: 'pizzas#delivery'
end
