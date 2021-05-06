Rails.application.routes.draw do
  devise_for :users
  root to: 'furimas#index'
<<<<<<< Updated upstream
  #resources :furimas, only: [:index, :new, :create]
=======
  resources :furimas, only: [:index, :new, :create, :show, :edit, :destroy]
>>>>>>> Stashed changes
end
