class CatalogController < ApplicationController
  before_action :initialize_cart

  PER_PAGE = 4

  def index
    @page_title = 'Book List'
    @book_pages = params.fetch(:page, 0).to_i
    @books = Book.offset(@book_pages * PER_PAGE).limit(PER_PAGE)
  end

  def show
    @book = begin
      Book.find(params[:id])
    rescue StandardError
      nil
    end
    return render(text: 'Not found', status: 404) unless @book

    @page_title = @book.title
  end

  def search
    @page_title = 'Search'

    return unless params[:commit] == 'Search' || params[:q]

    @books = Book.search_by_title(params[:q].to_s.upcase)
    flash.now[:notice] = 'No books found matching your criteria' unless @books.size.positive?
  end

  def latest
    @page_title = 'Latest Books'
    @books = Book.latest
  end

  def rss
    latest
    render layout: false
  end

  def move
    @book = Book.find(params[:id])
    @book.insert_at(params[:position].to_i)
    head :ok
  end
end
