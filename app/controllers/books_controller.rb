class BooksController < ApplicationController

  def new
    @books = Book.all
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id)
    else
    render 'new'
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
