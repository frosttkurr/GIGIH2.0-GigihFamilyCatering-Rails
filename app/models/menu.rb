class Menu < ApplicationRecord
  has_many :category_details
  has_many :order_details
  has_many :categories, through: :category_details 
  has_many :orders, through: :order_details
  
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, comparison: { greater_than: 0.01 }, numericality: true
  validates :description, presence: true, length: { maximum: 150 }
end