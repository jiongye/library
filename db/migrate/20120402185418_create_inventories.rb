class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :book
      t.integer :borrow_out
      t.integer :temple_out
      t.integer :course_out
      t.integer :quantity
      t.integer :in_stock

      t.timestamps
    end
    add_index :inventories, :book_id
  end
end
