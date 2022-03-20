require './test/test_helper'

class BrowsingAndSearchingTest < ActionDispatch::IntegrationTest
  def test_browsing_the_site
    jill = enter_site(:jill)
    jill.browse_index
    jill.go_to_second_page
  end

  def test_getting_details
    jill = enter_site(:jill)
    jill.get_book_details_for "Pride and Prejudice"
  end

  private

  module BrowsingTestDSL
    attr_writer :name

    def browse_index
      get "/catalog/index"
      assert_response :success
      assert_select "dl", attributes: { id: "books" }, children: { count: 10, only: { tag: "dt"} }
      assert_select "dt", content: "The Idiot"
    end

    def go_to_second_page
      get "/catalog/index?page=2"
      assert_response :success
      assert_equal Book.find_by(title: "Pro Rails E-Commerce"), books.first
    end

    def get_book_details_for(title)
      @book = Book.find_or_create_by(id: 1, title: title)
      get "/catalog/show/#{@book.id}"
      assert_response :success

      assert_select "h1", content: @book.title
      assert_select "h2", content: "by #{@book.authors.map{|a| a.name}}"
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
