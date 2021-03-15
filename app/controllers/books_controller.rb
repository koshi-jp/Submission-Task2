class BooksController < ApplicationController
  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: 'successfully create'
    else
      @book_new = @book
      @books = Book.all
      render :index
    end
  end

  def index
    @book_new=Book.new
    @books=Book.all
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
       redirect_to book, notice: 'successfully update'
    else
      @book = book
      render :edit
    end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    if @book.destroy
      redirect_to books_path(@book), notice: 'successfully destroy'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
