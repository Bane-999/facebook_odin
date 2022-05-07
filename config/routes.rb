Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  resources :posts
  
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
    get '/sign-in' => "devise/sessions#new", :as => :login
  end

  root "posts#index"
end
