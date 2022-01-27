Rails.application.routes.draw do
  root "dashboard#index"
  devise_for :customers
  devise_for :users

  scope "/customers" do
    resources :pets, path: "/pets"
  end
end
