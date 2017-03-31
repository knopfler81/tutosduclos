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

  def edit
    @tuto = Tuto.find(params[:tuto_id])
    @review = @tuto.reviews.find(params[:id])
  end

  def update
    @tuto = Tuto.find(params[:tuto_id])
    @review = @tuto.reviews.find(params[:id])

    if @review.update(tuto_params)
      format.html { redirect_to @tuto, notice: 'Review was successfully updated.' }
    else
      format.html { render :edit }
    end

  end


  def destroy
    @tuto = Tuto.find(params[:tuto_id])
    @review = @tuto.reviews.find(params[:id])
    @review.destroy

    redirect_to tuto_path(@tuto)
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content)
  end



end
