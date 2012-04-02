class CoursePeriod < ActiveRecord::Base
  belongs_to :course
  attr_accessible :start_date
end
