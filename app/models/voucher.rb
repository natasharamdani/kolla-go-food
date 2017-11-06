class Voucher < ApplicationRecord
  before_save :capital_code
  has_many :orders

  validates :code, :valid_from, :valid_through, :amount, :unit, :max_amount, presence: true

  validates :code, uniqueness: true

  validates :valid_from, :valid_through, format: {
    with: /[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])/,
    message: 'must be in yyyy-mm-dd format'
  }

  validates :amount, :max_amount, numericality: true

  validates :unit, inclusion: {
    in: %w(percent rupiah),
    message: 'must be a valid unit ("percent" or "rupiah")'
  }

  def capital_code
    self.code.upcase!
 end
end
