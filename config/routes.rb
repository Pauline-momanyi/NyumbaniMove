Rails.application.routes.draw do
  namespace :api do 
    post '/signup', to: 'users#create'
    get '/me', to: 'users#show'

    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    resources :admins, only: [:show, :index]
    resources :users, only: [:index, :create, :show]
    resources :movers, only: [:index, :show, :create, :update, :destroy]
    resources :bookings, only: [:index, :show, :create, :update, :destroy]
  end
  
 

  resources :tests, only: [:index, :show]
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
