class BooksController < ApplicationController

  def index
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
    @user = current_user
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to book_path(@book.id)
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image_id, :introduction)
  end


end
