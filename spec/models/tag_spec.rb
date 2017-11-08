require 'rails_helper'

describe Tag do
  it "is valid with a name" do
    expect(build(:tag)).to be_valid
  end

  it "is invalid without a name" do
    tag = build(:invalid_tag)
    tag.valid?
    expect(tag.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    tag1 = create(:tag, name: "Tradisional")
    tag2 = build(:tag, name: "Tradisional")

    tag2.valid?
    expect(tag2.errors[:name]).to include("has already been taken")
  end
end
