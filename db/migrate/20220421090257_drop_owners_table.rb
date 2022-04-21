class DropOwnersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :owners do |t|
      t.string :name
      t.string :username
      t.string :password
      
      t.timestamps
    end
  end
end
