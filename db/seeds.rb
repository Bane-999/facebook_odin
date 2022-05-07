# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: "qwe@qwe", password: "qweqwe")
User.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: "qwex@qwex", password: "qweqwe")
User.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: "qwee@qwee", password: "qweqwe")
User.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: "wasd@wasd", password: "qweqwe")
User.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: "asd@asd", password: "qweqwe")