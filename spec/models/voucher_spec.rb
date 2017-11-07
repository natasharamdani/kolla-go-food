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


  it "saves code as capital string" do
    voucher = create(:voucher, code: "diskon")
    expect(voucher.code).to eq("DISKON")
  end

  it "is invalid with a duplicate case-insensitive code" do
    voucher1 = create(:voucher, code: "DISKON")
    voucher2 = build(:voucher, code: "diskon")

    voucher2.valid?
    expect(voucher2.errors[:code]).to include("has already been taken")
  end

  it "is invalid with a non date valid_from" do
    voucher = build(:voucher, valid_from: "valid_from")
    voucher.valid?
    expect(voucher.errors[:valid_from]).to include("must be in yyyy-mm-dd format")
  end

  it "is invalid with a non date valid_through" do
    voucher = build(:voucher, valid_through: "valid_through")
    voucher.valid?
    expect(voucher.errors[:valid_through]).to include("must be in yyyy-mm-dd format")
  end

  it "is invalid with valid_through after valid_from" do
    voucher = build(:voucher, valid_from: "2017-11-02", valid_through: "2017-11-01")
    voucher.valid?
    expect(voucher.errors[:valid_through]).to include("must be greater than or equal to valid_from")
  end

  it "is invalid with a non numeric amount" do
    voucher = build(:voucher, amount: "amount")
    voucher.valid?
    expect(voucher.errors[:amount]).to include("is not a number")
  end

  it "is invalid with a non numeric max_amount" do
    voucher = build(:voucher, max_amount: "max_amount")
    voucher.valid?
    expect(voucher.errors[:max_amount]).to include("is not a number")
  end

  it "is invalid with a negative or 0 amount" do
    voucher = build(:voucher, amount: -1)
    voucher.valid?
    expect(voucher.errors[:amount]).to include("must be greater than 0")
  end

  it "is invalid with a negative or 0 max_amount" do
    voucher = build(:voucher, max_amount: -1)
    voucher.valid?
    expect(voucher.errors[:max_amount]).to include("must be greater than 0")
  end

  it "is invalid with wrong unit" do
    expect{ build(:voucher, unit: "dollar") }.to raise_error(ArgumentError)
  end

  context "with rupiah as unit" do
    it "is invalid with max_amount less than amount" do
      voucher = build(:voucher, amount: "10000", unit: "Rupiah", max_amount: "5000")
      voucher.valid?
      expect(voucher.errors[:max_amount]).to include("must be greater than or equal to amount")
    end
  end

  it "can't be destroyed while it has order(s)" do
    voucher = create(:voucher)
    order = create(:order, voucher: voucher)

    expect { voucher.destroy }.not_to change(Voucher, :count)
  end
end
