FactoryBot.define do
  factory :order do
    owner_id { 1 }
    customer_email { "syakurr@generasigigih.com" }
    total { 30000.0 }
    status { "NEW" }
  end
end
