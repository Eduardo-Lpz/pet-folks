Rails.application.routes.draw do
  root "dashboard#index"
  devise_for :users

  resources :users, path: "/users", only: [] do
    resources :shelters, only: [:show, :edit, :update], path: "/shelters" do
      resources :pets, path: "/pets"
    end

    resources :rescuers, only: [:show, :edit, :update], path: "/rescuers" do
      resources :pets, path: "/pets"
    end
  end

  scope "/registrations" do
    resources :registrations, only: [:index], path: "/"
    resources :adopters, only: [:new, :create], path: "/adopter"
    resources :rescuers, only: [:new, :create], path: "/rescuer"
    resources :shelters, only: [:new, :create], path: "/shelter"
  end
end
