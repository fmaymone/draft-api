FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    #location { "#{Faker::Address.latitude}, #{Faker::Address.longitude}" }
  end
end
