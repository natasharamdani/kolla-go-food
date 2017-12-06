class Api::V1::FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  def index
    @foods = Food.all

    respond_to do |format|
      format.json { render json: @foods }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @food }
    end
  end

  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.json { render json: @food }
      else
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:name, :description, :image_url, :price, :category_id, :restaurant_id, :review_id, tag_ids: [])
    end
end
