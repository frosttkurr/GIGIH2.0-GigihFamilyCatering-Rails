class ChangeItemIdColumnToMenuIdOnCategoryDetails < ActiveRecord::Migration[7.0]
  def change
    rename_column :category_details, :item_id, :menu_id
  end
end
