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
