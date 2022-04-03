class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_check, only: [:edit, :update, :destroy]

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @books = Book.where(user_id: params[:id]).includes(:user)
    @user = User.find(params[:id])
    @favorite_books = @user.favorite_books
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def user_check
    user = User.find(params[:id])
    redirect_to user_path(current_user) unless user == current_user
  end
end
