require 'rails_helper'

describe ReviewsController do
  before :each do
    user = create(:user)
    session[:user_id] = user.id
  end

  describe 'GET #index' do
    it "populates an array of all reviews" do
        review1 = create(:review, reviewer: "Nanda")
        review2 = create(:review, reviewer: "Natasha")
        get :index
        expect(assigns(:reviews)).to match_array([review1, review2])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
  end

  describe 'GET #show' do
    it "assigns the requested review to @review" do
      review = create(:review)
      get :show, params: { id: review }
      expect(assigns(:review)).to eq review
    end

    it "renders the :show template" do
      review = create(:review)
      get :show, params: { id: review }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Review to @review" do
      get :new
      expect(assigns(:review)).to be_a_new(Review)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested review to @review" do
      review = create(:review)
      get :edit, params: { id: review }
      expect(assigns(:review)).to eq review
    end

    it "renders the :edit template" do
      review = create(:review)
      get :edit, params: { id: review }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it "saves the new review in the database" do
        expect{
          post :create, params: { review: attributes_for(:review) }
        }.to change(Review, :count).by(1)
      end

      it "redirects to reviews#show" do
        post :create, params: { review: attributes_for(:review) }
        expect(response).to redirect_to(review_path(assigns(:review)))
      end
    end

    context 'without valid attributes' do
      it "does not save the new review in the database" do
        expect{
          post :create, params: { review: attributes_for(:invalid_review) }
        }.not_to change(Review, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { review: attributes_for(:invalid_review) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @review = create(:review)
    end

    context 'with valid attributes' do
      it "locates the requested @review" do
        patch :update, params: { id: @review, review: attributes_for(:review) }
        expect(assigns(:review)).to eq @review
      end

      it "changes @review's attributes" do
        patch :update, params: { id: @review, review: attributes_for(:review, reviewer: 'Nanda') }
        @review.reload
        expect(@review.reviewer).to eq('Nanda')
      end

      it "redirects to the review" do
        patch :update, params: { id: @review, review: attributes_for(:review) }
        expect(response).to redirect_to @review
      end
    end

    context 'without valid attributes' do
      it "does not update the new review in the database" do
        patch :update, params: { id: @review, review: attributes_for(:invalid_review) }
        @review.reload
        expect(@review.reviewer).not_to eq('Nanda')
      end

      it "re-renders the :edit template" do
        patch :update, params: { id: @review, review: attributes_for(:invalid_review) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @review = create(:review)
    end

    it "deletes the review from the database" do
      expect{
        delete :destroy, params: { id: @review }
      }.to change(Review, :count).by(-1)
    end

    it "redirects to reviews#index" do
      delete :destroy, params: { id: @review }
      expect(response).to redirect_to reviews_path
    end
  end
end
