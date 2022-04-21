Rails.application.routes.draw do
  get "menus" => "menus#index"
  get "menus/show" => "menus#show"
  get "menus/new" => "menus#new"
  get "menus/edit" => "menus#edit"
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "login" => "users#index"
  post "login" => "users#login"
  post "logout" => "users#logout"
end
