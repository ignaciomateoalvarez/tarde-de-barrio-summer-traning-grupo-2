# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.create(first_name: "Gianlucas", last_name: "Galati", email: "gianlucas@gmail.com",password:'123', active: true, role: 0)
User.create(first_name: "Carla", last_name: "Ibel", email: "carla@gmail.com",password:'123', active: true, role: 0)
User.create(first_name: "Juan", last_name: "Bottassi", email: "juan@gmail.com",password:'123', active: true, role: 0)
30.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: 'asdasd'
  )
end
30.times do
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(min_age: 2, max_age: 30),
    address: Faker::Address.full_address,
    attends: Faker::Boolean.boolean
  )
end
