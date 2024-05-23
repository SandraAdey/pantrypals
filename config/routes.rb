Rails.application.routes.draw do
  devise_for :users

  resources :favorites, only: [:index, :create, :destroy]

  root to: "recipes#index"

  resources :recipes do
    resources :reviews, only: :create
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
