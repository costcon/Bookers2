class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]


  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to users_path
    else
      render :show
    end
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
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(params[:id])
      flash[:success] = "profile was successfully updated."
    else
      render :edit
    end
  end

  def index
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  private

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user.id)
    end
  end

end
