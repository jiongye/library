class CreateTemples < ActiveRecord::Migration
  def change
    create_table :temples do |t|
      t.string :name

      t.timestamps
    end
  end
end
