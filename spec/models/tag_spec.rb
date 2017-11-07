require 'rails_helper'

describe Tag do
  it "is valid with a name" do
    expect(build(:tag)).to be_valid
  end

  it "is invalid without a name" do
    tag = build(:tag, name: nil)
    tag.valid?
    expect(tag.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    tag1 = create(:tag, name: "Tradisional")
    tag2 = build(:tag, name: "Tradisional")

    tag2.valid?
    expect(tag2.errors[:name]).to include("has already been taken")
  end

  it "can't be destroyed while it has food(s)" do
    tag = create(:tag)

    food = create(:food, tag: tag)

    expect { tag.destroy }.not_to change(Tag, :count)
  end
end
