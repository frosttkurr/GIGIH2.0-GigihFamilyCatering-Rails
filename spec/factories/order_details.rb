FactoryBot.define do
  factory :order_detail do
    order_id { 1 }
    menu_id { 1 }
    menu_price { 15000.0 }
    quantity { 2 }
    sub_total { 30000.0 }
  end
end
