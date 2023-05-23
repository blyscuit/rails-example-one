Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'products/show'
      post 'search_terms/import'
    end
  end

  resources :search_terms do
    collection do
      post :import
    end
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  get 'exclusive', to: 'exclusive#index'
end
