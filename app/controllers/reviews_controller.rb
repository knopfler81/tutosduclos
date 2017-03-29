class ReviewsController < ApplicationController

  def create
    @tuto = Tuto.find(params[:tuto_id])
    @review = Review.new(review_params)
    @review.tuto = @tuto
    @review.user = current_user


    if @review.save
      flash[:notice] = 'Review was successfully created.'
      redirect_to @tuto
    else
      #binding.pry
      flash[:notice] = "Error creating review: #{@review.errors}"
      render 'tutos/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
