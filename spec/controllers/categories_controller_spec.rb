require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns a list of foods, ordered by name" do
      tradisional = create(:category, name: "Tradisional")
      khas_betawi = create(:category, name: "Khas Betawi")
      get :index
      expect(assigns(:categories)).to match_array([khas_betawi, tradisional])
    end
  end

end
