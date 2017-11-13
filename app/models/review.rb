class Review < ApplicationRecord
  validates :reviewer_name, :title, :description, presence: true
  belongs_to :reviewable, polymorphic: true
end
