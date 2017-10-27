require 'rails_helper'

describe LineItemsController do
  describe "POST #create" do
    it "includes CurrentCart"

    context 'with existing cart' do
      it "does not create a new cart before saving a new line_item"
    end

    context 'without existing cart' do
      it "creates a new cart before saving a new line_item"
    end

    it "saves the new line_item in the database"
    it "redirects to carts#show"
  end
end
