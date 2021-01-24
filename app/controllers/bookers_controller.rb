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
      redirect_to booker_path(@book.id)
    else
      render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
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
