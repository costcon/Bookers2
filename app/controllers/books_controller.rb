class BooksController < ApplicationController

  def new
    @book = Book.new
  end
  
  def create
  
    book = Book.new(book_params)
    book.save
    redirect_to user_path(resource)
  end

  def show
  end

  def edit
  end

  def destroy
  end


end
