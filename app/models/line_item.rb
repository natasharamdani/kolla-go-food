class LineItem < ApplicationRecord
  belongs_to :food
  belongs_to :cart

  def self.total_price(quantity, price)
    quantity * price
  end
end
