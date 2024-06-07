FactoryBot.define do
  factory :venue do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    location { "#{Faker::Address.latitude}, #{Faker::Address.longitude}" }
  end
end
