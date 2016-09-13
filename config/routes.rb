Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :tutos
    resources :dashboard
  end

  resources :tutos

  root "home#landing"


end
