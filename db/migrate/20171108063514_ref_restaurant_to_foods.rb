class RefRestaurantToFoods < ActiveRecord::Migration[5.1]
  def change
    add_reference :foods, :restaurant, index: true
  end
end
