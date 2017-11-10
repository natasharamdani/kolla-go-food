class Review < ApplicationRecord
  validates :reviewer, :title, :description, presence: true
  belongs_to :reviewable, polymorphic: true
end
