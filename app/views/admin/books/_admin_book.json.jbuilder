json.extract! book, :id, :created_at, :updated_at
json.url admin_book_url(book, format: :json)
