FactoryBot.define do
  factory :order_detail do
    order_id { 1 }
    item_id { 1 }
    item_price { 1.5 }
    quantity { 1 }
    sub_total { 1.5 }
  end
end
