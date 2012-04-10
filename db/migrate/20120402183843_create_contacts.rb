class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :apt
      t.string :city
      t.string :state
      t.string :zip
      t.string :home_phone
      t.string :cell_phone
      t.string :work_phone

      t.timestamps
    end
    add_index :contacts, :user_id
  end
end
