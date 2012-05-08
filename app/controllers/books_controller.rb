class BooksController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :all_books, :except => [:destroy]

  def index
    @book = Book.new
    @book.build_inventory(:quantity => nil, :temple_out => nil, :course_out => nil)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @book.build_inventory(:quantity => nil, :temple_out => nil, :course_out => nil)
    render 'edit'
  end

  def create
    @book = Book.new(params[:book])

    if @book.save
      @new_book = Book.new
      @new_book.build_inventory(:quantity => nil, :temple_out => nil, :course_out => nil)
    else
      @book.build_inventory unless @book.inventory
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
      @new_book = Book.new
      @new_book.build_inventory(:quantity => nil, :temple_out => nil, :course_out => nil)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, :notice => "The book was successfully deleted"
  end

  protected

  def all_books
    @books = Book.page(params[:page])
  end

end
