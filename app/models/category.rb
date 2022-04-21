class Category < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters" }, uniqueness: true
end
