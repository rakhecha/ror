Rails.application.routes.draw do

  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy's
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    # resources :users, only: [:new, :create, :index, :show]
    resources :sessions, only: [:new, :create, :destroy]

    get "/admin", to: "sessions#new"
    get "/user/logout", to: "sessions#destroy"
    get "/dashboard", to: "dashboard#index"

    # Client routes
    resources :clients
    # Invoice routess
    resources :invoices

end


