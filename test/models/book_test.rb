require './test/test_helper'

class BookTest < ActiveSupport::TestCase
  def test_failing_create
    book = Book.new
    assert_equal false, book.save

    assert_equal 7, book.errors.size
    assert book.errors[:title]
    assert book.errors[:publisher]
    assert book.errors[:authors]
    assert book.errors[:published_at]
    assert book.errors[:isbn]
    assert book.errors[:page_count]
    assert book.errors[:price]
  end

  def test_create
    book = Book.new(
      title: 'Ruby for Toddlers',
      publisher_id: Publisher.find(1).id,
      published_at: Time.now,
      authors: Author.all,
      isbn: '123-123-123-1',
      blurb: 'The best book since "Bodo Bär zu Hause"',
      page_count: 12,
      price: 40.4
    )

    assert book.save
  end
end
