class Admin::UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def params_user
    params.require(:users).permit(:first_name, :last_name, :email, :id)
  end
end
