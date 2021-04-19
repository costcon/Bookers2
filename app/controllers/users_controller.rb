class UsersController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image_id, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
