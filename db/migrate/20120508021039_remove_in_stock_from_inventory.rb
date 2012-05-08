class RemoveInStockFromInventory < ActiveRecord::Migration
  def up
    remove_column :inventories, :in_stock
  end

  def down
    add_column :inventories, :in_stock, :integer
  end
end
