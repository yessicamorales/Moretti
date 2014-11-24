class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :table
      t.boolean :pay, {default:false}
      
      t.timestamps
    end
  end
end
