class AddLibraryIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :library_id, :string, :limit => 5
  end
end
