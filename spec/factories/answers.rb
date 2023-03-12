FactoryBot.define do
  factory :answer do
    body { "MyText" }
    association :publication
    association :user
  end
end
