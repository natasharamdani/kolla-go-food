require 'rails_helper'

describe Category do
  it "is valid with a name" do
    expect(build(:category)).to be_valid
  end

  it "is invalid with a duplicate name" do
    category1 = create(:category, name: "Tradisional")
    category2 = build(:category, name: "Tradisional")

    category2.valid?
    expect(category2.errors[:name]).to include("has already been taken")
  end

  it "can't be destroyed while it has food(s)" do
    category = create(:category)

    food = create(:food, category: category)
    category.foods << food

    expect { category.destroy }.not_to change(Category, :count)
  end
end
