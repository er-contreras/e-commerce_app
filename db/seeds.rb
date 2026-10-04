# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

books_data = [
  {
    title: "Atomic Habits",
    authors: [
      { first_name: "James", last_name: "Clear" }
    ],
    publisher: "Avery",
    published_at: "2018-10-16",
    isbn: "9780735211292",
    blurb: "An Easy & Proven Way to Build Good Habits & Break Bad Ones.",
    page_count: 320,
    price: 27.00,
    position: 1
  },
  {
    title: "The Art of Mindful Living",
    authors: [
      { first_name: "Miao", last_name: "Tsan" }
    ],
    publisher: "Bright Sky Press",
    published_at: "2021-05-15",
    isbn: "9781943021000",
    blurb: "A thoughtful guide to bringing balance and stillness into daily life.",
    page_count: 210,
    price: 18.99,
    position: 2
  },
  {
    title: "Legacy",
    authors: [
      { first_name: "Robert", last_name: "Maxxim" },
    ],
    publisher: "Top Link Publishing",
    published_at: "2018-01-01",
    isbn: "9781234567820",
    blurb: "Episode 1: The search for love.",
    page_count: 391,
    price: 19.99,
    position: 3
  },
  {
    title: "PODER DEL ALMA",
    authors: [
      { first_name: "Rajinder", last_name: "Singh" },
    ],
    publisher: "Radiance",
    published_at: "2013-01-01",
    isbn: "9741234567890",
    blurb: "descubriendo el PODER DEL ALMA por medio de la meditacion",
    page_count: 206,
    price: 24.99,
    position: 4
  }
]

books_data.each do |data|
  publisher = Publisher.find_or_create_by!(name: data[:publisher])

  authors = data[:authors].map do |author_data|
    Author.find_or_create_by!(
      first_name: author_data[:first_name],
      last_name: author_data[:last_name]
    )
  end

  Book.find_or_create_by!(title: data[:title]) do |b|
    b.publisher = publisher
    b.authors = authors
    b.published_at = Time.zone.parse(data[:published_at])
    b.isbn = data[:isbn]
    b.blurb = data[:blurb]
    b.page_count = data[:page_count]
    b.price = data[:price]
    b.position = data[:position]
  end
end

example_books = [
  {
    title: "Example Co-Authored Book",
    authors: [
      { first_name: "Jon", last_name: "Doe" },
    ],
    publisher: "Jon Doe publisher",
    published_at: "2023-01-01",
    isbn: "9781234567890",
    blurb: "A book written by multiple Jon Doe.",
    page_count: 300,
    price: 24.99,
    position: 3
  },
]

template = example_books.first

100.times do |i|
  index = i + 6
  unique_title = "#{template[:title]} #{index}"
  unique_isbn  = "#{template[:isbn].to_s.slice(0, 10) + index.to_s.rjust(3, '0')}"

  publisher = Publisher.find_or_create_by!(name: template[:publisher])

  author = template[:authors].map do |author_example|
    Author.find_or_create_by!(
      first_name: author_example[:first_name],
      last_name: author_example[:last_name]
    )
  end

  Book.find_or_create_by!(title: unique_title, isbn: unique_isbn) do |b|
    b.publisher = publisher
    b.authors = author
    b.published_at = Time.zone.parse(template[:published_at])
    b.blurb = template[:blurb]
    b.page_count = template[:page_count]
    b.price = template[:price]
    b.position = index
  end
end
