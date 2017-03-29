class TutosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_tuto, only: [:show, :edit, :update, :destroy, :upvote]

  def landing
    @tutos = Tuto.last(2)
  end

  def index
    filter_tutos if params[:query].present?
    @tutos ||= Tuto.all
  end


  def show
    @tuto = Tuto.find(params[:id])
    @user = User.all
    @review = Review.new
  end

  def best_voted
    @tutos = Tuto.all
  end

  def new
    if current_user.completed_profile?
      @tuto = Tuto.new
    else
      redirect_to edit_user_registration_path, alert: 'Please complete your profile to create a tuto'
    end
  end

  def edit
  end

  def create
    @tuto = Tuto.new(tuto_params)
    @tuto.user_id = current_user.id
    respond_to do |format|
      if @tuto.save
        format.html { redirect_to @tuto, notice: 'Tuto was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tuto.update(tuto_params)
        format.html { redirect_to @tuto, notice: 'Tuto was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @tuto.destroy
    respond_to do |format|
      format.html { redirect_to tutos_url, notice: 'Tuto was successfully destroyed.' }
    end
  end


  def upvote
    @tuto.upvote_by current_user
    redirect_to :back
  end

  private

    def filter_tutos
      return if params[:query].blank?
      @tutos = Tuto.search(params[:query][:keyword]).includes(:user, :category) if params[:query][:keyword].present?
      @tutos = Tuto.joins(:user).where('users.nickname LIKE ?', params[:query][:user]) if params[:query][:user].present?
      @tutos = Tuto.joins(:category).where('categories.name LIKE ?', params[:query][:category]) if params[:query][:category].present?
    end

    def set_tuto
      @tuto = Tuto.find(params[:id])
    end

    def tuto_params
      params.require(:tuto).permit(:title, :description, :content, :user_id, :category_id)
    end
end
