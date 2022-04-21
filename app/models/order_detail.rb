class OrderDetail < ApplicationRecord
  validates :order_id, presence: true
  validates :menu_id, presence: true
end
