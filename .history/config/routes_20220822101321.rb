Rails.application.routes.draw do
<<<<<<< HEAD
=======
  namespace :api do 
    post '/signup', to: 'users#create'
    get '/me', to: 'users#show'

    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    resources :admins, only: [:show]
    resources :users, only: [:index, :create, :show]
  end
  resources :bookings, only: [:index, :show, :create, :update, :destroy]

  resources :tests, only: [:index]

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
>>>>>>> 79030e2cc6b8426c2b7e61136995a76a9900c634
end
