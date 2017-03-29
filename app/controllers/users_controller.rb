class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user)
    @tutos= Tuto.all
  end

  def index
    if current_user.admin == true
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User was successfully deleted"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:avatar_file_name, :first_name, :last_name, :email, :password, :password_confirmation, :current_password )
  end
end
