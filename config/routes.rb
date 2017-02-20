Rails.application.routes.draw do

  #scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
  root "home#landing"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get "/best_voted", to: "tutos#best_voted"
  resources :tutos
  namespace :users do
    resources :tutos
  end

  resources :tutos, only: [:show]

  resources :tutos do
    member do
      put "like", to: "tutos#upvote"
    end
  end



  #end
  # get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  # get '', to: redirect("/#{I18n.default_locale}")
end
