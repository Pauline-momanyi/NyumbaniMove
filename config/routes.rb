Rails.application.routes.draw do
  namespace :api do 
    post '/signup', to: 'users#create'
    get '/me', to: 'users#show'

    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end

  resources :tests, only: [:index]
end
