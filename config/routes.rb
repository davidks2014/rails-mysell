Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :items do
    collection do
      get 'category/:category', to: 'items#category'
    end
  end

  resources :users, only: %i[show]

  resources :items do
    resources :offers, only: %i[new create index]
  end

  resources :offers, only: %i[destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :items, only: %i[index destroy]
end
