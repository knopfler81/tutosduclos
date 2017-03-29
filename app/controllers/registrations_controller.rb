class RegistrationsController < Devise::RegistrationsController

  private

  def after_update_path_for(resource)
    if session[:redirect_to].present?
      url = session[:redirect_to]
      session[:redirect_to] = nil
      url
    else
      root_path
    end
  end

  def sign_up_params
   params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email,  :password, :password_confirmation, :current_password)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
