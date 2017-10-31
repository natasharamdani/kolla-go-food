require 'rails_helper'

describe Drink do
  it "is valid with a name and description" do
    expect(build(:drink)).to be_valid
  end

  it "is invalid without a name" do
    drink = build(:invalid_drink)
    drink.valid?
    expect(drink.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a description" do
    drink = build(:invalid_drink)
    drink.valid?
    expect(drink.errors[:description]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    drink1 = create(:drink, name: "Jus Jeruk")
    drink2 = build(:drink, name: "Jus Jeruk")

    drink2.valid?
    expect(drink2.errors[:name]).to include("has already been taken")
  end

  describe "filter name by letter" do
    before :each do
      @drink1 = create(:drink, name: "Jus Jeruk")
      @drink2 = create(:drink, name: "Teh Tarik")
      @drink3 = create(:drink, name: "Jus Mangga")
    end

    context "with matching letters" do
      it "returns a sorted array of results that match" do
        expect(Drink.by_letter("J")).to eq([@drink1, @drink3])
      end
    end

    context "with non-matching letters" do
      it "omits results that do not match" do
        expect(Drink.by_letter("J")).not_to include(@drink2)
      end
    end
  end

  it "is invalid with a non numeric price" do
    drink = build(:drink, price: "rupiah")
    drink.valid?
    expect(drink.errors[:price]).to include("is not a number")
  end

  it "is invalid with a price less than 0.01" do
    drink = build(:drink, price: 0.001)
    drink.valid?
    expect(drink.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it "is invalid with an image_url other than .gif, .jpg, or .png" do
    drink = build(:drink, image_url: "image.jpeg")
    drink.valid?
    expect(drink.errors[:image_url]).to include("must be an URL for GIF, JPG, or PNG image")
  end
end
