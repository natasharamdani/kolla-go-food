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
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
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

    if !voucher.blank?
      if voucher.unit == "Percent"
        discount = voucher.amount / 100 * total_price
      elsif voucher.unit == "Rupiah"
        discount = voucher.amount
      end

      if voucher.max_amount != nil && voucher.max_amount < discount
        discount = voucher.max_amount
      end
    end

    discount
  end

  def final_price
    total_price - discount
  end

  def self.search(name, addr, email, payment, min, max)
    if name || addr || email || payment || min || max
      min.blank? ? min = 0 : min = min.to_i
      if max.blank?
        where('name LIKE ? and address LIKE ? and email LIKE ? and payment_type LIKE ? and total_price >= ?', "%#{name}%", "%#{addr}%", "%#{email}%", "%#{payment}%", min)
      else
        max = max.to_i
        where('name LIKE ? and address LIKE ? and email LIKE ? and payment_type LIKE ? and total_price >= ? and total_price <= ?', "%#{name}%", "%#{addr}%", "%#{email}%", "%#{payment}%", min, max)
      end
    else
      all
    end
  end

  private
    def check_voucher
      if voucher.present? && (voucher.valid_from > Date.today || voucher.valid_through < Date.today)
        errors.add(:base, 'must use valid voucher')
      end
    end
end
