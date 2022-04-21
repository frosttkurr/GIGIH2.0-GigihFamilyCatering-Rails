class CategoryDetail < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :menu, optional: true
  
  validates :menu_id, presence: true
  validates :category_id, presence: true
end
