require 'rails_helper'

describe Api::V1::FoodsController do
  before :each do
    @food = create(:food, price: 1000)
  end

  describe 'GET #index' do
    it "populates an array of all foods" do
      nasi_uduk = create(:food, name: "Nasi Uduk")
      kerak_telor = create(:food, name: "Kelar Telor")

      get :index, format: 'json'
      expect(assigns(:foods)).to match_array([nasi_uduk, kerak_telor])
    end
  end

  describe 'GET #show' do
    it "assigns the requested food to @food" do
      get :show, params: { id: @food }, format: 'json'
      expect(assigns(:food)).to eq @food
    end

    it "displays related reviews" do
      review1 = create(:food_review, reviewable: @food)
      review2 = create(:food_review, reviewable: @food)
      get :show, params: { id: @food }, format: 'json'
      expect(assigns[:food].reviews).to match_array([review1, review2])
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new food in the database" do
        tag1 = create(:tag)
        tag2 = create(:tag)
        category = create(:category)
        restaurant = create(:restaurant)

        expect{
          post :create, params: { food: attributes_for(:food, category_id: category.id, restaurant_id: restaurant.id, tag_ids: [tag1.id, tag2.id]) }, format: 'json'
        }.to change(Food, :count).by(1)
      end

      it "redirects to foods#show" do
        category = create(:category)
        restaurant = create(:restaurant)
        post :create, params: { food: attributes_for(:food, category_id: category.id, restaurant_id: restaurant.id) }, format: 'json'
        expect(response).to redirect_to(food_path(assigns[:food]))
      end
    end

    context "with invalid attributes" do
      it "does not save the new food in the database" do
        expect{
          post :create, params: { food: attributes_for(:invalid_food) }, format: 'json'
        }.not_to change(Food, :count)
      end
    end
  end
end
