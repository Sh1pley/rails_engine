Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random_search#show'
        get '/:id/items', to: 'merchant_items#index'
        get '/:id/invoices', to: 'merchant_invoices#index'
      end
      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random_search#show'
        get '/:id/best_day', to: 'best_day#show'
      end
      namespace :customers do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random_search#show'
        get '/:id/invoices', to: 'customer_invoices#index'
        get '/:id/transactions', to: 'customer_transactions#index'
        get '/:id/favorite_merchant', to: 'favorite_merchant#show'
      end
      namespace :transactions do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random_search#show'
        get '/:id/invoice', to: 'transaction_invoice#show'
      end
      namespace :invoice_items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random_search#show'
      end
      namespace :invoices do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random_search#show'
      end
      resources :merchants, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
