class CreateLendings < ActiveRecord::Migration
  def change
    create_table :lendings do |t|
      t.references :book
      t.date :date_of_lend
      t.date :date_of_return
      t.date :due_date
      t.references :user
      t.references :course_period

      t.timestamps
    end
    add_index :lendings, :book_id
    add_index :lendings, :user_id
    add_index :lendings, :course_period_id
  end
end
