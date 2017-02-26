class TutosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_tuto, only: [:show, :edit, :update, :destroy, :upvote]


  def index
    if params[:query].present?
      filter_tutos
    else
      @tutos = Tuto.all
    end

  end


  def show
    @tuto = Tuto.find(params[:id])
    @user = User.all
  end

  def best_voted
    @tutos = Tuto.all
  end

  def new
    @tuto = Tuto.new
  end

  def edit
  end

  def create
    @tuto = Tuto.new(tuto_params)
    @tuto.user_id = current_user.id

    respond_to do |format|
      if @tuto.save
        flash[:success] = "Test"
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
      @tutos = Tuto.search(params[:query][:keyword]).includes(:user, :category) if params[:query][:keyword].present?
      @tutos = Tuto.joins(:user).where('users.nickname LIKE ?', params[:query][:user]) if params[:query][:user].present?
      @tutos = Tuto.joins(:category).where('categories.name LIKE ?', params[:query][:category]) if params[:query][:category].present?
    end

    def set_tuto
      @tuto = Tuto.find(params[:id])
    end

    def tuto_params
      params.require(:tuto).permit(:title, :content, :id, :user_id, :category_id)
    end
end
