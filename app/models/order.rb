class Order < ApplicationRecord
  enum payment_type: {
    "Cash" => 0,
    "Go Pay" => 1,
    "Credit Card" => 2
  }

  has_many :line_items, dependent: :destroy
  belongs_to :voucher, optional: true

  validates :name, :address, :email, :payment_type, presence: true
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: 'must be a valid email address'
  }
  validates :payment_type, inclusion: payment_types.keys
  validate :check_voucher

  def add_line_items(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_price
    total_price = 0
    line_items.each do |item|
      total_price += item.total_price
    end
    total_price
  end

  def discount
    discount = 0

    if voucher.unit == "Percent"
      discount = voucher.amount / 100 * total_price
    elsif voucher.unit == "Rupiah"
      discount = voucher.amount
    end

    if voucher.max_amount != nil && voucher.max_amount < discount
      discount = voucher.max_amount
    end

    discount
  end

  def final_price
    total_price - discount
  end

  private
    def check_voucher
      if voucher.present? && (voucher.valid_from > Date.today || voucher.valid_through < Date.today)
        errors.add(:base, 'must use valid voucher')
      end
    end
end
