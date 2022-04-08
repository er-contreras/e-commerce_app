require './test/test_helper'

class BrowsingAndSearchingTest < ActionDispatch::IntegrationTest
  def test_browsing_the_site
    jill = enter_site(:jill)
    jill.browse_index
    jill.go_to_second_page
    jill.searches_for_tolstoy
    jill.views_latest_books
  end

  def test_getting_details
    jill = enter_site(:jill)
    jill.get_book_details_for 'Pride and Prejudice'
  end

  private

  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def browse_index
      get '/catalog/index'
      assert_response :success
      assert_select 'dl', attributes: { id: 'books' }, children: { count: 10, only: { tag: 'dt' } }
      assert_select 'dt', content: 'The Idiot'

      check_book_links
    end

    def go_to_second_page
      get '/catalog/index?page=2'
      assert_response :success
      assert_equal Book.find_by(title: 'Pro Rails E-Commerce'), books.first

      check_book_links
    end

    def get_book_details_for(title)
      @book = Book.find_or_create_by(id: 1, title: title)
      get "/catalog/show/#{@book.id}"
      assert_response :success

      assert_select 'h1', content: @book.title
      assert_select 'h2', content: "by #{@book.authors.map(&:name)}"
    end

    def searches_for_tolstoy
      leo = Author.find_or_create_by(first_name: 'Leo', last_name: 'Tolstoy')

      get "/catalog/search?q=#{url_encode('Leo Tolstoy')}"
      assert_response :success

      assert_select 'dl', attributes: { id: 'books' }, children: { count: leo.books.size, only: { tag: 'dt' } }

      leo.books.each do |book|
        assert_select 'dt', content: book.title
      end
    end

    def check_book_links
      books.each do |book|
        assert_select 'a', attributes: { href: "/catalog/show/#{book.id}" }
      end
    end

    def views_latest_books
      get '/catalog/latest'
      assert_response :success

      assert_select 'dl', attributes: { id: 'books' }, children: { count: 10, only: { tag: 'dt' } }
      Book.latest.each do |book|
        assert_select 'dt', content: book.title
      end
      check_book_links
    end
  end

  def enter_site(name)
    open_session do |session|
      session.extend(BrowsingTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
