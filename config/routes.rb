Rails.application.routes.draw do
  devise_for :users
  root to: "caravans#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "caravans#index"
  resources :caravans, only: [:index, :show, :new, :create, :update, :destroy]
end
