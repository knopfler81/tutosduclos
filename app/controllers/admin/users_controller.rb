class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy!
    respond_to do |format|
      format.html { redirect_to userss_url, notice: 'User was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
  def params_user
    params.require(:users).permit(:first_name, :last_name, :email, :id)
  end
end
