FactoryBot.define do
  factory :order do
    customer_email { "syakurr@generasigigih.com" }
    total { 30000.0 }
    status { "NEW" }
  end
end
