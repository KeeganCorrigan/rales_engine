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

      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random.json', to: 'random#show'
      end

      resources :invoices, only: [:index, :show] do
        get '/transactions', to: 'invoices/transactions#index'
      end
      
      resources :merchants, only: [:index, :show] do
        get '/revenue', to: 'merchant_revenue#show'
      end

      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
