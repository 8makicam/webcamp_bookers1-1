class BookersController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


  def create
    @book = Book.new(book_params)
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to booker_path(@book.id)
    else
      @books = Book.all
     render :index
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to booker_path(@book.id)
    else
     render bookers_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to bookers_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
