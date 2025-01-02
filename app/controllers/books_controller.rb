class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new

    if request.post? && params[:book].present?
      @book = Book.new(book_params)
      if @book.save
      flash.now[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
      else
      if @book.errors[:title].any?
      flash.now[:alert] = "Title can't be blank."
    elsif @book.errors[:body].any?
      flash.now[:alert] = "Body can't be blank."
      end
    end
  end
end

  def show
    @book = Book.find(params[:id])
    if params[:id] == 'edit'
      redirect_to edit_books_path(id: 'edit')
    else
    @book = Book.find(params[:id])
    end
  end

  def edit
    @book = Book.find(params[:id])
    if params[:id] == 'edit'
      @book = Book.new
    else
      @book = Book.find(params[:id])
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully created.'
    redirect_to books_path(@book)
    else
      @books = Book.all
      render :index
    end
  end


  def create
    @book = Book.new(book_params)
     if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to books_path(@book.id)
     else
      @books = Book.all
      render :index
     end
  end

  def destroy
    @book = Book.find(params[:id])
    redirect_to books_path(@book.id), notice: 'アイテムが削除されました。'
    @book.destroy
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
