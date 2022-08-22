# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.create!(name: 'Nyumbani Move', email: 'nyumbanimove.info.com', phone: '0701000000', password: '123456', is_admin: true, is_mover: false, is_client: false)
User.create!(name: 'Moving', email: 'nyumbanimove.info.com', phone: '0701000000', password: '123456', is_admin: false, is_mover: false, is_client: true)
Mover.create!(name: 'Ofisi Move', email: 'ofisimove.info.com', phone: '0701000000', password: '123456', is_admin: true, is_mover: false, is_client: false)

puts 'done seeding'