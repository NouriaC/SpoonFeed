class Restaurant < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  validates :address, :category, presence: true
end
