class AddQuantityToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :quantity, :Integer, null: false, default: 1
  end
end
