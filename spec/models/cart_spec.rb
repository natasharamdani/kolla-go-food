require 'rails_helper'

describe Cart do
  it "has a valid factory" do
    expect(build(:cart)).to be_valid
  end

  it "deletes line_items when deleted" do
    cart = create(:cart)
    food1 = create(:food)
    food2 = create(:food)

    line_item1 = create(:line_item, cart: cart, food: food1)
    line_item2 = create(:line_item, cart: cart, food: food2)
    cart.line_items << line_item1
    cart.line_items << line_item2

    expect { cart.destroy }.to change { LineItem.count }.by(-2)
  end

  it "does not change the number of line_item if the same food is added" do
    cart = create(:cart)
    food = create(:food, name: "Dimsum")
    line_item = create(:line_item, cart: cart, food: food)

    expect { cart.add_food(food) }.not_to change(LineItem, :count)
  end

  it "increments the quantity of line_item if the same food is added" do
    cart = create(:cart)
    food = create(:food, name: "Dimsum")
    line_item = create(:line_item, cart: cart, food: food)

    expect(cart.add_food(food).quantity).to eq(2)
  end

  it "return the sum of the total price of LineItem's" do
    total_price = 0

    food1 = create(:food, price: 10000)
    line_item1 = create(:line_item, food: food1, quantity: 1)
    price = LineItem.total_price(line_item1.quantity, food1.price)
    total_price = Cart.total_price(total_price, price)

    food2 = create(:food, price: 20000)
    line_item2 = create(:line_item, food: food2, quantity: 2)
    price = LineItem.total_price(line_item2.quantity, food2.price)
    total_price = Cart.total_price(total_price, price)

    expect(total_price).to eq(50000)
  end
end
