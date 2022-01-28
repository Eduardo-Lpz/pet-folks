Rails.application.routes.draw do
  root "dashboard#index"
  devise_for :users

  resources :users, path: "/users", only: [] do
    resources :shelters, path: "/shelters" do
      resources :pets, path: "/pets"
    end

    resources :rescuers, path: "/rescuers" do
      resources :pets, path: "/pets"
    end
  end
end
