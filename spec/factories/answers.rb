FactoryBot.define do
  factory :answer do
    body { "MyText" }
    association :comment
    association :user
  end
end
