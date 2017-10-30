require 'rails_helper'

describe CategoriesController do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns a list of categories, ordered by name" do
      tradisional = create(:category, name: "Tradisional")
      khas_betawi = create(:category, name: "Khas Betawi")
      get :index
      expect(assigns(:categories)).to match_array([khas_betawi, tradisional])
    end
  end
end
