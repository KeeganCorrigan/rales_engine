Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random.json', to: 'random#show'
      end

      namespace :transactions do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random.json', to: 'random#show'
      end

      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random.json', to: 'random#show'
      end


      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random.json', to: 'random#show'
      end

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random.json', to: 'random#show'
      end

      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random.json', to: 'random#show'
      end

      resources :invoices, only: [:index, :show] do
        get '/transactions', to: 'invoices/transactions#index'
        get '/invoice_items', to: 'invoices/invoice_items#index'
        get '/items', to: 'invoices/items#index'
        get '/customer', to: 'invoices/customers#show'
        get '/merchant', to: 'invoices/merchants#show'
      end

      resources :invoice_items, only: [:index, :show] do
        get '/invoice', to: 'invoice_items/invoices#show'
        get '/item', to: 'invoice_items/items#show'
      end

      resources :items, only: [:index, :show] do
        get '/invoice_items', to: 'items/invoice_items#index'
        get '/merchant', to: 'items/merchants#show'
      end

      resources :merchants, only: [:index, :show] do
        get '/revenue', to: 'merchant_revenue#show'
        get '/items', to: 'merchants/items#index'
        get '/invoices', to: 'merchants/invoices#index'
        get '/favorite_customer', to: 'merchants/favorite_customers#show'
      end

      resources :transactions, only: [:index, :show] do
        get '/invoice', to: 'transactions/invoices#show'
      end

      resources :customers, only: [:index, :show] do
        get '/invoices', to: 'items/invoices#index'
        get '/transactions', to: 'items/transactions#index'
      end
    end
  end
end
