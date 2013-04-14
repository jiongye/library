class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.references :temple
      t.references :category
      t.string :author
      t.string :shelve_location

      t.timestamps
    end
    add_index :books, :temple_id
    add_index :books, :category_id
  end
end
