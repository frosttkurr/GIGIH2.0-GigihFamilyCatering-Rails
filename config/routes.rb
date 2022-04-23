Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :orders
      resources :menus
      resources :categories
    end
  end 

  get "/" => "orders#index"
  get "/reports" => "reports#index"
  post "/reports/email" => "reports#show_by_email"
  post "/reports/total-price" => "reports#show_by_range_total_price"
  post "/reports/range-date" => "reports#show_by_range_date"
  
  resources :orders
  resources :menus
  resources :categories
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Login deactivated because can't implemented in RSpec
  # get "login" => "users#index"
  # post "login" => "users#login"
  # post "logout" => "users#logout"

end
