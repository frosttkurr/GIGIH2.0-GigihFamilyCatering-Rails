class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, comparison: { greater_than: 0.01 }, numericality: true
  validates :description, presence: true, length: { maximum: 150 }
end
