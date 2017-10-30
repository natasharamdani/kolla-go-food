class AddCategoryToFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :category, :string, null: true
    add_reference :foods, :category, index: true
  end
end
