FactoryBot.define do
  factory :order do
    owner_id { 1 }
    customer_email { "MyString" }
    total { 1.5 }
    status { "MyString" }
  end
end
