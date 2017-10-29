class AddNameToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :name, :String
  end
end
