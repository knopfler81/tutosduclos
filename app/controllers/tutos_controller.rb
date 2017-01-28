class TutosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_tuto, only: [:show, :edit, :update, :destroy, :upvote]


  def index
    if params[:search].present?
      @tutos = Tuto.search(params[:search]).includes(:user, :category)
    else
      @tutos = Tuto.all.includes(:user, :category)
    end

    if params[:select].present?
      @tutos = Tuto.joins(:user).where('users.nickname LIKE ?', params[:select])
    else
      @category = Category.all
    end

    if params[:filter].present?
      @tutos = Tuto.joins(:category).where('categories.name LIKE ?', params[:filter])
    else
      @categories = Category.all
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
        format.json { render :show, status: :created, location: @tuto }
      else
        format.html { render :new }
        format.json { render json: @tuto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tuto.update(tuto_params)
        format.html { redirect_to @tuto, notice: 'Tuto was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuto }
      else
        format.html { render :edit }
        format.json { render json: @tuto.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @tuto.destroy
    respond_to do |format|
      format.html { redirect_to tutos_url, notice: 'Tuto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upvote
    @tuto.upvote_by current_user
    redirect_to :back
  end

  private


    def set_tuto
      @tuto = Tuto.find(params[:id])
    end

    def tuto_params
      params.require(:tuto).permit(:title, :content, :id, :user_id, :category_id)
    end
end
