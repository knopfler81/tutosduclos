Rails.application.routes.draw do

  get 'reviews/create'

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
  end

 devise_for :users,
   controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }


   scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do

    root "tutos#landing"

    get "/best_voted", to: "tutos#best_voted"

    resources :tutos do
      resources :reviews, only: [:create, :destroy, :update , :edit]
    end

    resources :tutos, only: [:show]

    # resources :tutos do
    #   member do
    #     put "like", to: "tutos#upvote"
    #   end
    # end

    namespace :users do
      resources :tutos
    end

    as :user do
      get     "/login",     to: "devise/sessions#new", as: :login
      get     "/logout",    to: "devise/sessions#destroy", as: :logout
      get     "/account",   to: "users#show", as: :account
    end
  end

  get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  get '', to: redirect("/#{I18n.default_locale}")
end



