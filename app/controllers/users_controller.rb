class UsersController < ApplicationController
  before_action :authenticate_user!
  def show

      @user = User.find(current_user)

  end

  def index
  end

  def full_name
    first_name + last_name
  end

  private
  def params_user
    params.require(:users).permit(:first_name, :last_name, :email, :id)
  end
end
