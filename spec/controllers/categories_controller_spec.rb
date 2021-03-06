require 'rails_helper'

describe CategoriesController do
  before :each do
    user = create(:user)
    session[:user_id] = user.id
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "populates an array of all categories, ordered by name" do
      tradisional = create(:category, name: "Tradisional")
      khas_betawi = create(:category, name: "Khas Betawi")
      get :index
      expect(assigns(:categories)).to match_array([khas_betawi, tradisional])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns the requested category to @category" do
      category = create(:category)
      get :show, params: { id: category }
      expect(assigns(:category)).to eq category
    end

    it "populates an array of all foods in the category" do
      category = create(:category)
      food1 = create(:food, name: "food1", category: category)
      food2 = create(:food, name: "food2", category: category)
      get :show, params: { id: category }
      expect(assigns(:category).foods).to match_array([food1, food2])
    end

    it "renders the :show template" do
      category = create(:category)
      get :show, params: { id: category }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Category to @category" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested category to @category" do
      category = create(:category)
      get :edit, params: { id: category }
      expect(assigns(:category)).to eq category
    end

    it "renders the :edit template" do
      category = create(:category)
      get :edit, params: { id: category }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it "saves the new category in the database" do
        expect{
          post :create, params: { category: attributes_for(:category) }
        }.to change(Category, :count).by(1)
      end

      it "redirects to categories#show" do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to redirect_to(category_path(assigns[:category]))
      end
    end

    context 'without valid attributes' do
      it "does not save the new category in the database" do
        expect{
          post :create, params: { category: attributes_for(:invalid_category) }
        }.not_to change(Category, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { category: attributes_for(:invalid_category) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @category = create(:category)
    end

    context 'with valid attributes' do
      it "locates the requested @category" do
        patch :update, params: { id: @category, category: attributes_for(:category) }
        expect(assigns(:category)).to eq @category
      end

      it "changes @category's attributes" do
        patch :update, params: { id: @category, category: attributes_for(:category, name: 'New Category') }
        @category.reload
        expect(@category.name).to eq('New Category')
      end

      it "redirects to the category" do
        patch :update, params: { id: @category, category: attributes_for(:category) }
        expect(response).to redirect_to @category
      end
    end

    context 'without valid attributes' do
      it "does not update the new category in the database" do
        patch :update, params: { id: @category, category: attributes_for(:category, name: nil) }
        @category.reload
        expect(@category.name).not_to eq('New Category')
      end

      it "re-renders the :edit template" do
        patch :update, params: { id: @category, category: attributes_for(:invalid_category) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @category = create(:category)
    end

    context "with associated foods" do
      it "does not delete the category from the database" do
        food = create(:food, category: @category)
        expect{
          delete :destroy, params: { id: @category }
        }.not_to change(Category, :count)
      end
    end

    context "without associated foods" do
      it "deletes the category from the database" do
        expect{
          delete :destroy, params: { id: @category }
        }.to change(Category, :count).by(-1)
      end

      it "redirects to categories#index" do
        delete :destroy, params: { id: @category }
        expect(response).to redirect_to categories_path
      end
    end
  end
end
