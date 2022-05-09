Rails.application.routes.draw do
  resources :friendships, only: [:create, :index]
  resources :users, only: [:index]
  devise_for :users, controllers: {registrations: "registrations"}
  resources :posts
  resources :friend_requests, only: [:create, :index]
  
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
    get '/sign-in' => "devise/sessions#new", :as => :login
  end

  root "users#index"
end
