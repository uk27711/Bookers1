class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = @books.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.index(book_params)
    if @book.save
    redirect_to book_path(@book.id)
    else
    render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
  end

private
  def book_params
    params.permit(:title, :body)
  end
end
