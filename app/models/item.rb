class Item < ApplicationRecord
  CATEGORIES = ["Electronics", "Clothing", "Books", "Home Decor", "Toys"]
  STATUS = ["Sold", "Available", "Reserved"]
  belongs_to :user
  validates :price, presence: true
  validates :category, presence: true
  validates :name, presence: true
  scope :random_featured, -> (limit) { where(status: "Available").where(category: CATEGORIES.sample).order("RANDOM()").limit(limit) }
  validates :photos, presence: true
  has_many_attached :photos
  has_many :offers, dependent: :destroy
end
