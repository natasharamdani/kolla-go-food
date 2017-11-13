class CreateFoodsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :foods_tags do |t|
      t.references :food
      t.references :tag
    end
  end
end
