class BooksController < ApplicationController
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.json { render :json => @users }
    end
  end

  def destroy
    book = Book.find_by(id: params[:id])
    if book
      book.destroy
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => { result: 'book deleted successfully' } }
        format.json { render :json => { result: 'book deleted successfully' } }
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => { result: 'book doesn not exist' } }
        format.json { render :json => { result: 'book doesn not exist' } }
      end
    end
  end

  def create
    book = Book.new(books_params)
    if book.save
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => { result: 'book created successfully' } }
        format.json { render :json => { result: 'book created successfully' } }
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => { result: 'the book was not created' } }
        format.json { render :json => { result: 'the book was not created' } }
      end
    end  
  end

  private

  def books_params
    params.require(:book).permit(:title, :author, :category)
  end
end
