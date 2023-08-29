Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :items
  resources :users, only: %i[show]

  resources :items

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :items, only: [:index, :destroy]
end
