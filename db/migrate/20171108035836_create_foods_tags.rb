class CreateFoodsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :foods_tags do |t|
      t.integer :food_id
      t.integer :tag_id
    end
  end
end
