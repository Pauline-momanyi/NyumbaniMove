Rails.application.routes.draw do
  resources :bookings, only: [:index, :show, :create, :update, :destroy]
end
