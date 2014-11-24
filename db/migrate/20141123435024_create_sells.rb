class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.integer :table
      t.float :total
      t.float :subtotal
      t.integer :order_id

      t.timestamps
    end
  end
end
