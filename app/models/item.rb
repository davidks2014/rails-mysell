class Item < ApplicationRecord
  CATEGORIES = ["Electronics", "Clothing", "Books", "Home Decor", "Toys"]
  STATUS = ["Sold", "Available", "Reserved"]
  belongs_to :user
  validates :price, presence: true
  validates :category, presence: true
  validates :name, presence: true
  has_many_attached :photos
end
