FactoryBot.define do
  factory :ladder do
    name { Faker::Esport.unique.team }
    association :sport
    start_date { Faker::Date.backward(days: 14) }
    end_date { Faker::Date.forward(days: 14) }
  end
end
