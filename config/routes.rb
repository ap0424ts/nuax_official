Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  root to: 'public/items#index'

  namespace :admin do
    resources :items
  end

  namespace :public do
    resources :carts, only: [:show]do
    end
    resources :items, only: [:index, :show] do
      get '/my_cart' => 'carts#my_cart'
      post '/add_item' => 'carts#add_item'
      post '/update_item' => 'carts#update_item'
      delete '/delete_item' => 'carts#delete_item'
      resources :orders, only: [:index, :create]
    end
  end

  resources :collections, only: [:index, :new, :create, :destroy]

end
