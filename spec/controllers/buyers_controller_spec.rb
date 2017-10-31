require 'rails_helper'

describe BuyersController do
  describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of buyers starting with the letter"
      it "renders the :index template"
    end

    context 'without params[:letter]' do
      it "populates an array of all buyers"
      it "renders the :index template"
    end
  end

  describe 'GET #show' do
    it "assigns the requested buyer to @buyer"
    it "renders the :show template"
  end

  describe 'GET #new' do
    it "assigns a new Buyer to @buyer"
    it "renders the :new template"
  end

  describe 'GET #edit' do
    it "assigns the requested buyer to @buyer"
    it "renders the :edit template"
  end

  describe 'GET #create' do
    context 'with valid attributes' do
      it "saves the new buyer in the database"
      it "redirects to buyers#show"
    end

    context 'without valid attributes' do
      it "does not save the new buyer in the database"
      it "re-renders the :new template"
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it "locates the requested @buyer"
      it "changes @buyer's attributes"
      it "redirects to the buyer"
    end

    context 'without valid attributes' do
      it "does not update the new buyer in the database"
      it "re-renders the :edit template"
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the food from the database"
    it "redirects to buyers#show"
  end
end
