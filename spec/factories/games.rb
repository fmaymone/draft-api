FactoryBot.define do
  factory :game do
    association :ladder
    association :venue
    datetime { Faker::Time.forward(days: 7, period: :evening) }
    player1_id { create(:user).id }
    player2_id { create(:user).id }
    score { "#{rand(0..3)} - #{rand(0..3)}" }
  end
end
