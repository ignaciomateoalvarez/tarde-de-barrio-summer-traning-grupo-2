FactoryBot.define do
  factory :comment do
    comment { "MyText" }
    association :student
  end
end
