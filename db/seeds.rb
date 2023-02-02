# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.find_or_create_by(first_name: "James", last_name: "Clear")
Author.find_or_create_by(first_name: "Miao", last_name: "Tsan")

Publisher.find_or_create_by(name: "Avery")
Publisher.find_or_create_by(name: "Bright Sky Press")
