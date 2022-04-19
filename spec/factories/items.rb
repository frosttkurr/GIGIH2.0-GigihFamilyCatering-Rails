FactoryBot.define do
  factory :item do
    name { Faker::Food.dish }
    price { 15000.0 }
    description { Faker::Food.description }
  end
end
