# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do |i|
  Author.find_or_create_by(first_name: "Jon #{i}", last_name: "Doe #{i}")
end

3.times do |i|
  Publisher.find_or_create_by(name: "O'Reilly #{i}")
end

# 10.times do |i|
#   Book.find_or_create_by(title: "Lord of the rings#{i}",
#                          publisher_id: i,
#                          published_at: "202#{i}-#{i}-#{i + 1}",
#                          isbn: "123-123-12#{i}-x",
#                          blurb: '',
#                          page_count: 123,
#                          price: 321,
#   )
# end
