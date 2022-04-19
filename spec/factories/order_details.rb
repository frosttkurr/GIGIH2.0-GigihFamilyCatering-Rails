FactoryBot.define do
  factory :order_detail do
    order_id { 1 }
    item_id { 1 }
    item_price { 15000.0 }
    quantity { 2 }
    sub_total { 30000.0 }
  end
end
