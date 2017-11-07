class Voucher < ApplicationRecord
  before_save :capital_code
  before_destroy :ensure_not_referenced_by_any_order
  has_many :orders

  validates :code, :valid_from, :valid_through, :amount, :unit, :max_amount, presence: true
  validates :code, uniqueness: { case_sensitive: false }
  validates :valid_from, :valid_through, format: {
    with: /[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])/,
    message: 'must be in yyyy-mm-dd format'
  }
  validates :amount, :max_amount, numericality: { greater_than: 0 }
  validates :unit, inclusion: {
    in: %w(percent rupiah),
    message: 'must be a valid unit ("percent" or "rupiah")'
  }

  validate :valid_through_must_be_greater_than_valid_from
  validate :max_amount_must_be_greater_than_or_equal_to_amount_with_rupiah_unit

  private

  def capital_code
    code.upcase!
  end

  def valid_through_must_be_greater_than_valid_from
    if valid_from.present? && valid_through.present? && valid_through < valid_from
      errors.add(:valid_through, 'must be greater than or equal to valid_from')
    end
  end

  def max_amount_must_be_greater_than_or_equal_to_amount_with_rupiah_unit
    if unit == "rupiah" && max_amount < amount
      errors.add(:max_amount, 'must be greater than or equal to amount')
    end
  end

  def ensure_not_referenced_by_any_order
    unless orders.empty?
      errors.add(:base, 'Orders present')
      throw :abort
    end
  end
end
