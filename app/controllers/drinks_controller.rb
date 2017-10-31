class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]

  def index
    @drinks = params[:letter].nil? ? Drink.all : Drink.by_letter(params[:letter])
  end

  def show
  end

  def new
    @drink = Drink.new
  end

  def edit
  end

  def create
    @drink = Drink.new
  end

  def update
  end

  def destroy
    @drink.destroy
  end

  private

  def set_drink
    @drink = Drink.find(params[:id])
  end

  def drink_params
    params.require(:drink).permit(:name, :description, :image_url, :price)
  end
end
