Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    # list several restaurants -> collection
    collection do
      get :top   # /restaurant/top
    end
    # routes for one restaurant
    member do
      get :chef # /restaurant/:id/chef
    end
  end

  resources :restaurant do
    resources :reviews, only: [ :new, :create ]
  end
  # /restaurants/new
  # GET /restaurant/:restaurant_id/reviews/new -> #new
  # GET /restaurant/:restaurant_id/reviews/new -> # create
  resources :reviews, only: [ :destroy ]
  # Shadow Nesting
end
