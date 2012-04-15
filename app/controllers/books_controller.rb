class BooksController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def index
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])

    if @book.save
      redirect_to books_path, :notice => 'The new book was successfully created'
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
      redirect_to books_path, :notice => 'The book was successfully updated'
    else
      render :action => "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])

    @book.destroy
    redirect_to books_path, :notice => "The book was successfully deleted"
  end

end
