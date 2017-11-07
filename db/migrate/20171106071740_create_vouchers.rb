class CreateVouchers < ActiveRecord::Migration[5.1]
  def change
    create_table :vouchers do |t|
      t.string :code
      t.string :valid_from
      t.string :valid_through
      t.decimal :amount
      t.string :unit
      t.decimal :max_amount
    end
  end
end
