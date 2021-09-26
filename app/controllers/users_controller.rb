class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :show]
  before_action :user_check, only: [:edit, :update, :destroy]

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @books = Book.where(user_id: params[:id]).includes(:user)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def set_user
    @user = current_user
  end

  def user_check
    redirect_to user_path(current_user) unless params[:id].to_i == current_user.id
  end
end
