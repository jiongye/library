class CreateCoursePeriods < ActiveRecord::Migration
  def change
    create_table :course_periods do |t|
      t.date :start_date
      t.references :course

      t.timestamps
    end
    add_index :course_periods, :course_id
  end
end
