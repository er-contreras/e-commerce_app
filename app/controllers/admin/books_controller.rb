class Admin::BooksController < ApplicationController
  before_action :set_admin_book, only: %i[show edit update destroy]

  def index
    @page_title = 'Listing books'
    @books = Book.includes(:publisher)
  end

  def show
    @book = Book.find(params[:id])
    @page_title = @book.title.to_s
  end

  def new
    @book = Book.new
    @publishers = Publisher.all
    @authors = Author.all
  end

  def edit
    @page_title = 'Editing book'
    @book = Book.find(params[:id])
    @publishers = Publisher.all
    @authors = Author.all
  end

  def create
    @book = Book.new(admin_book_params)
    @publishers = Publisher.all
    @authors = Author.all

    respond_to do |format|
      if @book.save
        format.html { redirect_to admin_books_url, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(admin_book_params)
        format.html { redirect_to admin_book_url(@book), notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to admin_books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_book
    @book = Book.find(params[:id])
  end

  def admin_book_params
    params.require(:book).permit(
      :title,
      :publisher_id,
      :published_at,
      :isbn,
      :blurb,
      :page_count,
      :price,
      :cover_image,
      author_ids: []
    )
  end
end
