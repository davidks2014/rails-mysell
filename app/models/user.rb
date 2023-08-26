class User < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
