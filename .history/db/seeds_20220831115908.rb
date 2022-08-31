# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.create!(name: 'Nyumbani Move', email: 'nyumbanimovers@info.com', phone: '0701000000', password: '1234', is_admin: true, is_client: false, is_mover: false)

Mover.create!(name: 'Ofisi Move', email: 'ofisimove@info.com', phone: '0702000000', password: '1234', is_admin: false, is_client: false, is_mover: true)

Mover.create!(name: 'Movers & Shakers', email: 'shakers@info.com', phone: '0703000000', password: '1234', is_admin: false, is_client: false, is_mover: true)
User.create!(name: 'test', email: 'test@info.com', phone: '0708000000', password: '1234', is_admin: false, is_client: false, is_mover: true)

puts 'done seeding'