# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(first_name: "Gianlucas", last_name: "Galati", email: "gianlucas@gmail.com",password:'123', active: true, role: 1)

user = User.create(first_name: "Juan", last_name: "Bottassi", email: "juan@gmail.com",password:'123', active: true, role: 0)

FactoryBot.create_list(:student, 30, user: user)
