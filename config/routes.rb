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
        get '/revenue', to: 'revenue#show'
        get '/most_items', to: 'most_items#index'
        get '/most_revenue', to: 'revenue#index'
        get '/:id/revenue', to: 'merchant_revenue#show'
      end
      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random_search#show'
        get '/:id/merchant', to: 'item_merchant#show'
        get '/:id/invoice_items', to: 'item_invoice_items#index'
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
        get '/:id/invoice', to: 'invoice_item_invoice#show'
        get '/:id/item', to: 'invoice_item_item#show'
      end
      namespace :invoices do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random_search#show'
        get '/:id/transactions', to: 'invoices_transactions#index'
        get '/:id/merchant', to: 'invoices_merchant#show'
        get '/:id/invoice_items', to: 'invoices_invoice_items#index'
        get '/:id/items', to: 'invoices_items#index'
        get '/:id/customer', to: 'invoices_customer#show'
      end
      resources :merchants, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      
    end
  end
end
