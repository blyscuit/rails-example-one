Rails.application.routes.draw do

  resources :search_terms do
    collection do
      post :import
    end
  end

  devise_for :users

  namespace :api do
    namespace :v1 do
      post 'products/show'
      post 'search_terms/import'
    end
  end

  # Defines the root path route ("/")
  root to: "home#index"
  get 'exclusive', to: 'exclusive#index'
end
