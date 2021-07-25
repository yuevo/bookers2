class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:edit, :update, :show, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.save
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      @books = Book.all
      render :index
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def show
    @new_book = Book.new
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image_id).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def user_check
    redirect_to books_path unless @book.user_id == current_user.id
  end
end
