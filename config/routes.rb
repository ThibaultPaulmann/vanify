Rails.application.routes.draw do
  devise_for :users
  root to: "caravans#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "caravans#index"
  get "caravans/my_listings", to: "caravans#user_listings", as: :user_listings
  
  resources :caravans, only: [:index, :show, :new, :create, :update, :destroy, :edit] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :destroy]

  
end
