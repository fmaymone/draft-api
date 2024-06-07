FactoryBot.define do
  factory :booking do
    association :game
    association :venue
    association :user
    datetime { Faker::Time.forward(days: 7, period: :evening) }
    status { ['Pending', 'Confirmed', 'Cancelled'].sample }
  end
end
