class BooksController < ApplicationController
  def index
    @books = Book.all

    render json: @books, status: 200
  end

  def destroy
    book = Book.find_by(id: params[:id])
    if book
      book.destroy
      render json: { result: 'book deleted successfully' }, status: 200
    else
      render json: { result: 'book doesn not exist' }, status: 404
    end
  end

  def create
    book = Book.new(books_params)
    if book.save
      render json: { result: 'book created successfully' }, status: 200
    else
      render json: { result: 'the book was not created' }, status: 404
    end  
  end

  private

  def books_params
    params.require(:book).permit(:title, :author, :category)
  end
end
