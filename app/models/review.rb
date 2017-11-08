class Review < ApplicationRecord
  validates :reviewer, :title, :description, presence: true
  validates :reviewer, uniqueness: true
  has_many :foods
  has_many :restaurants
end
