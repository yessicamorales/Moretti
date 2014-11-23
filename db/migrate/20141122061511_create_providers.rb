class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :contact
      t.string :phone
      t.string :address
      t.timestamps
    end
  end
end
