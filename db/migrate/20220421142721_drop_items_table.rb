class DropItemsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :items do |t|
      t.string :name
      t.float :price
      t.text :description
      
      t.timestamps
    end
  end
end
