class Cart < ApplicationRecord
  has_many :cart_items
  has_many :books, through: :cart_items

  def total
    cart_items.inject(0) { |sum, n| (n.price * n.amount) + sum }
  end

  def add(book_id)
    items = cart_items.find_by(book_id: book_id)
    book = Book.find(book_id)

    if items.to_s.empty?
      ci = cart_items.create(book_id: book_id, amount: 1, price: book.price)
    else
      ci = items
      ci.update_attribute(:amount, ci.amount + 1)
    end
    ci
  end
end
