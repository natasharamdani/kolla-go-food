class RefCategoryToFoods < ActiveRecord::Migration[5.1]
  def change
    add_reference :foods, :category, index: true
  end
end
