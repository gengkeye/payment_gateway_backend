Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'orders' => 'admin/orders#index', as: :user_root

  namespace :admin do
   resources :orders, only: [:index]
   resources :gateways, only: [:index]
   resources :users, only: [:edit]
   resources :docs, only: [:index]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'tos' => 'tos#index'
end
