class Buyer < ApplicationRecord
  validates :email, :name, :phone, :address, presence: true
  validates :email, uniqueness: true
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: 'must be a valid email address'
  }
  validates :phone, numericality: true, length: { maximum: 12 }
end
