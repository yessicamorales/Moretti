class CreateProviderProducts < ActiveRecord::Migration
  def change
    create_table :provider_products do |t|
      t.integer :provider_id
      t.integer :product_id

      t.timestamps
    end
  end
end
