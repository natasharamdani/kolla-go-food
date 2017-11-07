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

    discount_price(total_price, order.voucher.amount, order.voucher.unit, order.voucher.max_amount)
  end

  def discount_price(total_price, amount, unit, max_amount)
    if unit == "percent"
      discount_price = total_price - ((total_price * amount) / 100)
    else
      discount_price = total_price - amount
    end

    if max_amount != nil && max_amount < discount
      discount_price = max_amount
    end

    discount_price
  end
end
