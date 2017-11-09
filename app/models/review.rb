class Review < ApplicationRecord
  validates :reviewer, :title, :description, presence: true
  validates :reviewer, uniqueness: true
  belongs_to :reviewable, polymorphic: true
end
