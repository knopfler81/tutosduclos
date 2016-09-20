Rails.application.routes.draw do

  namespace :users do
    resources :tutos 
  end

  resources :tutos do
    member do
      put "like", to: "tutos#upvote"
    end
  end

as :user do
  get '/register', to: 'devise/registrations#new', as: :register
  get '/login',    to: 'devise/sessions#new', as: :login
  get '/logout',   to: 'devise/sessions#destroy', as: :logout
end

devise_for :users, skip: [:sessions]

as :user do
  get     "/account"  => "users#show", as: :account
  get     "/login"    => "devise/sessions#new", as: :new_user_session
  post    "/login"    => "devise/sessions#create", as: :user_session
  delete  "/logout"   => "devise/sessions#destroy", as: :destroy_user_session
end

  resources :users
  resources :tutos

  root "home#landing"


end
