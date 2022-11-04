Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  root to: 'public/items#index'

  namespace :admin do
    resources :items
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
end
