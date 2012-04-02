class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :user
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :apt
      t.string :city
      t.string :state
      t.string :zip
      t.string :homephone
      t.string :cellphone
      t.string :workphone

      t.timestamps
    end
    add_index :contacts, :user_id
  end
end
