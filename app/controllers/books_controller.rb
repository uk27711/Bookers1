class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      @books = Book.all
      render 'show'
     else
      @books = Book.all
      render 'index'
     end
  end


  def create
    @book = Book.new(book_params)
     if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
     else
      @books = Book.all
      render :index
     end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
    
  end

 private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
