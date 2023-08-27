class Item < ApplicationRecord
  CATEGORIES = ["Electronics", "Clothing", "Books", "Home Decor", "Toys"]
  STATUS = ["Sold", "Available", "Reserved"]
  has_many :offers, dependent: :destroy
  belongs_to :user
  validates :price, presence: true
  validates :category, presence: true
  validates :name, presence: true
end
