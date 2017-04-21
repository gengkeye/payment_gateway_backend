Rails.application.routes.draw do

  root 'home#index'
  devise_for :users
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  get 'orders' => 'admin/orders#index', as: :user_root
  get 'gateways' => 'admin/gateways#index'

  namespace :admin do
   resources :orders, only: [:index]
   resources :users, only: [:edit, :update]
   resources :gateways, only: [:index, :new, :create] do
     collection do
     end
   end
  end
  resources :docs, only: [:index]
  get 'tos' => 'tos#index'
end
