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

  # Unit Testing the One-to-Many Mapping
  def test_has_many_and_belongs_to_mapping
    apress = Publisher.find_by(name: 'Apress')
    assert_equal 2, apress.books.size

    book = Book.new(
      title: 'Rails E-Commerce 3nd Edition',
      authors: [
        Author.find_or_create_by(first_name: 'Christian', last_name: 'Hellsten'),
        Author.find_or_create_by(first_name: 'Jarkko', last_name: 'Laine')
      ],
      published_at: Time.now,
      isbn: '123-123-123-x',
      blurb: 'E-Commerce on Rails',
      page_count: 300,
      price: 30.5
    )

    apress.books << book

    apress.reload
    book.reload

    assert_equal 3, apress.books.size
    assert_equal 'Apress', book.publisher.name
  end

  # Unit Testing the Many-to-Many Mapping
  def test_has_and_belongs_to_many_authors_mapping
    book = Book.new(
      title: 'Rails E-Commerce 3nd Edition',
      publisher: Publisher.find_by(name: 'Apress'),
      authors: [
        Author.find_or_create_by(first_name: 'Christian', last_name: 'Hellsten'),
        Author.find_or_create_by(first_name: 'Jarkko', last_name: 'Laine')
      ],
      published_at: Time.now,
      isbn: '123-123-123-x',
      blurb: 'E-Commerce on Rails',
      page_count: 300,
      price: 30.5
    )

    assert book.save

    book.reload

    assert_equal 2, book.authors.size
    assert_equal 1, Author.find_by(first_name: 'Christian', last_name: 'Hellsten').books.size
  end

  def test_ferret
    # Book.rebuild_index

    assert Book.find_or_create_by(title: 'Pride and Prejudice')

    assert_difference 'Book.count' do
      book = Book.new(title: 'The Success of Open Source', published_at: Time.now, page_count: 500, price: 59.99,
                      isbn: '0-674-01292-5')

      book.authors << Author.create(first_name: 'Steven', last_name: 'Weber')
      book.publisher = Publisher.find(1)
      assert book.valid?
      book.save

      assert_equal 1, Book.search_by_title('Open Source').size
      assert_equal 1, Book.search_by_authors('Steven Weber').size
    end
  end
end
