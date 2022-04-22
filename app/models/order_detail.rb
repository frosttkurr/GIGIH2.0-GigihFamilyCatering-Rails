class OrderDetail < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :menu, optional: true
  
  validates :order_id, presence: true
  validates :menu_id, presence: true
end
