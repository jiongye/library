class AddMoreFieldsRelatedToBooks < ActiveRecord::Migration
  def change
    add_column :books, :book_number, :string
    add_column :books, :label, :string
    add_column :inventories, :shelve_quantity, :integer
  end
end
