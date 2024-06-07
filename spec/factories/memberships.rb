FactoryBot.define do
  factory :membership do
    association :user
    association :ladder
    join_date { Faker::Date.backward(days: 30) }
  end
end
