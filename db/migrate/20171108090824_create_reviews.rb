class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :reviewer_name
      t.string :title
      t.text :description

      t.references :reviewable, polymorphic: true, index: true
    end
  end
end
