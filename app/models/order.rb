class Order < ApplicationRecord
  validates :name, :address, :email, :payment_type, presence: true
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: 'must be a valid email address'
  }
end
