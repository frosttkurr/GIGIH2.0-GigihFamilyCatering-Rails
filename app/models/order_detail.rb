class OrderDetail < ApplicationRecord
  validates :order_id, presence: true
  validates :item_id, presence: true
end
