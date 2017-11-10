require 'rails_helper'

describe RestaurantsController do
  before :each do
    user = create(:user)
    session[:user_id] = user.id
  end

  describe 'GET #index' do
    it "populates an array of all restaurants" do
        restaurant1 = create(:restaurant, restauranter: "Nanda")
        restaurant2 = create(:restaurant, restauranter: "Natasha")
        get :index
        expect(assigns(:restaurants)).to match_array([restaurant1, restaurant2])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
  end

  describe 'GET #show' do
    it "assigns the requested restaurant to @restaurant" do
      restaurant = create(:restaurant)
      get :show, params: { id: restaurant }
      expect(assigns(:restaurant)).to eq restaurant
    end

    it "renders the :show template" do
      restaurant = create(:restaurant)
      get :show, params: { id: restaurant }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Restaurant to @restaurant" do
      get :new
      expect(assigns(:restaurant)).to be_a_new(Restaurant)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested restaurant to @restaurant" do
      restaurant = create(:restaurant)
      get :edit, params: { id: restaurant }
      expect(assigns(:restaurant)).to eq restaurant
    end

    it "renders the :edit template" do
      restaurant = create(:restaurant)
      get :edit, params: { id: restaurant }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it "saves the new restaurant in the database" do
        expect{
          post :create, params: { restaurant: attributes_for(:restaurant) }
        }.to change(Restaurant, :count).by(1)
      end

      it "redirects to restaurants#show" do
        post :create, params: { restaurant: attributes_for(:restaurant) }
        expect(response).to redirect_to(restaurant_path(assigns(:restaurant)))
      end
    end

    context 'without valid attributes' do
      it "does not save the new restaurant in the database" do
        expect{
          post :create, params: { restaurant: attributes_for(:invalid_restaurant) }
        }.not_to change(Restaurant, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { restaurant: attributes_for(:invalid_restaurant) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @restaurant = create(:restaurant)
    end

    context 'with valid attributes' do
      it "locates the requested @restaurant" do
        patch :update, params: { id: @restaurant, restaurant: attributes_for(:restaurant) }
        expect(assigns(:restaurant)).to eq @restaurant
      end

      it "changes @restaurant's attributes" do
        patch :update, params: { id: @restaurant, restaurant: attributes_for(:restaurant, restauranter: 'Nanda') }
        @restaurant.reload
        expect(@restaurant.restauranter).to eq('Nanda')
      end

      it "redirects to the restaurant" do
        patch :update, params: { id: @restaurant, restaurant: attributes_for(:restaurant) }
        expect(response).to redirect_to @restaurant
      end
    end

    context 'without valid attributes' do
      it "does not update the new restaurant in the database" do
        patch :update, params: { id: @restaurant, restaurant: attributes_for(:invalid_restaurant) }
        @restaurant.reload
        expect(@restaurant.restauranter).not_to eq('Nanda')
      end

      it "re-renders the :edit template" do
        patch :update, params: { id: @restaurant, restaurant: attributes_for(:invalid_restaurant) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @restaurant = create(:restaurant)
    end

    it "deletes the restaurant from the database" do
      expect{
        delete :destroy, params: { id: @restaurant }
      }.to change(Restaurant, :count).by(-1)
    end

    it "redirects to restaurants#index" do
      delete :destroy, params: { id: @restaurant }
      expect(response).to redirect_to restaurants_path
    end
  end
end
