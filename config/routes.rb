Rails.application.routes.draw do
  namespace :admin do
    resources :tutos

    root to: "tutos#index"
  end

  resources :tutos, only: [:show, :index]

  root "home#landing"


end
