Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications, :home
  end

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
      resources :users, only: %i[create]
      resources :search_terms do
        collection do
          get :match
          get :my_words
          get :words
        end
      end
      get 'user/me'
      post 'keyword/crawl'
    end
  end

  # Defines the root path route ("/")
  root to: "home#index"
  get 'exclusive', to: 'exclusive#index'
end
