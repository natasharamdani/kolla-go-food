require 'rails_helper'

describe LineItem do
  it "can calculate total_price" do
    food = create(:food, price: 10000)
    line_item = create(:line_item, food: food, quantity: 2)

    expect(line_item.total_price).to eq(20000)
  end
end
