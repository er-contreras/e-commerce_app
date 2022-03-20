class CatalogController < ApplicationController
  PER_PAGE = 2

  def index
    @page_title = "Book List"
    @book_pages = params.fetch(:page, 0).to_i
    @books = Book.offset(@book_pages * PER_PAGE).limit(PER_PAGE)

    # @book_pages, @books = paginate :books,
    #   per_page: 10,
    #   include: [:authors, :publisher],
    #   order: "books.id desc"
  end

  def show
    @book = Book.find(params[:id]) rescue nil
    return render(text: "Not found", status: 404) unless @book
    @page_title = @book.title
  end

  def search
  end

  def latest
  end
end
