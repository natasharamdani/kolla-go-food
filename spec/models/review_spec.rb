# require 'rails_helper'

# describe Review do
#   before :each do
#     @food = create(:food)
#     @restaurant = create(:restaurant)
#   end

#   context "with food as reviewable" do
#     it "is valid with a reviewer name, title, and description" do
#       expect(build(:food_review, reviewable: @food)).to be_valid
#     end

#     it "is invalid without a reviewer name" do
#       review = build(:invalid_food_review, reviewable: @food)
#       review.valid?
#       expect(review.errors[:reviewer_name]).to include("can't be blank")
#     end

#     it "is invalid without a title" do
#       review = build(:invalid_food_review, reviewable: @food)
#       review.valid?
#       expect(review.errors[:title]).to include("can't be blank")
#     end

#     it "is invalid without a description" do
#       review = build(:invalid_food_review, reviewable: @food)
#       review.valid?
#       expect(review.errors[:description]).to include("can't be blank")
#     end
#   end

#   context "with restaurant as reviewable" do
#     it "is valid with a reviewer name, title, and description" do
#       expect(build(:restaurant_review, reviewable: @restaurant)).to be_valid
#     end

#     it "is invalid without a reviewer name" do
#       review = build(:invalid_restaurant_review, reviewable: @restaurant)
#       review.valid?
#       expect(review.errors[:reviewer_name]).to include("can't be blank")
#     end

#     it "is invalid without a title" do
#       review = build(:invalid_restaurant_review, reviewable: @restaurant)
#       review.valid?
#       expect(review.errors[:title]).to include("can't be blank")
#     end

#     it "is invalid without a description" do
#       review = build(:invalid_restaurant_review, reviewable: @restaurant)
#       review.valid?
#       expect(review.errors[:description]).to include("can't be blank")
#     end
#   end
# end
