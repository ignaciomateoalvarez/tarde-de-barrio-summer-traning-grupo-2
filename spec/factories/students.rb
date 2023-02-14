# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birth_date { Faker::Date.birthday(min_age: 2, max_age: 30) }
    address { Faker::Address.full_address }
    attends { Faker::Boolean.boolean }
    school_grade { 'inicial' }
  end
end

#docu factory para crear con lista