require 'rails_helper'

describe Order do
  it "has a valid factory" do
    expect(build(:order)).to be_valid
  end

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
end
