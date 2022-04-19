class CreateCategoryDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :category_details do |t|
      t.integer :item_id
      t.integer :category_id

      t.timestamps
    end
  end
end
