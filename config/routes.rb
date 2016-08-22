Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :tutos

    root to: "tutos#index"
  end

  resources :tutos, only: [:show, :index]

  root "home#landing"


end
