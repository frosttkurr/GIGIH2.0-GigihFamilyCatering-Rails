class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :owner_id
      t.string :customer_email
      t.float :total
      t.string :status

      t.timestamps
    end
  end
end
