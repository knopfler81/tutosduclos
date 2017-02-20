Rails.application.routes.draw do

  #scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
  root "home#landing"
  devise_for :users,  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, skip: [:sessions]

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

 get     "/account",   to: "users#show", as: :account



  #end
  # get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  # get '', to: redirect("/#{I18n.default_locale}")
end

# Rails.application.routes.draw do

#   scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
#     get "/best_voted", to: "tutos#best_voted"
#     resources :tutos
#     namespace :users do
#       resources :tutos
#     end

#     resources :tutos, only: [:show]

#     resources :tutos do
#       member do
#         put "like", to: "tutos#upvote"
#       end
#     end

#   as :user do
#     get     "/register",  to: "devise/registrations#new", as: :register
#     get     "/login",     to: "devise/sessions#new", as: :login
#     get     "/logout",    to: "devise/sessions#destroy", as: :logout
#     get     "/account",   to: "users#show", as: :account
#     get     "/login" ,    to: "devise/sessions#new", as: :new_user_session
#     post    "/login" ,    to: "devise/sessions#create", as: :user_session
#     delete  "/logout" ,   to: "devise/sessions#destroy", as: :destroy_user_session
#   end

#     devise_for :users, skip: [:sessions]

#     resources :users

#     root "home#landing"
#   end
#   get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
#   get '', to: redirect("/#{I18n.default_locale}")
# end



