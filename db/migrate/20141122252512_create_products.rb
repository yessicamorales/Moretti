class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.float :price
      t.integer :quantity
      t.boolean :manufactured
      
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
