Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'user_root' => 'admin/orders#index', as: :user_root

  namespace :admin do
   resources :orders, only: [:index]
  end
end
