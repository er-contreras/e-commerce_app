module ApplicationHelper
  def add_book_link(text, book)
    link_to text,
            { url: { controller: 'cart', action: 'add', id: book } },
            { title: 'Add to cart', class: 'add_to_cart', href: url_for(controller: 'cart', action: 'add', id: book) }
  end

  # def add_book_link(text, book)
  #   # link_to text, { controller: 'cart', action: 'add', id: book, remote: true }, { class: 'add_to_cart' }
  #   link_to text, add_path(id: book), data: { confirm: 'Are you sure?' }
  # end

  def remove_book_link(text, book)
    link_to text, { url: { controller: 'cart', action: 'remove', id: book } },
            { title: 'Remove book', href: url_for(controller: 'cart', action: 'remove', id: book) }
  end

  def clear_cart_link(text = 'Clear Cart')
    link_to text, { url: { controller: 'cart', action: 'clear' } },
            { href: url_for(controller: 'cart', action: 'clear') }
  end
end
