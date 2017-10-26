require 'rails_helper'

describe Buyer do
  it "is valid with an email, name, phone, and address" do
    expect(build(:buyer)).to be_valid
  end

  it "is invalid without a email" do
    buyer = build(:invalid_buyer)
    buyer.valid?
    expect(buyer.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a name" do
    buyer = build(:invalid_buyer)
    buyer.valid?
    expect(buyer.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a phone" do
    buyer = build(:invalid_buyer)
    buyer.valid?
    expect(buyer.errors[:phone]).to include("can't be blank")
  end

  it "is invalid without a address" do
    buyer = build(:invalid_buyer)
    buyer.valid?
    expect(buyer.errors[:address]).to include("can't be blank")
  end

  it "is invalid with a duplicate email" do
    buyer1 = create(:buyer, email: "nanda@gmail.com")
    buyer2 = build(:buyer, email: "nanda@gmail.com")

    buyer2.valid?
    expect(buyer2.errors[:email]).to include("has already been taken")
  end

  it "is invalid with an email other than given format" do
    buyer = build(:invalid_buyer, email: "email")
    buyer.valid?
    expect(buyer.errors[:email]).to include("must be a valid email address")
  end

  it "is invalid with a non numeric phone" do
    buyer = build(:buyer, phone: "rupiah")
    buyer.valid?
    expect(buyer.errors[:phone]).to include("is not a number")
  end

  it "is invalid with phone digit more than 12" do
    buyer = build(:buyer, phone: 1234567890123)
    buyer.valid?
    expect(buyer.errors[:phone]).to include("is too long (maximum is 12 characters)")
  end

  it "has a valid factory" do
    expect(build(:buyer)).to be_valid
  end
end
