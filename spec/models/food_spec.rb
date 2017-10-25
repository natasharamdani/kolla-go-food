require 'rails_helper'

describe Food do
  it "is valid with a name and description" do
    expect(build(:food)).to be_valid
  end

  it "is invalid without a name" do
    food = build(:food, name: nil)
    food.valid?
    expect(food.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a description" do
    food = build(:food, description: nil)
    food.valid?
    expect(food.errors[:description]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    food1 = create(:food, name: "Nasi Uduk")
    food2 = build(:food, name: "Nasi Uduk")

    food2.valid?
    expect(food2.errors[:name]).to include("has already been taken")
  end

  describe "filter name by letter" do
    before :each do
      @food1 = create(:food, name: "Nasi Uduk")
      @food2 = create(:food)
      @food3 = create(:food, name: "Nasi Kuning")
    end

    context "with matching letters" do
      it "returns a sorted array of results that match" do
        expect(Food.by_letter("N")).to eq([@food3, @food1])
      end
    end

    context "with non-matching letters" do
      it "omits results that do not match" do
        expect(Food.by_letter("N")).not_to include(@food2)
      end
    end
  end

  it "is invalid with a non numeric price" do
    food = build(:food, price: "rupiah")
    food.valid?
    expect(food.errors[:price]).to include("is not a number")
  end

  it "is invalid with a price less than 0.01" do
    food = build(:food, price: 0.001)
    food.valid?
    expect(food.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it "is invalid with an image_url other than .gif, .jpg, or .png" do
    food = build(:food, image_url: "image.jpeg")
    food.valid?
    expect(food.errors[:image_url]).to include("must be an URL for GIF, JPG, or PNG image")
  end

  it "has a valid factory" do
    expect(build(:food)).to be_valid
  end
end
