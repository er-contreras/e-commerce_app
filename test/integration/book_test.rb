require './test/test_helper'

class IntegrationBookTest < ActionDispatch::IntegrationTest
  def test_book_administration
    publisher = Publisher.create(name: 'Books for Dummies')
    author = Author.create(first_name: 'Bodo', last_name: 'Bär')

    george = new_session_as(:george)
    ruby_for_dummies = george.add_book book: {
      title: 'Ruby for Dummies',
      publisher_id: publisher.id,
      author_ids: [author.id],
      published_at: Time.now,
      isbn: '123-123-123-x',
      blurb: 'The best book released since "Eating for Dummies"',
      page_count: 123,
      price: 40.4
    }

    george.list_books
    george.show_book ruby_for_dummies

    george.edit_book(ruby_for_dummies, book: {
      title: 'Ruby for Toddlers',
      publisher_id: publisher.id,
      author_ids: [author.id],
      published_at: Time.now,
      isbn: '123-123-123-X',
      blurb: 'The best book released since "Eating for Toddlers"',
      page_count: 123,
      price: 40.4
    })

    bob = new_session_as(:bob)
    bob.delete_book ruby_for_dummies
  end

  private

  module BookTestDSL
    attr_writer :name

    def list_books
      get '/admin/books'
      assert_response :success
    end

    def show_book(book)
      get "/admin/books/#{book.id}"
      assert_response :success
    end

    def edit_book(book, parameters)
      get "/admin/books/#{book.id}/edit"
      assert_response :success

      put "/admin/books/#{book.id}", params: parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end

    def delete_book(book)
      delete "/admin/books/#{book.id}"
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end

    def add_book(parameters)
      author = Author.first
      publisher = Publisher.first

      get '/admin/books/new'
      assert_response :success

      assert_select 'option', attributes: { value: publisher.id }
      assert_select 'select', attributes: { id: 'book[author_ids][]' }

      post '/admin/books', params: parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select 'td', content: parameters[:book][:title]
      Book.find_by_title(parameters[:book][:title])
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(BookTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
