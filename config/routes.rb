Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    get '', to: 'tutos#index', as: '/'
    resources :tutos
  end

  resources :tutos

  root "home#landing"


end
