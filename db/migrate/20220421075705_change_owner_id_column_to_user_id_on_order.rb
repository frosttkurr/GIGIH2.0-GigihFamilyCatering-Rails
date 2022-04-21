class ChangeOwnerIdColumnToUserIdOnOrder < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :owner_id, :user_id
  end
end
