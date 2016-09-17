class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :profile_name, :email, :password,
      :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :profile_name, :email, :password,
      :password_confirmation, :remember_me)  }
  end
end