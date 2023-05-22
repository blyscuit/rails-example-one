Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'products/show'
    end
  end

  resources :search_terms do
    collection do
      post :import
      post :newv
    end
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  get 'exclusive', to: 'exclusive#index'
end
