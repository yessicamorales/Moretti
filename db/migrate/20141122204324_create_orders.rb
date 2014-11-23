class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :table

      t.timestamps
    end
  end
end
