class RemoveColumsFromBook < ActiveRecord::Migration
  def up
    remove_column :books, :date_received
  end

  def down
    add_column :books, :date_received, :date
  end
end
