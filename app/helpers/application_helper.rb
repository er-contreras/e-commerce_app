module ApplicationHelper
  # def add_book_link(text, book)
  #   link_to text, { url: {controller: "cart", action: "add", id: book} },
  #                 { title: "Add to cart", href: url_for( controller: "cart", action: "add", id: book) }
  # end

  def add_book_link(text, book)
    link_to text, url: { controller: 'cart', action: 'add', id: book },
                  title: 'Add to cart', href: url_for(controller: 'cart', action: 'add', id: book), remote: true
  end

  # def remove_book_link(text, book)
  #   link_to text, { url: { controller: "cart", action: "remove", id: book}},
  #                 { title: "Remove book", href: url_for( controller: "cart", action: "remove", id: book) }
  # end

  # def clear_cart_link(text = "Clear Cart")
  #   link_to text, { url: { controller: "cart", action: "clear" } },
  #                 { href: url_for( controller: "cart", action: "clear") }
  # end
end
