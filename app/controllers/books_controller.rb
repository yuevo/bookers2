class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:edit, :update, :show, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]

  def index
    @books = Book.includes(:user)
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.save
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      @books = Book.includes(:user)
      render :index
    end
  end

  def edit
  end

  def update
    if @book_detail.update(book_params)
      redirect_to book_path(@book_detail.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def show
    @book = Book.new
  end

  def destroy
    if @book_detail.destroy!
      redirect_to books_path
    else
      render :show
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image_id).merge(user_id: current_user.id)
  end

  def set_book
    @book_detail = Book.find(params[:id])
  end

  def user_check
    redirect_to books_path unless @book_detail.user_id == current_user.id
  end
end
