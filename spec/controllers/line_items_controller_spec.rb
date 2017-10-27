require 'rails_helper'

describe LineItemsController do
  describe "POST #create" do
    before :each do
      @food = create(:food)
    end

    it "includes CurrentCart" do
      expect(LineItemsController.ancestors.include? CurrentCart).to eq(true)
    end

    context 'with existing cart' do
      it "does not create a new cart before saving a new line_item" do
        cart = create(:cart)
        session[:cart_id] = cart.id

        expect{
          post :create, params: { food_id: @food.id }
        }.not_to change(Cart, :count)
      end
    end

    context 'without existing cart' do
      it "creates a new cart before saving a new line_item"
    end

    it "saves the new line_item in the database"
    it "redirects to carts#show"
  end
end
