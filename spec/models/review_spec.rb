require 'rails_helper'

describe Review do
  it "is valid with a reviewer, title, and description" do
    expect(build(:review)).to be_valid
  end

  it "is invalid without a reviewer" do
    review = build(:invalid_review)
    review.valid?
    expect(review.errors[:reviewer]).to include("can't be blank")
  end

  it "is invalid with a duplicate reviewer" do
    review1 = create(:review, reviewer: "Nanda")
    review2 = build(:review, reviewer: "Nanda")

    review2.valid?
    expect(review2.errors[:reviewer]).to include("has already been taken")
  end

  it "is invalid without a title" do
    review = build(:invalid_review)
    review.valid?
    expect(review.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a description" do
    review = build(:invalid_review)
    review.valid?
    expect(review.errors[:description]).to include("can't be blank")
  end
end
