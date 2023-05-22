Rails.application.routes.draw do

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
