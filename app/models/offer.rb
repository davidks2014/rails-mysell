class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
