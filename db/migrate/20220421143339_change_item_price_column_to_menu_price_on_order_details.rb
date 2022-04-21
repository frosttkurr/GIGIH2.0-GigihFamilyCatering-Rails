class ChangeItemPriceColumnToMenuPriceOnOrderDetails < ActiveRecord::Migration[7.0]
  def change
    rename_column :order_details, :item_price, :menu_price
  end
end
