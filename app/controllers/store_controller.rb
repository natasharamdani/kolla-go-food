class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart

  def index
    @foods = Food.order(:name)
    @food_list = @foods.group_by { |f| f.restaurant.name }
  end
end
