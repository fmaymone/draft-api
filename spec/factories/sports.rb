FactoryBot.define do
  factory :sport do
    name { Faker::Sports::Football.team + " " + Faker::Number.number(digits: 4).to_s }
  end
end