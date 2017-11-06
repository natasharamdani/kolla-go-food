class Voucher < ApplicationRecord
  validates :code, :valid_from, :valid_through, :amount, :unit, :max_amount, presence: true
  validates :code, uniqueness: true, format: {
    with: /[A-Z]/,
    message: 'must be a capital string'
  }
  validates :valid_from, :valid_through, format: {
    with: /[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])/,
    message: 'is not a date'
  }
  validates :amount, :max_amount, numericality: true
  validates :unit, inclusion: { in: %w(percent rupiah),
    message: 'must be a valid unit' }
end
