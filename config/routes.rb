Rails.application.routes.draw do
  root "dashboard#index"
  devise_for :customers
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
