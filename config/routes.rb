Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index, :show]

      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random.json', to: 'random#show'
      end

      resources :merchants, only: [:index, :show] do
        get '/revenue', to: 'merchant_revenue#show'
      end

      resources :items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
