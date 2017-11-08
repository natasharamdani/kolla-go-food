class RefReviewToFoodsAndRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_reference :foods, :review, index: true
    add_reference :restaurants, :review, index: true
  end
end
