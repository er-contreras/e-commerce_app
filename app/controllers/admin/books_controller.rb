class Admin::BooksController < ApplicationController
  before_action :set_admin_book, only: %i[ show edit update destroy ]

  # GET /admin/books or /admin/books.json
  def index
    @books = Book.all
  end

  # GET /admin/books/1 or /admin/books/1.json
  def show
    @page_title = @book.title
    @book = Book.find(params[:id])
  end

  # GET /admin/books/new
  def new
    @book = Book.new
    @publishers = Publisher.all
    @authors = Author.all
  end

  # GET /admin/books/1/edit
  def edit
    @book = Book.find(params[:id])
    @publishers = Publisher.all
    @authors = Author.all
  end

  # POST /admin/books or /admin/books.json
  def create
    @book = Book.new(admin_book_params)
    @publishers = Publisher.all
    @authors = Author.all

    respond_to do |format|
      if @book.save
        format.html { redirect_to admin_books_url, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/books/1 or /admin/books/1.json
  def update
    respond_to do |format|
      if @book.update(admin_book_params)
        format.html { redirect_to admin_book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/books/1 or /admin/books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to admin_books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_book_params
      # params.fetch(:book, {})
      params.require(:book).permit(:title, :publisher_id, :published_at, :isbn, :blurb, :page_count, :price, author_ids: [])
    end
end
