Rails.application.routes.draw do
  namespace :admin do
    resources :tutos
  end

  resources :tutos, only: [:show, :index]

  root "home#landing"


end
