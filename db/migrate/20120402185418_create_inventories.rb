class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :book
      t.integer :borrow_out, :default => 0
      t.integer :quantity, :default => 0

      t.timestamps
    end
    add_index :inventories, :book_id
  end
end
