require 'rails_helper'

describe Voucher do
  it "is valid with a code, valid_from, valid_through, amount, unit, and max_amount" do
    expect(build(:voucher)).to be_valid
  end

  it "is invalid without a code" do
    voucher = build(:invalid_voucher)
    voucher.valid?
    expect(voucher.errors[:code]).to include("can't be blank")
  end

  it "is invalid without a valid_from" do
    voucher = build(:invalid_voucher)
    voucher.valid?
    expect(voucher.errors[:valid_from]).to include("can't be blank")
  end

  it "is invalid without a valid_through" do
    voucher = build(:invalid_voucher)
    voucher.valid?
    expect(voucher.errors[:valid_through]).to include("can't be blank")
  end

  it "is invalid without an amount" do
    voucher = build(:invalid_voucher)
    voucher.valid?
    expect(voucher.errors[:amount]).to include("can't be blank")
  end

  it "is invalid without an unit" do
    voucher = build(:invalid_voucher)
    voucher.valid?
    expect(voucher.errors[:unit]).to include("can't be blank")
  end

  it "is invalid without a max_amount" do
    voucher = build(:invalid_voucher)
    voucher.valid?
    expect(voucher.errors[:max_amount]).to include("can't be blank")
  end

  it "is invalid with a duplicate code" do
    voucher1 = create(:voucher, code: "DISKON")
    voucher2 = build(:voucher, code: "DISKON")

    voucher2.valid?
    expect(voucher2.errors[:code]).to include("has already been taken")
  end

  it "is invalid with a code other than given format" do
    voucher = build(:voucher, code: "code")
    voucher.valid?
    expect(voucher.errors[:code]).to include("must be a capital string")
  end

  it "is invalid with a non date valid_from" do
    voucher = build(:voucher, valid_from: "valid_from")
    voucher.valid?
    expect(voucher.errors[:valid_from]).to include("is not a date")
  end

  it "is invalid with a non date valid_through" do
    voucher = build(:voucher, valid_through: "valid_through")
    voucher.valid?
    expect(voucher.errors[:valid_through]).to include("is not a date")
  end

  it "is invalid with a non numeric amount" do
    voucher = build(:voucher, amount: "amount")
    voucher.valid?
    expect(voucher.errors[:amount]).to include("is not a number")
  end

  it "is invalid with wrong unit" do
    voucher = build(:voucher, unit: "unit")
    voucher.valid?
    expect(voucher.errors[:unit]).to include("must be a valid unit")
  end

  it "is invalid with a non numeric max_amount" do
    voucher = build(:voucher, max_amount: "max_amount")
    voucher.valid?
    expect(voucher.errors[:max_amount]).to include("is not a number")
  end
end
