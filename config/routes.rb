require 'sidekiq/web'

Rails.application.routes.draw do
  get 'joint_escrow' => 'introductions#joint_escrow'

  get 'payments_processing' => 'introductions#payments_processing'

  get 'payroll' => 'introductions#payroll'

  mount Sidekiq::Web => '/sidekiq'
  root 'home#index'
  devise_for :users, controllers: { confirmations: 'confirmations', registrations: 'registrations' }

  get 'orders' => 'admin/orders#index', as: :user_root
  get 'gateways' => 'admin/gateways#index'

  concern :enable_disable do
    post 'disable'
    post 'enable'
  end

  namespace :admin do
   resources :orders, only: [:index]
   resources :users, only: [:edit, :update]
   resources :gateways, only: [:index, :new, :edit, :create] do
     collection do
     end
   end
   resources :withdrawals, concerns: :enable_disable, only: [:index]
  end

  get 'docs' => 'docs#introduction'  
  resources :docs, only: [] do
    collection do 
      get :introduction
      get :overview_of_payment_processing
      get :creating_a_new_gateway

      resources :api, only: [] do
        collection do
          get :signed_request
          get :creating_orders
          get :receiving_order_status_change_callback
          get :checking_order_status_manually
          get :order_websocket
          get :order_cancellation
          get :receiving_last_keychain_id_for_gateway
        end
      end

      resources :developers_api, only: [] do
        collection do 
          get :basic
          get :gateways
          resources :addressproviders, only: [] do
            collection do
              get :list
              resources :cashila, only: [] do
                collection do
                  get :login
                  get :withdraw
                  resources :legalentity, only: [] do
                    collection do
                      get :create_legalentity
                      get :update_legalentity
                      get :get
                    end
                  end
                  resources :individualentity, only: [] do
                    collection do
                      get :create_individualentity
                      get :update_individualentity
                      get :get
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  get 'tos' => 'tos#index'
end
