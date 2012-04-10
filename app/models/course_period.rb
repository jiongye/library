class CoursePeriod < ActiveRecord::Base
  belongs_to :course
  attr_accessible :start_date, :course_id

  validates_presence_of :course
end
