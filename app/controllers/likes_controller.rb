class LikesController < ApplicationController
  def create
     @user = current_user.id
     @tuto = params[:tuto_id]
     likes = {user_id: @user, tuto_id: @tuto}
     @like = Like.new(likes)

     @like.save!
     if @like.save
       flash[:notice] = "You like this tuto"
       redirect_to tuto_path(@tuto)
     else
       flash[:alert] = "Something went wrong"
       redirect_to tuto_path(@tuto)
     end
   end

  def destroy
    @tuto = Tuto.find(params[:tuto_id])
    @like = @tuto.like.find(params[:id])
    @like.destroy
    redirect_to tuto_path(@tuto)
 end


end
