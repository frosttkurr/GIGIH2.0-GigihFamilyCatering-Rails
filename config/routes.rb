Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "login" => "users#index"
  post "login" => "users#login"
  post "logout" => "users#logout"
end
