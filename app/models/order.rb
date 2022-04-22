class Order < ApplicationRecord
  has_many :order_details
  has_many :menus, through: :order_details
  
  validates :customer_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :total, presence: true
  validates :status, presence: true, inclusion: { in: %w(NEW PAID CANCELED), message: "is not a valid status" }
end
