Rails.application.routes.draw do
  get 'street_addresses/index'
  devise_for :users
  root to: 'furimas#index'
  resources :furimas do
    resources :purchases, only: [:create, :index, :create]
  end
  resources :street_addresses, only: [:index, :new]
end
