FactoryBot.define do
  factory :comment do
    comment { "MyText" }
    user
    student
  end
end
