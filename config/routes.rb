Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :items do
    resources :offers, except: %i[update]
    patch "offers/:id", to: "offers#update", as: :edit_offer
    collection do
      get 'category/:category', to: 'items#category'
    end
  end

  resources :users, only: %i[index show]

  get 'offers', to: 'pages#offers'
  resources :offers, only: %i[index], controller: "user_offers" do
    post 'approve', to: 'pages#approve'
    post 'decline', to: 'pages#decline'
  end


  # Add the following route for the video file
  get '/video/bg_video.mp4', to: redirect('https://www.example.com/videos/bg_video.mp4')

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
