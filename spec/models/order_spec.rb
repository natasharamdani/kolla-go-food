require 'rails_helper'

describe Order do
  it "is valid with a name, address, email, and payment_type" do
    expect(build(:order)).to be_valid
  end

  it "is invalid without a name" do
    order = build(:invalid_order)
    order.valid?
    expect(order.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an address" do
    order = build(:invalid_order)
    order.valid?
    expect(order.errors[:address]).to include("can't be blank")
  end

  it "is invalid without an email" do
    order = build(:invalid_order)
    order.valid?
    expect(order.errors[:email]).to include("can't be blank")
  end

  it "is invalid with email not in valid email format" do
    order = build(:invalid_order, email: "email")
    order.valid?
    expect(order.errors[:email]).to include("must be a valid email address")
  end

  it "is invalid without a payment_type" do
    order = build(:invalid_order)
    order.valid?
    expect(order.errors[:payment_type]).to include("can't be blank")
  end

  it "is invalid with wrong payment_type" do
    expect{ build(:order, payment_type: "Grab Pay") }.to raise_error(ArgumentError)
  end

  describe "adding line_items from cart" do
    before :each do
      @cart = create(:cart)
      @line_item = create(:line_item, cart: @cart)
      @order = build(:order)
    end

    it "add line_items to order" do
      expect{
        @order.add_line_items(@cart)
        @order.save
      }.to change(@order.line_items, :count).by(1)
    end

    it "removes line_items from cart" do
      expect{
        @order.add_line_items(@cart)
        @order.save
      }.to change(@cart.line_items, :count).by(-1)
    end
  end

  it "can calculate total_price" do
    order = create(:order)
    food1 = create(:food, price: 10000)
    food2 = create(:food, price: 20000)

    line_item1 = create(:line_item, order: order, food: food1)
    line_item2 = create(:line_item, order: order, food: food2, quantity: 2)

    expect(order.sub_total_price).to eq(50000)
  end

  describe "adding voucher to order" do
    context "with valid voucher" do
      before :each do
        @food = create(:food, price: 100000)
      end

      it "can calculate price_after_discount with percent as unit" do
        voucher = create(:voucher, amount: 25, unit: "Percent", max_amount: 15000)
        order = create(:order, voucher: voucher)
        line_item = create(:line_item, order: order, food: @food)
        expect(order.set_total_price).to eq(85000)
      end

      it "can calculate price_after_discount with rupiah as unit" do
        voucher = create(:voucher, amount: 15000, unit: "Rupiah", max_amount: 15000)
        order = create(:order, voucher: voucher)
        line_item = create(:line_item, order: order, food: @food)
        expect(order.set_total_price).to eq(85000)
      end
    end

    context "with invalid voucher" do
      it "is invalid with invalid voucher" do
        voucher = create(:voucher, valid_through: 1.day.ago)
        order = build(:order, voucher: voucher)
        order.valid?
        expect(order.errors[:base]).to include("must use valid voucher")
      end
    end
  end
end
