class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :item_id
      t.float :item_price
      t.integer :quantity
      t.float :sub_total

      t.timestamps
    end
  end
end
