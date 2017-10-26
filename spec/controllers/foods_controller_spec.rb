require 'rails_helper'

describe FoodsController do
  describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of foods starting with the letter" do
        nasi_uduk = create(:food, name: "Nasi Uduk")
        kerak_telor = create(:food, name: "Kelar Telor")
        get :index, params: { letter: 'N' }
        expect(assigns(:foods)).to match_array([nasi_uduk])
      end

      it "renders the :index template" do
        get :index, params: { letter: 'N' }
        expect(response).to render_template :index
      end
    end

    context 'without params[:letter]' do
      it "populates an array of all foods" do
        nasi_uduk = create(:food, name: "Nasi Uduk")
        kerak_telor = create(:food, name: "Kelar Telor")
        get :index
        expect(assigns(:foods)).to match_array([nasi_uduk, kerak_telor])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    it "assigns the requested food to @food" do
      food = create(:food)
      get :show, params: { id: food }
      expect(assigns(:food)).to eq food
    end

    it "renders the :show template" do
      food = create(:food)
      get :show, params: { id: food }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Food to @food"
    it "renders the :new template"
  end

  describe 'GET #edit' do
    it "assigns the requested food to @food"
    it "renders the :edit template"
  end

  describe 'GET #create' do
    context 'with valid attributes' do
      it "saves the new food in the database"
      it "redirects to foods#show"
    end

    context 'without valid attributes' do
      it "does not save the new food in the database"
      it "re-renders the :new template"
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it "locates the requested @food"
      it "changes @food's attributes"
      it "redirects to the food"
    end

    context 'without valid attributes' do
      it "does not update the new food in the database"
      it "re-renders the :edit template"
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the food from the database"
    it "redirects to foods#show"
  end
end
